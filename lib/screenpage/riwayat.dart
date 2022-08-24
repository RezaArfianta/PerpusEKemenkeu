import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';


class Riwayat extends StatefulWidget {
  const Riwayat({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Riwayat> createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  List<_RiwayatState>? listKatalog;
  int page = 1;
  bool loading = false;
  @override
  void initState() {
    super.initState();
    fetch(page);
  }

  fetch(int page) async {
    setState(() {
      loading = true;
    });
    listRiwayat = await Services.getListRiwayat(page);
    setState(() {
      loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat'),
      ),
      body: 

  
}