import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:thoughts_app/core/network/exceptions/network_exception.dart';
import 'package:thoughts_app/features/auth/domain/auth_repository.dart';
import 'package:thoughts_app/features/dashboard/dashboard_view_model.dart';
import 'package:thoughts_app/features/meditation/domain/meditation_repository.dart';
import 'package:thoughts_app/features/meditation/domain/model/category_model.dart';
import 'package:thoughts_app/features/meditation/domain/model/meditation_model.dart';
import 'package:thoughts_app/features/profile/domain/profile_repository.dart';

import 'dashboard_view_model_test.mocks.dart';

@GenerateMocks([AuthRepository, MeditationRepository, ProfileRepository])
void main() {
  late MockAuthRepository mockAuthRepository;
  late MockMeditationRepository mockMeditationRepository;
  late MockProfileRepository mockProfileRepository;
  late DashboardViewModel dashboardViewModel;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    mockMeditationRepository = MockMeditationRepository();
    mockProfileRepository = MockProfileRepository();

    dashboardViewModel = DashboardViewModel(
      authRepository: mockAuthRepository,
      meditationRepository: mockMeditationRepository,
      profileRepository: mockProfileRepository,
    );
  });

  group('DashboardViewModel', () {
    blocTest<DashboardViewModel, DashboardState>(
      'emits [DashboardStateLoading, DashboardStateData] when data is fetched successfully',
      build: () {
        when(mockAuthRepository.authorize()).thenAnswer((_) async {});
        when(mockProfileRepository.getUserName())
            .thenAnswer((_) async => 'John Doe');
        when(mockMeditationRepository.fetchData()).thenAnswer((_) async {});
        when(mockMeditationRepository.recommendedMeditations).thenReturn([
          MeditationModel(
            id: '1',
            title: 'Meditation 1',
            category: const CategoryModel(id: '1', name: 'Category 1'),
            coverUrl: '',
            trackUrl: '',
            tags: [],
          ),
        ]);
        when(mockMeditationRepository.categories).thenReturn([
          const CategoryModel(id: '1', name: 'Category 1'),
        ]);
        return dashboardViewModel;
      },
      act: (bloc) => bloc.onInit(),
      expect: () => [
        isA<DashboardStateLoading>(),
        isA<DashboardStateData>(),
      ],
      verify: (_) {
        final state = dashboardViewModel.state as DashboardStateData;
        expect(state.name, 'John Doe');
        expect(state.suggestedMeditations.length, 1);
        expect(state.categories.length, 1);
      },
    );

    blocTest<DashboardViewModel, DashboardState>(
      'emits [DashboardStateLoading, DashboardStateError] when NetworkException is thrown',
      build: () {
        when(mockAuthRepository.authorize()).thenAnswer((_) async {});
        when(mockProfileRepository.getUserName())
            .thenAnswer((_) async => 'John Doe');
        when(mockMeditationRepository.fetchData()).thenThrow(
          NetworkException(
            message: 'Network error',
            title: 'Network Error',
          ),
        );
        return dashboardViewModel;
      },
      act: (bloc) => bloc.onInit(),
      expect: () => [
        isA<DashboardStateLoading>(),
        isA<DashboardStateError>(),
      ],
      verify: (_) {
        final state = dashboardViewModel.state as DashboardStateError;
        expect(state.title, 'Network Error');
        expect(state.message, 'Network error');
      },
    );

    blocTest<DashboardViewModel, DashboardState>(
      'emits [DashboardStateLoading, DashboardStateError] when an unknown exception is thrown',
      build: () {
        when(mockAuthRepository.authorize()).thenAnswer((_) async {});
        when(mockProfileRepository.getUserName())
            .thenAnswer((_) async => 'John Doe');
        when(mockMeditationRepository.fetchData()).thenThrow(Exception());
        return dashboardViewModel;
      },
      act: (bloc) => bloc.onInit(),
      expect: () => [
        isA<DashboardStateLoading>(),
        isA<DashboardStateError>(),
      ],
      verify: (_) {
        final state = dashboardViewModel.state as DashboardStateError;
        expect(state.title, 'Неизвестная ошибка');
        expect(state.message, 'Пожалуйста, попробуйте позже');
      },
    );
  });
}
