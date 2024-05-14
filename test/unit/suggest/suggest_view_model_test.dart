import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:thoughts_app/core/network/exceptions/network_exception.dart';
import 'package:thoughts_app/features/chatbot/domain/chatbot_repository.dart';
import 'package:thoughts_app/features/chatbot/domain/models/suggestion_result_model.dart';
import 'package:thoughts_app/features/suggest/suggest_view_model.dart';

import 'suggest_view_model_test.mocks.dart';

@GenerateMocks([ChatbotRepository])
void main() {
  late MockChatbotRepository mockChatbotRepository;
  late SuggestViewModel suggestViewModel;

  setUp(() {
    mockChatbotRepository = MockChatbotRepository();
    suggestViewModel =
        SuggestViewModel(chatbotRepository: mockChatbotRepository);
  });

  group('SuggestViewModel', () {
    blocTest<SuggestViewModel, SuggestState>(
      'emits [SuggestStateLoading, SuggestStateResult] when suggestion is fetched successfully',
      build: () {
        when(mockChatbotRepository.getMeditationSuggestion(any)).thenAnswer(
          (_) async => const SuggestionResultModel(
            message: 'feeling text',
            suggestedMeditations: [
              SuggestedMeditationModel(id: 1, name: 'tag1'),
              SuggestedMeditationModel(id: 2, name: 'tag2'),
            ],
          ),
        );
        return suggestViewModel;
      },
      act: (bloc) => bloc.onSuggestButtonTap('feeling text', ['tag1', 'tag2']),
      expect: () => [
        isA<SuggestStateLoading>(),
        isA<SuggestStateResult>(),
      ],
      verify: (_) {
        verify(mockChatbotRepository.getMeditationSuggestion(any)).called(1);
      },
    );

    blocTest<SuggestViewModel, SuggestState>(
      'emits [SuggestStateLoading, SuggestStateError] when NetworkException is thrown',
      build: () {
        when(mockChatbotRepository.getMeditationSuggestion(any))
            .thenThrow(NetworkException(message: 'Network error'));
        return suggestViewModel;
      },
      act: (bloc) => bloc.onSuggestButtonTap('feeling text', ['tag1', 'tag2']),
      expect: () => [
        isA<SuggestStateLoading>(),
        isA<SuggestStateError>(),
      ],
      verify: (_) {
        verify(mockChatbotRepository.getMeditationSuggestion(any)).called(1);
      },
    );
  });
}
