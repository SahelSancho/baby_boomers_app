import 'package:flutter/material.dart';
import 'package:baby_boomers_app/screens/digital_glossary_screen.dart';
import 'package:baby_boomers_app/screens/assistive_support_screen.dart';

class MainMenuScreen extends StatelessWidget {
  final Function(int) onNavigate;

  const MainMenuScreen({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Principal'),
        automaticallyImplyLeading: false, // Remove a seta de voltar
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          _buildMenuCard(
            context,
            icon: Icons.school_outlined,
            title: 'Tutoriais',
            subtitle: 'Aprenda passo a passo com vídeos.',
            onTap: () {
              // Navega para a aba de Tutoriais (índice 2)
              onNavigate(2); 
            },
          ),
          _buildMenuCard(
            context,
            icon: Icons.picture_as_pdf_outlined,
            title: 'Guia Rápido',
            subtitle: 'Consulte guias em PDF para baixar.',
            onTap: () {
              // Navega para a aba de Guia Rápido (índice 3)
              onNavigate(3);
            },
          ),
          _buildMenuCard(
            context,
            icon: Icons.book_outlined,
            title: 'Glossário',
            subtitle: 'Entenda os termos do mundo digital.',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const DigitalGlossaryScreen()));
            },
          ),
          _buildMenuCard(
            context,
            icon: Icons.support_agent_outlined,
            title: 'Suporte',
            subtitle: 'Peça ajuda se tiver alguma dúvida.',
            onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => const AssistiveSupportScreen()));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, {required IconData icon, required String title, required String subtitle, required VoidCallback onTap}) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}