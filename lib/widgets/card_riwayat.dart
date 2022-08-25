import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perpuskemenkeu/models/riwayatmodel.dart';


import '../screenpage/riwayat.dart';

class RiwayatCard extends StatelessWidget {
   RiwayatCard({Key? key, this.iniRiwayat,}) : super(key: key);
    History? iniRiwayat;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(child: Text('${iniRiwayat!.lokasi}')),
    );
    }
  }
