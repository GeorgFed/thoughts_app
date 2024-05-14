import 'package:dio/dio.dart';

import '../../../common/logger.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/network/exceptions/network_exception.dart';
import '../domain/chatbot_repository.dart';
import '../domain/models/suggestion_result_model.dart';

class ChatbotRepositoryImpl implements ChatbotRepository {
  final DioClient _dioClient;

  ChatbotRepositoryImpl(this._dioClient);

  @override
  SuggestionResultModel? get suggestionResult => _suggestionResult;

  SuggestionResultModel? _suggestionResult;

  @override
  Future<SuggestionResultModel> getMeditationSuggestion(String prompt) async {
    try {
      final chatId = await _createChat();
      final response = await _getChatbotResponse(
        prompt: prompt,
        chatId: chatId,
      );

      if (response.suggestedMeditations == []) {
        throw NetworkException(
          message:
              'ИИ не смог вам предложить медитацию. Пожалуйста, попробуйте точнее описать ваше состояние',
        );
      }

      _suggestionResult = response;
      return response;
    } on NetworkException catch (_) {
      rethrow;
    }
  }

  Future<String> _createChat() async {
    try {
      final response = await _dioClient.core.post<Map<String, dynamic>>(
        '/chat/',
      );

      return response.data!['id'] as String;
    } on DioException catch (e) {
      logger.e(e);
      throw NetworkException(
        message: 'Не удалось связаться с ИИ – пожалуйста, повторите позже',
      );
    }
  }

  Future<SuggestionResultModel> _getChatbotResponse({
    required String prompt,
    required String chatId,
  }) async {
    try {
      final response = await _dioClient.core.post<Map<String, dynamic>>(
        '/chatbot/',
        data: {
          'message': prompt,
          'chat_id': chatId,
        },
      );

      return SuggestionResultModel.fromJson(response.data!);
    } on DioException catch (e) {
      logger.e(e);
      throw NetworkException(
        message: 'Не удалось получить ответ – пожалуйста, повторите позже',
      );
    }
  }
}
