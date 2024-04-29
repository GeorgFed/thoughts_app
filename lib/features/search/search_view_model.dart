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
    emit(
      SearchStateData(
        meditationItems: meditationRepository.meditations
                ?.map(
                  (it) => MeditationItem(
                    id: it.id.toString(),
                    title: it.title,
                    author: it.author,
                    coverUrl: it.cover,
                    tags: it.tags,
                  ),
                )
                .toList() ??
            [],
      ),
    );
  }

  void onSearch(String query) {
    final queryLower = query.toLowerCase();
    final result = meditationRepository.meditations?.where(
      (element) =>
          element.title.toLowerCase().contains(queryLower) ||
          element.author.toLowerCase().contains(queryLower) ||
          element.category.toLowerCase().contains(queryLower),
    );

    emit(
      SearchStateData(
        meditationItems: result
                ?.map(
                  (it) => MeditationItem(
                    id: it.id.toString(),
                    title: it.title,
                    author: it.author,
                    coverUrl: it.cover,
                    tags: it.tags,
                  ),
                )
                .toList() ??
            [],
      ),
    );
  }
}
