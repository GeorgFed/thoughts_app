import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:thoughts_app/features/meditation/domain/meditation_repository.dart';
import 'package:thoughts_app/features/meditation/domain/model/category_model.dart';
import 'package:thoughts_app/features/meditation/domain/model/meditation_model.dart';
import 'package:thoughts_app/features/meditation/domain/model/narrator_model.dart';
import 'package:thoughts_app/features/playlist/playlist_view_model.dart';

import 'playlist_view_model_test.mocks.dart';

@GenerateMocks([MeditationRepository])
void main() {
  late MockMeditationRepository mockMeditationRepository;
  late PlaylistViewModel playlistViewModel;

  setUp(() {
    mockMeditationRepository = MockMeditationRepository();
    playlistViewModel =
        PlaylistViewModel(meditationRepository: mockMeditationRepository);
  });

  group('PlaylistViewModel', () {
    blocTest<PlaylistViewModel, PlaylistState>(
      'emits [PlaylistStateData] when initialized with a valid category ID',
      build: () {
        when(mockMeditationRepository.categoryById('1')).thenReturn(
          const CategoryModel(id: '1', name: 'Category 1'),
        );
        when(mockMeditationRepository.meditationsByCategory('1')).thenReturn([
          MeditationModel(
            id: '1',
            title: 'Meditation 1',
            coverUrl: 'cover1.jpg',
            trackUrl: 'track1.mp3',
            tags: [],
            category: const CategoryModel(id: '1', name: 'Category 1'),
            narrator: const NarratorModel(id: '1', name: 'Narrator 1'),
          ),
          MeditationModel(
            id: '2',
            title: 'Meditation 2',
            coverUrl: 'cover2.jpg',
            trackUrl: 'track2.mp3',
            tags: [],
            category: const CategoryModel(id: '1', name: 'Category 1'),
            narrator: const NarratorModel(id: '2', name: 'Narrator 2'),
          ),
        ]);
        return playlistViewModel;
      },
      act: (bloc) => bloc.onInit(categoryId: '1'),
      expect: () => [
        isA<PlaylistStateData>(),
      ],
      verify: (_) {
        final state = playlistViewModel.state as PlaylistStateData;
        expect(state.categoryName, 'Category 1');
        expect(state.playlistItems.length, 2);
        expect(state.playlistItems[0].title, 'Meditation 1');
        expect(state.playlistItems[0].author, 'Narrator 1');
        expect(state.playlistItems[1].title, 'Meditation 2');
        expect(state.playlistItems[1].author, 'Narrator 2');
      },
    );

    blocTest<PlaylistViewModel, PlaylistState>(
      'emits [PlaylistStateData] with empty playlist when category has no meditations',
      build: () {
        when(mockMeditationRepository.categoryById('1')).thenReturn(
          const CategoryModel(id: '1', name: 'Category 1'),
        );
        when(mockMeditationRepository.meditationsByCategory('1'))
            .thenReturn([]);
        return playlistViewModel;
      },
      act: (bloc) => bloc.onInit(categoryId: '1'),
      expect: () => [
        isA<PlaylistStateData>(),
      ],
      verify: (_) {
        final state = playlistViewModel.state as PlaylistStateData;
        expect(state.categoryName, 'Category 1');
        expect(state.playlistItems.isEmpty, true);
      },
    );

    blocTest<PlaylistViewModel, PlaylistState>(
      'emits [PlaylistStateData] with empty category name and playlist when category ID is invalid',
      build: () {
        when(mockMeditationRepository.categoryById('invalid')).thenReturn(null);
        when(mockMeditationRepository.meditationsByCategory('invalid'))
            .thenReturn(null);
        return playlistViewModel;
      },
      act: (bloc) => bloc.onInit(categoryId: 'invalid'),
      expect: () => [
        isA<PlaylistStateData>(),
      ],
      verify: (_) {
        final state = playlistViewModel.state as PlaylistStateData;
        expect(state.categoryName, '');
        expect(state.playlistItems.isEmpty, true);
      },
    );
  });
}
