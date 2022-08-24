import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';


import '../models/riwayat.dart';

class RiwayatCard extends StatelessWidget {
  
   Riwayat? iniRiwayat;
  

   RiwayatCard({Key? key, required Riwayat iniRiwayat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(child: Text('${iniRiwayat!.id}')),
    );
    }
  }
