import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:thoughts_app/features/meditation/domain/meditation_repository.dart';
import 'package:thoughts_app/features/meditation/domain/model/category_model.dart';
import 'package:thoughts_app/features/meditation/domain/model/meditation_model.dart';
import 'package:thoughts_app/features/meditation/domain/model/narrator_model.dart';
import 'package:thoughts_app/features/player/player_view_model.dart';
import 'package:thoughts_app/features/session/session_repository_impl.dart';

import 'player_view_model_test.mocks.dart';

@GenerateMocks([MeditationRepository, SessionRepository])
void main() {
  late MockMeditationRepository mockMeditationRepository;
  late MockSessionRepository mockSessionRepository;
  late PlayerViewModel playerViewModel;

  setUp(() {
    mockMeditationRepository = MockMeditationRepository();
    mockSessionRepository = MockSessionRepository();
    playerViewModel = PlayerViewModel(
      meditationRepository: mockMeditationRepository,
      sessionRepository: mockSessionRepository,
    );
  });

  group('PlayerViewModel - onInit', () {
    blocTest<PlayerViewModel, PlayerPageState>(
      'emits [PlayerStateData] when meditation is found',
      build: () {
        final meditation = MeditationModel(
          id: '1',
          title: 'Meditation 1',
          coverUrl: 'cover1.jpg',
          trackUrl: 'track1.mp3',
          tags: [],
          category: const CategoryModel(id: '1', name: 'Category 1'),
          narrator: const NarratorModel(id: '1', name: 'Narrator 1'),
        );

        when(mockMeditationRepository.meditations).thenReturn([meditation]);
        when(mockMeditationRepository.meditationsByCategory('1'))
            .thenReturn([meditation]);

        return playerViewModel;
      },
      act: (bloc) => bloc.onInit('1'),
      expect: () => [
        isA<PlayerStateData>(),
      ],
      verify: (_) {
        verify(mockMeditationRepository.meditations).called(1);
        verify(mockMeditationRepository.meditationsByCategory('1')).called(1);
        verify(mockSessionRepository.addMeditationSession(meditationId: '1'))
            .called(1);
      },
    );
  });

  group('PlayerViewModel - onNext', () {
    blocTest<PlayerViewModel, PlayerPageState>(
      'emits new state with incremented trackIndex when onNext is called and it is not the last track',
      build: () {
        final initialState = PlayerStateData(
          trackIndex: 0,
          trackItems: [
            TrackItem(
              trackTitle: 'Meditation 1',
              author: 'Narrator 1',
              coverUrl: 'cover1.jpg',
              trackUrl: 'track1.mp3',
            ),
            TrackItem(
              trackTitle: 'Meditation 2',
              author: 'Narrator 2',
              coverUrl: 'cover2.jpg',
              trackUrl: 'track2.mp3',
            ),
          ],
        );

        return playerViewModel..emit(initialState);
      },
      act: (bloc) => bloc.onNext(),
      expect: () => [
        isA<PlayerStateData>()
            .having((state) => state.trackIndex, 'trackIndex', 1),
      ],
    );

    blocTest<PlayerViewModel, PlayerPageState>(
      'does not emit new state when onNext is called and it is the last track',
      build: () {
        final initialState = PlayerStateData(
          trackIndex: 1,
          trackItems: [
            TrackItem(
              trackTitle: 'Meditation 1',
              author: 'Narrator 1',
              coverUrl: 'cover1.jpg',
              trackUrl: 'track1.mp3',
            ),
            TrackItem(
              trackTitle: 'Meditation 2',
              author: 'Narrator 2',
              coverUrl: 'cover2.jpg',
              trackUrl: 'track2.mp3',
            ),
          ],
        );

        return playerViewModel..emit(initialState);
      },
      act: (bloc) => bloc.onNext(),
      expect: () => [],
    );
  });

  group('PlayerViewModel - onPrevious', () {
    blocTest<PlayerViewModel, PlayerPageState>(
      'emits new state with decremented trackIndex when onPrevious is called and it is not the first track',
      build: () {
        final initialState = PlayerStateData(
          trackIndex: 1,
          trackItems: [
            TrackItem(
              trackTitle: 'Meditation 1',
              author: 'Narrator 1',
              coverUrl: 'cover1.jpg',
              trackUrl: 'track1.mp3',
            ),
            TrackItem(
              trackTitle: 'Meditation 2',
              author: 'Narrator 2',
              coverUrl: 'cover2.jpg',
              trackUrl: 'track2.mp3',
            ),
          ],
        );

        return playerViewModel..emit(initialState);
      },
      act: (bloc) => bloc.onPrevious(),
      expect: () => [
        isA<PlayerStateData>()
            .having((state) => state.trackIndex, 'trackIndex', 0),
      ],
    );

    blocTest<PlayerViewModel, PlayerPageState>(
      'does not emit new state when onPrevious is called and it is the first track',
      build: () {
        final initialState = PlayerStateData(
          trackIndex: 0,
          trackItems: [
            TrackItem(
              trackTitle: 'Meditation 1',
              author: 'Narrator 1',
              coverUrl: 'cover1.jpg',
              trackUrl: 'track1.mp3',
            ),
            TrackItem(
              trackTitle: 'Meditation 2',
              author: 'Narrator 2',
              coverUrl: 'cover2.jpg',
              trackUrl: 'track2.mp3',
            ),
          ],
        );

        return playerViewModel..emit(initialState);
      },
      act: (bloc) => bloc.onPrevious(),
      expect: () => [],
    );
  });
}
