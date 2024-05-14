import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:thoughts_app/features/meditation/domain/meditation_repository.dart';
import 'package:thoughts_app/features/meditation/domain/model/category_model.dart';
import 'package:thoughts_app/features/meditation/domain/model/meditation_model.dart';
import 'package:thoughts_app/features/meditation/domain/model/narrator_model.dart';
import 'package:thoughts_app/features/search/search_view_model.dart';

import 'search_view_model_test.mocks.dart';

@GenerateMocks([MeditationRepository])
void main() {
  late MockMeditationRepository mockMeditationRepository;
  late SearchViewModel searchViewModel;

  setUp(() {
    mockMeditationRepository = MockMeditationRepository();
    searchViewModel =
        SearchViewModel(meditationRepository: mockMeditationRepository);
  });

  group('SearchViewModel - onInit', () {
    blocTest<SearchViewModel, SearchState>(
      'emits [SearchStateData] with all meditations when onInit is called',
      build: () {
        when(mockMeditationRepository.meditations).thenReturn([
          MeditationModel(
            id: '1',
            title: 'Meditation 1',
            coverUrl: 'cover1.jpg',
            trackUrl: 'track1.mp3',
            tags: ['tag1'],
            narrator: const NarratorModel(id: '1', name: 'Narrator 1'),
            category: const CategoryModel(id: '1', name: 'Category 1'),
          ),
          MeditationModel(
            id: '2',
            title: 'Meditation 2',
            coverUrl: 'cover2.jpg',
            trackUrl: 'track2.mp3',
            tags: ['tag2'],
            narrator: const NarratorModel(id: '2', name: 'Narrator 2'),
            category: const CategoryModel(id: '2', name: 'Category 2'),
          ),
        ]);
        return searchViewModel;
      },
      act: (bloc) => bloc.onInit(),
      expect: () => [
        isA<SearchStateData>().having(
          (state) => state.meditationItems.length,
          'meditationItems length',
          2,
        ),
      ],
      verify: (_) {
        verify(mockMeditationRepository.meditations).called(1);
      },
    );
  });

  group('SearchViewModel - onSearch', () {
    blocTest<SearchViewModel, SearchState>(
      'emits [SearchStateData] with filtered meditations when onSearch is called with a query',
      build: () {
        when(mockMeditationRepository.meditations).thenReturn([
          MeditationModel(
            id: '1',
            title: 'Meditation 1',
            coverUrl: 'cover1.jpg',
            trackUrl: 'track1.mp3',
            tags: ['tag1'],
            narrator: const NarratorModel(id: '1', name: 'Narrator 1'),
            category: const CategoryModel(id: '1', name: 'Category 1'),
          ),
          MeditationModel(
            id: '2',
            title: 'Meditation 2',
            coverUrl: 'cover2.jpg',
            trackUrl: 'track2.mp3',
            tags: ['tag2'],
            narrator: const NarratorModel(id: '2', name: 'Narrator 2'),
            category: const CategoryModel(id: '2', name: 'Category 2'),
          ),
        ]);
        return searchViewModel;
      },
      act: (bloc) => bloc.onSearch('Meditation 1'),
      expect: () => [
        isA<SearchStateData>()
            .having(
              (state) => state.meditationItems.length,
              'meditationItems length',
              1,
            )
            .having(
              (state) => state.meditationItems[0].title,
              'meditationItem title',
              'Meditation 1',
            ),
      ],
      verify: (_) {
        verify(mockMeditationRepository.meditations).called(1);
      },
    );

    blocTest<SearchViewModel, SearchState>(
      'emits [SearchStateData] with empty list when onSearch is called with a query that has no matches',
      build: () {
        when(mockMeditationRepository.meditations).thenReturn([
          MeditationModel(
            id: '1',
            title: 'Meditation 1',
            coverUrl: 'cover1.jpg',
            trackUrl: 'track1.mp3',
            tags: ['tag1'],
            narrator: const NarratorModel(id: '1', name: 'Narrator 1'),
            category: const CategoryModel(id: '1', name: 'Category 1'),
          ),
          MeditationModel(
            id: '2',
            title: 'Meditation 2',
            coverUrl: 'cover2.jpg',
            trackUrl: 'track2.mp3',
            tags: ['tag2'],
            narrator: const NarratorModel(id: '2', name: 'Narrator 2'),
            category: const CategoryModel(id: '2', name: 'Category 2'),
          ),
        ]);
        return searchViewModel;
      },
      act: (bloc) => bloc.onSearch('Non-existing Meditation'),
      expect: () => [
        isA<SearchStateData>().having(
          (state) => state.meditationItems.length,
          'meditationItems length',
          0,
        ),
      ],
      verify: (_) {
        verify(mockMeditationRepository.meditations).called(1);
      },
    );
  });
}
