import 'dart:convert';
import 'dart:io';

import 'package:ai_chat/models/chat_model.dart';
import 'package:http/http.dart' as http;

class SendMessageService {
  Future<List<ChatModel>> sendMessage({required String msg}) async {
    String apiUrl = 'https://api.openai.com/v1/chat/completions';
    String apikey = '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';

    var response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        "Authorization": "Bearer $apikey ",
        "Content-Type": "application/json",
      },
      body: jsonEncode(
        {
          "model": "gpt-3.5-turbo",
          "messages": [
            {"role": "user", "content": msg}
          ],
          "temperature": 0.7
        },
      ),
    );

    Map<String, dynamic> jsonData = jsonDecode(response.body);

    if (jsonData['error'] != null) {
      throw HttpException(jsonData['error']['message']);
    }

    List<ChatModel> chatList = [];

    try {
      if (jsonData['choices'].length > 0) {
        chatList = List.generate(
          jsonData['choices'].length,
          (index) => ChatModel.fromjson(
            jsonData['choices'][0]['message']['content'],
            1,
          ),
        );
      }
      return chatList;
    } catch (e) {
      throw '$e';
    }
  }
}
