import 'package:dio/dio.dart';

class GeminiService {
  final Dio _dio = Dio();
  final String _apiKey = 'AIzaSyB2LzROdoD_24QCl-SjqGin4opsKQz3Rv0';
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
