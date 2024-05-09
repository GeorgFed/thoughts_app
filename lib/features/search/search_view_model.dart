import 'package:bloc/bloc.dart';

import '../meditation/domain/meditation_repository.dart';
import '../meditation/meditation_item.dart';

part 'search_state.dart';

class SearchViewModel extends Cubit<SearchState> {
  final MeditationRepository meditationRepository;
  SearchViewModel({
    required this.meditationRepository,
  }) : super(SearchStateIdle());

  void onInit() {
    final meditations = meditationRepository.meditations;
    emit(
      SearchStateData(
        meditationItems: meditations
                ?.map(
                  (it) => MeditationItem(
                    id: it.id,
                    title: it.title,
                    author: it.narrator?.name ?? '',
                    coverUrl: it.coverUrl,
                    tags: it.tags,
                  ),
                )
                .toList() ??
            [],
      ),
    );
  }

  void onSearch(String query) {
    final queryLowerCase = query.toLowerCase();
    final meditations = meditationRepository.meditations;
    final result = meditations?.where(
      (element) =>
          element.title.toLowerCase().contains(queryLowerCase) ||
          (element.narrator?.name ?? '')
              .toLowerCase()
              .contains(queryLowerCase) ||
          (element.category?.name ?? '').toLowerCase().contains(queryLowerCase),
    );

    emit(
      SearchStateData(
        meditationItems: result
                ?.map(
                  (it) => MeditationItem(
                    id: it.id.toString(),
                    title: it.title,
                    author: it.narrator?.name ?? '',
                    coverUrl: it.coverUrl,
                    tags: it.tags,
                  ),
                )
                .toList() ??
            [],
      ),
    );
  }
}
