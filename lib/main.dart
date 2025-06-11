import 'package:flutter/material.dart';
import 'package:baby_boomers_app/screens/home_screen.dart';
import 'package:baby_boomers_app/screens/main_menu_screen.dart';
import 'package:baby_boomers_app/screens/tutorial_list_screen.dart';
import 'package:baby_boomers_app/screens/quick_guide_screen.dart';
import 'package:baby_boomers_app/screens/digital_glossary_screen.dart';
import 'package:baby_boomers_app/screens/assistive_support_screen.dart';
import 'package:baby_boomers_app/screens/settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inicio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vá para a tela de LISTA DE TUTORIAIS e escolha o que preferir.'),
          duration: Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    
    if (index >= 5) {
      Widget screen;
      if (index == 5) screen = const DigitalGlossaryScreen();
      else if (index == 6) screen = const AssistiveSupportScreen();
      else screen = const SettingsScreen();
      
      Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }
  
  final List<Widget> _widgetOptions = [
    HomeScreen(onStartPressed: () {}),
    MainMenuScreen(onNavigate: (int index) {}),
    const TutorialListScreen(),
    const QuickGuideScreen(),
    Container(), 
  ];

  @override
  void initState() {
    super.initState();
    _widgetOptions[0] = HomeScreen(onStartPressed: () => _onItemTapped(2));
    _widgetOptions[1] = MainMenuScreen(onNavigate: _onItemTapped);
  }

  @override
  Widget build(BuildContext context) {
    String currentTitle;
    switch (_selectedIndex) {
      case 0:
        currentTitle = "Inicio";
        break;
      case 1:
        currentTitle = "Menu Principal";
        break;
      case 2:
        currentTitle = "Lista de Tutoriais";
        break;
      case 3:
        currentTitle = "Guia Rápido em PDF";
        break;
      default:
        currentTitle = "Inicio";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(currentTitle),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu Adicional',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text('Glossário Digital'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(5);
              },
            ),
            ListTile(
              leading: const Icon(Icons.support_agent),
              title: const Text('Suporte Assistivo'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(6);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configurações'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(7);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'LISTA DE TUTORIAIS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.picture_as_pdf),
            label: 'Guia Rapido em PDF',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'TUTORIAIS',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
      ),
    );
  }
}