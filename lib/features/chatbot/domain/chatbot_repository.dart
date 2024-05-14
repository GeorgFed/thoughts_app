import 'models/suggestion_result_model.dart';

abstract class ChatbotRepository {
  Future<SuggestionResultModel> getMeditationSuggestion(String prompt);
}
