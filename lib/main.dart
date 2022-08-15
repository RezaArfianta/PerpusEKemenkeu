import 'package:flutter/material.dart';
import 'package:perpuskemenkeu/screenpage/katalog.dart';
import 'models/buku.dart';
import 'services.dart';
import 'widgets/card_buku.dart';
import 'screenpage/home.dart';

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
      ),
      home: const Home(title: 'Perpustakaan'),
    );
  }
}
