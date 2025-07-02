import 'package:ai_chat_application/service/gemini_services.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatController extends StateNotifier<List<ChatMessage>> {
  ChatController() : super(_initialMessages);

  static final ChatUser user = ChatUser(id: '1', firstName: 'Dev');
  static final ChatUser gemini = ChatUser(id: '2', firstName: 'Gemini');

  static final List<ChatMessage> _initialMessages = [
    ChatMessage(
      text: "Hello, how can I help you?",
      user: gemini,
      createdAt: DateTime.now(),
    )
  ];

  final GeminiService _geminiService = GeminiService();

  void sendMessage(ChatMessage message) async {
    state = [message, ...state];
    // Add typing simulation
    final typingMessage = ChatMessage(
      text: "Typing...",
      user: gemini,
      createdAt: DateTime.now(),
    );
    state = [typingMessage, ...state];

    // Get Gemini response
    final response = await _geminiService.generateResponse(message.text);

    // Remove "Typing..."
    state = state.where((msg) => msg.text != "Typing...").toList();

    // Add Gemini response
    final botMessage = ChatMessage(
      text: response ?? "Sorry, I didn't get that.",
      user: gemini,
      createdAt: DateTime.now(),
    );

    state = [botMessage, ...state];
  }
}

final chatProvider = StateNotifierProvider<ChatController, List<ChatMessage>>(
  (ref) => ChatController(),
);
