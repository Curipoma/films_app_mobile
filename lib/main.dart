import 'dart:ui';

import 'package:films/screens/home_screen.dart';
import 'package:films/screens/profile.dart';
import 'package:films/screens/favorite_screen.dart';

import './theme//my_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Films',
      theme: ThemeData(
        scaffoldBackgroundColor: MaterialColor(0XFF000000, myColors),
        primarySwatch: MaterialColor(0xFF000000, myColors),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Flims'),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgeteOptions = <Widget>[
    HomeScren(),
    Profile(),
    FavoriteScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SizedBox(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network('https://www.xtrafondos.com/thumbs/1_3472.jpg'),
                  ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                      child: Container(
                        color: Colors.indigo.withOpacity(0.2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: _widgeteOptions[_selectedIndex],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Profile'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: MaterialColor(0xFF000000, myColors),
        selectedItemColor: MaterialColor(0xFFFFFFFF, myColors),
        unselectedItemColor: MaterialColor(0xFF5F5F5F, myColors),
        onTap: _onItemTapped,
      ),
    );
  }
}
