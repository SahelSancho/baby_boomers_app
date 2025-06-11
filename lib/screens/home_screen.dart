import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onStartPressed;

  const HomeScreen({
    super.key, 
    required this.onStartPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Certifique-se que a imagem está em assets/images/
          Image.asset('assets/images/elderly_person_with_phone.png'),
          const SizedBox(height: 20),
          const Text(
            'Bem-vindo ao App de Ajuda Digital!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
           const SizedBox(height: 10),
          const Text(
            'Seu guia para navegar no mundo da tecnologia com confiança.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            // Ação do botão corrigida para chamar a função recebida
            onPressed: onStartPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              textStyle: const TextStyle(fontSize: 18),
            ),
            child: const Text(
              'Começar',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}