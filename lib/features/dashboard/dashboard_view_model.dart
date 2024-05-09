import 'package:bloc/bloc.dart';

import '../../core/network/exceptions/network_exception.dart';
import '../auth/domain/auth_repository.dart';
import '../meditation/domain/meditation_repository.dart';
import '../meditation/domain/model/category_model.dart';
import '../meditation/domain/model/meditation_model.dart';

part 'dashboard_state.dart';

class DashboardViewModel extends Cubit<DashboardState> {
  final MeditationRepository meditationRepository;
  final AuthRepository authRepository;

  DashboardViewModel({
    required this.meditationRepository,
    required this.authRepository,
  }) : super(DashboardStateIdle());

  Future<void> onInit() async {
    emit(DashboardStateLoading());

    try {
      await authRepository.authorize();

      await meditationRepository.fetchData();

      final recommendedMeditations =
          meditationRepository.recommendedMeditations;
      final categories = meditationRepository.categories;

      if (recommendedMeditations == null || categories == null) {
        _emitUnknownError();
        return;
      }
      emit(
        DashboardStateData.fromData(
          'Егор',
          recommendedMeditations,
          categories,
        ),
      );
    } on NetworkException catch (e) {
      _emitNetworkError(e.message, e.title);
    } on Exception catch (_) {
      _emitUnknownError();
    }
  }

  void _emitNetworkError(
    String message,
    String? title,
  ) =>
      emit(
        DashboardStateError(
          message: message,
          title: title,
        ),
      );

  void _emitUnknownError() {
    emit(
      DashboardStateError(
        title: 'Неизвестная ошибка',
        message: 'Пожалуйста, попробуйте позже',
      ),
    );
  }
}
