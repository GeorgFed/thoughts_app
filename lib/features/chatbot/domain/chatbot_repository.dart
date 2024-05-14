import 'models/suggestion_result_model.dart';

abstract class ChatbotRepository {
  SuggestionResultModel? get suggestionResult;

  Future<SuggestionResultModel> getMeditationSuggestion(String prompt);
}
