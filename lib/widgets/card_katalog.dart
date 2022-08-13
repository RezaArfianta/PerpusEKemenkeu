import 'package:flutter/material.dart';
import 'package:perpuskemenkeu/katalogmodel.dart';

class KatalogCard extends StatelessWidget {
  const KatalogCard({Key? key, required this.iniKatalog}) : super(key: key);
  final Catalogue iniKatalog;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
              width: 400,
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          child: Column(
                        children: [
                          Text(
                            '${iniKatalog.judulbuku}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                          Text('${iniKatalog.abstrak}'),
                        ],
                      ))),
                  Row(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 20,
                        ),
                        Expanded(child: Text('${iniKatalog.lokasi}')),
                        Icon(
                          Icons.info,
                          size: 20,
                        ),
                      ]),
                ],
              ))
        ],
      ),
    );
  }
}
