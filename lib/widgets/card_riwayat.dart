import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:perpuskemenkeu/models/riwayatmodel.dart';

import '../screenpage/riwayat.dart';

class RiwayatCard extends StatelessWidget {
  RiwayatCard({
    Key? key,
    this.iniRiwayat,
  }) : super(key: key);
  History? iniRiwayat;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(14, 4, 14, 4),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  offset: Offset(5, 4),
                  spreadRadius: 3,
                  blurRadius: 5,
                  color: Colors.grey.withOpacity(0.5),
                ),
              ],
            ),
            width: 200,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${iniRiwayat?.judulBuku}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                )),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${iniRiwayat?.lokasi}',
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Icon(
                    Icons.location_on,
                    size: 20,
                    color: Colors.grey,
                  ),
                  Expanded(child: Text('${iniRiwayat?.namaPenerbit}')),
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [],
                )
              ],
            )),
      ),
    );
  }
}
