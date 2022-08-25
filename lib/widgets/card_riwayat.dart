import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perpuskemenkeu/models/riwayatmodel.dart';


import '../screenpage/riwayat.dart';

class RiwayatCard extends StatelessWidget {
  
  final History? iniRiwayat;
  

   const RiwayatCard({Key? key, this.iniRiwayat,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(child: Text('${iniRiwayat!.lokasi}')),
    );
    }
  }
