import 'package:bloc/bloc.dart';

import '../meditation/domain/meditation_repository.dart';

part 'dashboard_state.dart';

class DashboardViewModel extends Cubit<DashboardState> {
  final MeditationRepository meditationRepository;

  DashboardViewModel({
    required this.meditationRepository,
  }) : super(DashboardStateIdle());

  Future<void> onInit() async {
    emit(DashboardStateLoading());
    final meditations = await meditationRepository.meditations;
    final categories = await meditationRepository.categories;
    emit(
      DashboardStateData(
        name: 'Егор',
        suggestedMeditations: meditations
                ?.take(3)
                .map(
                  (it) => MeditationPromoItem(
                    title: it.title,
                    imageUrl: it.coverUrl,
                    id: it.id.toString(),
                  ),
                )
                .toList() ??
            [],
        categories: categories
                ?.map(
                  (it) => PlaylistItem(
                    title: it.name,
                    id: it.id.toString(),
                  ),
                )
                .toList() ??
            [],
      ),
    );
  }
}
