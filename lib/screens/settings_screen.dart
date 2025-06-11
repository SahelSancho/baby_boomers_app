import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  double _fontSize = 1.0;

  @override
  Widget build(BuildContext context) {
    // CORREÇÃO: Adicionado um Scaffold para prover o "Material" que o Slider precisa.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ajustes de Acessibilidade',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            const Text(
              'Tamanho da Fonte:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Slider(
              value: _fontSize,
              min: 0.8,
              max: 1.5,
              divisions: 7,
              label: 'Fonte: ${(_fontSize * 100).toStringAsFixed(0)}%',
              onChanged: (value) {
                setState(() {
                  _fontSize = value;
                });
              },
            ),
            const SizedBox(height: 16),
            Text(
              'Este é um exemplo de texto. Você pode ajustar o tamanho dele usando o controle deslizante acima para melhorar sua leitura.',
              style: TextStyle(fontSize: 16 * _fontSize),
            ),
            const Divider(height: 48),
            const Text(
              'Contraste (Em breve):',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              'Funcionalidade para ajustar o contraste da tela será adicionada em futuras atualizações.',
              style: TextStyle(fontSize: 16),
            ),
            const Divider(height: 48),
            const Text(
              'Navegação Simplificada (Em breve):',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              'Opções para simplificar a navegação do aplicativo serão adicionadas em futuras atualizações.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}