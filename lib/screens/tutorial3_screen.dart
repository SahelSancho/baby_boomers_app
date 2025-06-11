import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Tutorial3Screen extends StatefulWidget {
  const Tutorial3Screen({super.key});

  @override
  State<Tutorial3Screen> createState() => _Tutorial3ScreenState();
}

class _Tutorial3ScreenState extends State<Tutorial3Screen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Vídeo sobre como identificar notícias falsas
    _controller = YoutubePlayerController(
      initialVideoId: 'L8eKMLMv-jQ', // ID do vídeo do YouTube
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tutorial 3")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Como Identificar Fake News',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Aprender a desconfiar de informações e verificar as fontes é o passo mais importante para não cair em notícias falsas. Assista ao vídeo para dicas práticas.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 24),
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}