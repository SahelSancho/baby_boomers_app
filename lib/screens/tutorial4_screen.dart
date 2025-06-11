import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Tutorial4Screen extends StatefulWidget {
  const Tutorial4Screen({super.key});

  @override
  State<Tutorial4Screen> createState() => _Tutorial4ScreenState();
}

class _Tutorial4ScreenState extends State<Tutorial4Screen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Vídeo sobre como usar o Google Maps
    _controller = YoutubePlayerController(
      initialVideoId: 'oU423YlG-aI', // ID do vídeo do YouTube
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
      appBar: AppBar(title: const Text("Tutorial 4")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Como Usar o GPS para Chegar em Lugares',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Nunca mais se perca! Aprenda a usar o aplicativo de mapas do seu celular para encontrar endereços, ver o melhor caminho e chegar ao seu destino com tranquilidade.',
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