import 'package:bloc/bloc.dart';

import '../meditation/meditation_repository.dart';

part 'dashboard_state.dart';

class DashboardViewModel extends Cubit<DashboardState> {
  final MeditationRepository meditationRepository;

  DashboardViewModel({
    required this.meditationRepository,
  }) : super(DashboardStateIdle());

  Future<void> onInit() async {
    emit(DashboardStateLoading());
    final meditations = await meditationRepository.getMeditations();
    emit(
      DashboardStateData(
        name: 'Егор',
        meditationPromo: meditations
                ?.take(3)
                .map(
                  (it) => MeditationPromoItem(
                    title: it.title,
                    image: it.cover,
                    id: it.id.toString(),
                  ),
                )
                .toList() ??
            [],
        playlists: meditations
                ?.map((it) => it.category)
                .toSet()
                .map(
                  (it) => PlaylistItem(title: it, id: it),
                )
                .toList() ??
            [],
      ),
    );
  }
}
