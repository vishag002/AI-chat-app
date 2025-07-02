import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GeminiService {
  final Dio _dio = Dio();
  final _apiKey = dotenv.env['GEMINI_API_KEY'];
  //final geminiApiKey = dotenv.env['GEMINI_API_KEY'];

  final String _baseUrl =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent';

  Future<String?> generateResponse(String prompt) async {
    try {
      final response = await _dio.post(
        '$_baseUrl?key=$_apiKey',
        data: {
          "contents": [
            {
              "parts": [
                {"text": prompt}
              ]
            }
          ]
        },
      );

      final text =
          response.data["candidates"]?[0]?["content"]?["parts"]?[0]?["text"];
      return text ?? "No response received.";
    } catch (e) {
      print("Gemini API error: $e");
      return "Failed to get response.";
    }
  }
}
