import 'package:flutter/material.dart';
import 'package:perpuskemenkeu/models/katalogmodel.dart';

class KatalogCard extends StatelessWidget {
  const KatalogCard({Key? key, required this.iniKatalog}) : super(key: key);
  final Catalogue iniKatalog;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(14, 4, 14, 4),
      child: Card(
        elevation: 16,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Container(
            width: 200,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${iniKatalog.judulbuku}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      '${iniKatalog.abstrak}',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                )),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Icon(
                    Icons.location_on,
                    size: 20,
                    color: Colors.grey,
                  ),
                  Expanded(child: Text('${iniKatalog.lokasi}')),
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.info,
                      size: 20,
                      color: Colors.grey,
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
