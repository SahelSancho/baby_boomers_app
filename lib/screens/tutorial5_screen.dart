import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Tutorial5Screen extends StatefulWidget {
  const Tutorial5Screen({super.key});

  @override
  State<Tutorial5Screen> createState() => _Tutorial5ScreenState();
}

class _Tutorial5ScreenState extends State<Tutorial5Screen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Vídeo sobre o golpe da prova de vida do INSS
    _controller = YoutubePlayerController(
      initialVideoId: 'Q5q_a51I93U', // ID do vídeo do YouTube
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
      appBar: AppBar(title: const Text("Tutorial 5")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Cuidado com o Golpe do INSS',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Muitos golpistas se passam por funcionários do INSS para roubar dados de aposentados. Entenda como o golpe da "prova de vida" funciona e como se proteger.',
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