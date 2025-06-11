import 'package:flutter/material.dart';

class AssistiveSupportScreen extends StatefulWidget {
  const AssistiveSupportScreen({super.key});

  @override
  State<AssistiveSupportScreen> createState() => _AssistiveSupportScreenState();
}

class _AssistiveSupportScreenState extends State<AssistiveSupportScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<String> _messages = [];

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _messages.add(_messageController.text);
        _messageController.clear();
      });
      // Aqui você poderia adicionar uma lógica para uma resposta automática
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
           _messages.add('Obrigado por sua mensagem! Nossa equipe responderá em breve.');
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suporte Assistivo'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _messages.isEmpty ? 1 : _messages.length,
              itemBuilder: (context, index) {
                if (_messages.isEmpty) {
                  return const Center(
                    child: Text('Precisa de ajuda? Digite sua dúvida abaixo!'),
                  );
                }
                final message = _messages[index];
                // Simples verificação para alinhar a mensagem
                bool isUserMessage = !message.startsWith('Obrigado');
                return Align(
                  alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    margin: const EdgeInsets.symmetric(vertical: 4.0),
                    decoration: BoxDecoration(
                      color: isUserMessage ? Colors.blue[100] : Colors.grey[200],
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text(message),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: 'Digite sua mensagem...',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}