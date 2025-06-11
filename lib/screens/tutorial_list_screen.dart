import 'package:flutter/material.dart';
import 'package:baby_boomers_app/screens/tutorial1_screen.dart';
import 'package:baby_boomers_app/screens/tutorial2_screen.dart';
import 'package:baby_boomers_app/screens/tutorial3_screen.dart';
import 'package:baby_boomers_app/screens/tutorial4_screen.dart';
import 'package:baby_boomers_app/screens/tutorial5_screen.dart';

class TutorialListScreen extends StatelessWidget {
  const TutorialListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: const Icon(Icons.photo_library_outlined, color: Colors.blue),
            title: const Text('Tutorial 1: Como enviar fotos no WhatsApp'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Tutorial1Screen()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.video_call_outlined, color: Colors.blue),
            title: const Text('Tutorial 2: Como fazer uma chamada de vídeo'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Tutorial2Screen()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.security_outlined, color: Colors.blue),
            title: const Text('Tutorial 3: Como Identificar Fake News'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Tutorial3Screen()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.map_outlined, color: Colors.blue),
            title: const Text('Tutorial 4: Como Usar o GPS para Chegar em Lugares'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Tutorial4Screen()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.warning_amber_outlined, color: Colors.orange),
            title: const Text('Tutorial 5: Cuidado com o Golpe do INSS'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Tutorial5Screen()),
              );
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}