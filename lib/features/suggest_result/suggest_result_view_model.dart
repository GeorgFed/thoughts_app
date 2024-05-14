import 'package:bloc/bloc.dart';

import '../chatbot/domain/chatbot_repository.dart';
import '../meditation/domain/meditation_repository.dart';
import '../meditation/meditation_item.dart';

part 'suggest_result_state.dart';

class SuggestResultViewModel extends Cubit<SuggestResultState> {
  final MeditationRepository meditationRepository;
  final ChatbotRepository chatbotRepository;

  SuggestResultViewModel(
    this.meditationRepository,
    this.chatbotRepository,
  ) : super(SuggestResultStateIdle());

  Future<void> onInit() async {
    final suggestion = chatbotRepository.suggestionResult;
    final meditations = meditationRepository.meditations;

    if (suggestion == null || meditations == null) {
      emit(SuggestResultStateError());
      return;
    }

    final suggestedMeditations = meditations.where(
      (element) => suggestion.suggestedMeditations
          .map((it) => it.id.toString())
          .contains(element.id),
    );

    emit(
      SuggestResultStateData(
        message: suggestion.message,
        playlistItems:
            suggestedMeditations.map(MeditationItem.fromModel).toList(),
      ),
    );
  }
}
