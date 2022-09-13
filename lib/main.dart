import 'package:flutter/material.dart';
import 'package:perpuskemenkeu/screenpage/katalog.dart';
import 'package:perpuskemenkeu/screenpage/riwayat.dart';
import 'screenpage/beranda.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perpus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      home: const Lobby(),
    );
  }
}

class Lobby extends StatefulWidget {
  const Lobby({Key? key}) : super(key: key);

  @override
  State<Lobby> createState() => _LobbyState();
}

class _LobbyState extends State<Lobby> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    Beranda(
      title: 'Perpustakaan',
    ),
    Katalog(title: 'Perpustakaan'),
    RiwayatPage(title: 'Perpustakaan')
  ];
  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTappedBar,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Katalog'),
            BottomNavigationBarItem(
                icon: Icon(Icons.lock_clock), label: 'Riwayat')
          ]),
    );
  }
}
