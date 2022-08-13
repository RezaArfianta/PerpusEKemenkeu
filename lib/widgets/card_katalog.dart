import 'package:flutter/material.dart';
import 'package:perpuskemenkeu/katalogmodel.dart';

class KatalogCard extends StatelessWidget {
  const KatalogCard({Key? key, required this.iniKatalog}) : super(key: key);
  final Catalogue iniKatalog;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(29),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 33,
            color: Color.fromARGB(10, 120, 12, 104),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            '${iniKatalog.judulbuku}',
            maxLines: 2,
          )
        ],
      ),
    );
  }
}
