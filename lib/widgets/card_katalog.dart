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
        clipBehavior: Clip.antiAlias,
        elevation: 16,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
            width: 400,
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${iniKatalog.judulbuku}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('${iniKatalog.abstrak}'),
                  ],
                )),
                Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
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
            )),
      ),
    );
  }
}
