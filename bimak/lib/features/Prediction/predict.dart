import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../utils/constants/colors.dart';

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Future<Map<String, dynamic>> sendMessage(String question) async {
    final url = Uri.parse(baseUrl);
    final headers = {
      'Content-Type': 'application/json',
      'accept': 'application/json'
    };
    final body = json.encode({
      'question': question,
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to send message');
    }
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  final ApiService apiService =
  ApiService(baseUrl: 'https://73cb-34-16-232-6.ngrok-free.app/ask');

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _messages.add({
          'question': 'Welcome to Bimak Health. How can I help you, champ?',
          'answer': '',
        });
      });
    });
  }

  Future<void> _sendMessage(String message) async {
    if (message.isEmpty) return;

    setState(() {
      _messages.add({'question': message, 'answer': 'Loading...'});
    });

    _controller.clear();

    try {
      final response = await apiService.sendMessage(message);
      setState(() {
        _messages[_messages.length - 1]['answer'] = response['answer'];
      });
    } catch (error) {
      print('Error: $error');
      setState(() {
        _messages[_messages.length - 1]['answer'] = 'Error: Could not get response';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chat with Bimak',
          style: TextStyle(color: Colors.white), // Primary color text
        ),
        centerTitle: true,
        backgroundColor: MColors.primaryColor, // Replace with your primary color
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: MColors.primaryColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          message['question']!,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      if (message['answer'] != 'Loading...' && message['answer'] != '')
                        Container(
                          decoration: BoxDecoration(
                            color: message['answer'] == 'Error: Could not get response'
                                ? Colors.redAccent
                                : MColors.grey, // Replace with your primary color
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            message['answer']!,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter your question',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    final message = _controller.text;
                    _controller.clear();
                    _sendMessage(message);
                  },
                  color: MColors.primaryColor, // Replace with your primary color
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}