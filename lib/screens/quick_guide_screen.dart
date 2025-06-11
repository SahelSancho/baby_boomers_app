import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class QuickGuideScreen extends StatelessWidget {
  const QuickGuideScreen({super.key});

  // Função para abrir a URL
  void _launchURL(String url, BuildContext context) async {
    final Uri uri = Uri.parse(url);
    // ** MUDANÇA APLICADA AQUI **
    // Usando o modo padrão, que é mais seguro e compatível.
    if (!await launchUrl(uri, mode: LaunchMode.platformDefault)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Não foi possível abrir o link: $url'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Toque em um guia abaixo para abrir o PDF. Você poderá ler e baixar o arquivo.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(Icons.security_outlined),
            title: const Text('Cartilha de Segurança para Internet'),
            subtitle: const Text('Aprenda a se proteger de golpes.'),
            trailing: const Icon(Icons.download_for_offline_outlined),
            onTap: () {
              _launchURL('https://cartilha.cert.br/fasciculos/fasciculo-golpes-na-internet.pdf', context);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.phone_android_outlined),
            title: const Text('Guia Básico de Uso do Smartphone'),
            subtitle: const Text('Dicas para iniciantes.'),
            trailing: const Icon(Icons.download_for_offline_outlined),
            onTap: () {
              _launchURL('https://www.gov.br/cidadania/pt-br/arquivos/secretaria-nacional-de-promocao-e-defesa-dos-direitos-da-pessoa-idosa/GuiaCuidar-PessoasIdosasDependentes.pdf', context);
            },
          ),
           const Divider(),
           ListTile(
            leading: const Icon(Icons.chat_bubble_outline),
            title: const Text('Dominando o WhatsApp'),
            subtitle: const Text('Funções úteis do aplicativo.'),
            trailing: const Icon(Icons.download_for_offline_outlined),
            onTap: () {
              _launchURL('https://www.dorconsultoria.com.br/wp-content/uploads/2021/01/Guia-do-WhatsApp-Business-para-iniciantes.pdf', context);
            },
          ),
        ],
      ),
    );
  }
}