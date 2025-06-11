import 'package:flutter/material.dart';

class DigitalGlossaryScreen extends StatefulWidget {
  const DigitalGlossaryScreen({super.key});

  @override
  State<DigitalGlossaryScreen> createState() => _DigitalGlossaryScreenState();
}

class _DigitalGlossaryScreenState extends State<DigitalGlossaryScreen> {
  final TextEditingController _searchController = TextEditingController();
  
  // Lista inicial de termos
  final List<Map<String, String>> _allTerms = [
    {
      'term': 'Aplicativo (App)',
      'definition': 'Programa de computador feito para celulares e tablets. Serve para muitas coisas, como conversar (WhatsApp), ver fotos (Instagram) e jogar.'
    },
    {
      'term': 'Nuvem (Cloud)',
      'definition': 'Um "depósito" na internet onde você pode guardar fotos, arquivos e informações. Assim, você pode acessá-los de qualquer aparelho com internet, sem ocupar a memória do seu celular.'
    },
    {
      'term': 'Wi-Fi',
      'definition': 'É a internet sem fio. Permite que seu celular, computador ou TV se conectem à internet em casa ou em locais públicos sem precisar de cabos.'
    },
    {
      'term': 'Link',
      'definition': 'Um endereço de internet clicável. Geralmente é um texto azul ou sublinhado que te leva para uma página, foto ou documento quando você toca nele.'
    },
    {
      'term': 'Download',
      'definition': 'É o ato de "baixar" algo da internet para o seu aparelho. Por exemplo, baixar uma foto que te enviaram ou instalar um novo aplicativo.'
    },
    {
      'term': 'Upload',
      'definition': 'É o contrário de download. É quando você "envia" algo do seu aparelho para a internet, como postar uma foto em uma rede social ou enviar um arquivo por e-mail.'
    },
    {
      'term': 'Rede Social',
      'definition': 'Sites e aplicativos para conectar pessoas. Servem para compartilhar fotos, vídeos, notícias e conversar com amigos e família. Exemplos: Facebook, Instagram.'
    },
    {
      'term': 'Phishing',
      'definition': 'Um tipo de golpe online. Criminosos enviam e-mails ou mensagens falsas, fingindo ser de empresas conhecidas (como bancos), para tentar roubar suas senhas e dados pessoais. Desconfie sempre!'
    },
     {
      'term': 'Algoritmo',
      'definition': 'Uma sequência de regras ou instruções que um computador segue para realizar uma tarefa. As redes sociais usam algoritmos para decidir o que mostrar no seu feed.'
    },
     {
      'term': 'Backup',
      'definition': 'Uma cópia de segurança dos seus dados importantes (fotos, contatos, conversas). É fundamental para não perder suas informações se o celular quebrar ou for perdido.'
    },
  ];

  List<Map<String, String>> _filteredTerms = [];

  @override
  void initState() {
    super.initState();
    _filteredTerms = _allTerms;
    _searchController.addListener(_filterTerms);
  }

  void _filterTerms() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredTerms = _allTerms.where((term) {
        return term['term']!.toLowerCase().contains(query);
      }).toList();
    });
  }

  void _addTerm(String term, String definition) {
    if (term.isNotEmpty && definition.isNotEmpty) {
      setState(() {
        _allTerms.insert(0, {'term': term, 'definition': definition});
        _filterTerms(); // Atualiza a lista filtrada
      });
      Navigator.of(context).pop(); // Fecha o diálogo
    }
  }

  void _showAddTermDialog() {
    final TextEditingController termController = TextEditingController();
    final TextEditingController defController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Adicionar Nova Palavra'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: termController,
                decoration: const InputDecoration(labelText: 'Palavra-chave'),
              ),
              TextField(
                controller: defController,
                decoration: const InputDecoration(labelText: 'Definição (10-20 linhas)'),
                maxLines: 5,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () => _addTerm(termController.text, defController.text),
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Glossário Digital'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Digite uma palavra para buscar...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredTerms.length,
                itemBuilder: (context, index) {
                  final item = _filteredTerms[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 4.0),
                    child: ExpansionTile(
                      title: Text(
                        item['term']!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            item['definition']!,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTermDialog,
        tooltip: 'Adicionar Palavra',
        child: const Icon(Icons.add),
      ),
    );
  }
}