import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hackify/pages/explore.dart';
import 'package:hackify/pages/home.dart';
import 'package:hackify/pages/login.dart';
import 'package:hackify/pages/profile.dart';
import 'package:hackify/pages/signup.dart';
import 'package:hackify/pages/yourHackathons.dart';
import 'firebase_options.dart';
import 'package:hackify/pages/login2.dart';
import 'package:hackify/pages/signup2.dart';
import 'package:hackify/screens//Welcome/welcome_screen.dart';
import 'package:hackify/constants.dart';
import 'package:hackify/pages/yourHackathons.dart';
import 'package:hackify/card.dart';
import 'package:hackify/pages/createHackathon.dart';

void main() async {
  runApp(const MyApp());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await GetStorage.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Your goto Hackathon app';

  @override
  Widget build(BuildContext context) {
    final getStorageInstance = GetStorage();
    {
      return MaterialApp(
        title: _title,
        home: (getStorageInstance.read("user") != null)
            ? MyStatefulWidget()
            : HackathonFormPage(),
      );
    }
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ExplorePage(),
    YourHackathonPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hackify'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: '', backgroundColor: Colors.black),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
      ),
    );
  }
}
