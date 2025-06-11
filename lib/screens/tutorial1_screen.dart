import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Tutorial1Screen extends StatefulWidget {
  const Tutorial1Screen({super.key});

  @override
  State<Tutorial1Screen> createState() => _Tutorial1ScreenState();
}

class _Tutorial1ScreenState extends State<Tutorial1Screen> {
  late YoutubePlayerController _controller1;
  late YoutubePlayerController _controller2;

  @override
  void initState() {
    super.initState();
    // Vídeo sobre como enviar fotos e vídeos no WhatsApp
    _controller1 = YoutubePlayerController(
      initialVideoId: 'hJqC9Hcof34', // ID do vídeo do YouTube
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    // Vídeo sobre como enviar fotos de visualização única
     _controller2 = YoutubePlayerController(
      initialVideoId: 'Xy7DDb-hXzM', // ID de outro vídeo
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tutorial 1")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Como enviar fotos no WhatsApp',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            const Text(
              'Passo 1: Enviar fotos e vídeos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
             const SizedBox(height: 8),
            const Text(
              'Aprenda como selecionar e enviar mídias para seus contatos.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            YoutubePlayer(
              controller: _controller1,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
            ),
            const SizedBox(height: 24),
            const Text(
              'Passo 2: Fotos de visualização única',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
             const SizedBox(height: 8),
            const Text(
              'Descubra como enviar imagens que só podem ser vistas uma vez.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
             YoutubePlayer(
              controller: _controller2,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}