import 'package:bloc/bloc.dart';

import '../../common/logger.dart';
import '../../core/network/exceptions/network_exception.dart';
import '../chatbot/domain/chatbot_repository.dart';

part 'suggest_state.dart';

class SuggestViewModel extends Cubit<SuggestState> {
  final ChatbotRepository chatbotRepository;

  SuggestViewModel({
    required this.chatbotRepository,
  }) : super(SuggestStateIdle());

  Future<void> onSuggestButtonTap(
    String text,
    List<String> selectedItems,
  ) async {
    try {
      emit(SuggestStateLoading());
      final tagsString = selectedItems.join(', ');
      final prompt = '''
          Based on the following feelings and tags, suggest a suitable meditation:\n\n
          Feelings: $text\n
          Tags: $tagsString\n\n
          Please provide a meditation recommendation that would be most appropriate for the user.
          Answer should be in Russian.
          ''';
      final result = await chatbotRepository.getMeditationSuggestion(prompt);
      logger.d('result: $result');
      emit(SuggestStateResult());
    } on NetworkException catch (e) {
      emit(SuggestStateError(e.message));
    }
  }
}
