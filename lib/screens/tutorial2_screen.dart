import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Tutorial2Screen extends StatefulWidget {
  const Tutorial2Screen({super.key});

  @override
  State<Tutorial2Screen> createState() => _Tutorial2ScreenState();
}

class _Tutorial2ScreenState extends State<Tutorial2Screen> {
  late YoutubePlayerController _controller1;

  @override
  void initState() {
    super.initState();
    // Vídeo ensinando a fazer chamada de vídeo no WhatsApp
    _controller1 = YoutubePlayerController(
      initialVideoId: 'jL4efPffQpA', // ID do vídeo do YouTube
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title: const Text("Tutorial 2")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Como fazer uma chamada de vídeo',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            const Text(
              'Passo a passo completo:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
             const SizedBox(height: 8),
            const Text(
              'Este vídeo mostra como iniciar uma chamada de vídeo no WhatsApp, desde a seleção do contato até o início da conversa.',
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
              'Pronto! Agora você pode conversar por vídeo com seus amigos e familiares.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}