import 'package:flutter/material.dart';
import 'package:perpuskemenkeu/models/katalogmodel.dart';

class KatalogCard extends StatelessWidget {
  KatalogCard({Key? key, this.iniKatalog, this.detail}) : super(key: key);
  PopupKatalog? detail;
  Catalogue? iniKatalog;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      child: Container(
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
                        '${iniKatalog?.judulbuku}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        '${iniKatalog?.abstrak}',
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  )),
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Icon(
                      Icons.location_on,
                      size: 20,
                      color: Colors.grey,
                    ),
                    Expanded(child: Text('${iniKatalog?.lokasi}')),
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
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => Dialog(
            child: Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.white),
              height: 450,
              width: 200,
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.close))
                      ],
                    ),
                  ),
                  Image(
                    image: NetworkImage(
                      'https://perpustakaan.kemenkeu.go.id/img/FileCover/${detail?.fileCover}',
                    ),
                    width: 100,
                    height: 250,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    '${detail?.judulBuku}',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Expanded(
                        child: Text('Penulis'),
                        flex: 3,
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Text(':'),
                      Expanded(
                        child: Text('${detail?.namaPengarang!}'),
                        flex: 4,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Expanded(
                        child: Text('Penerbit'),
                        flex: 3,
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Text(':'),
                      Expanded(
                        child: Text('${detail?.namaPenerbit}'),
                        flex: 4,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Expanded(
                        child: Text('Lokasi Rak'),
                        flex: 3,
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Text(':'),
                      Expanded(
                        child: Text('${detail?.lokasiRak!}'),
                        flex: 4,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Expanded(
                        child: Text('Lokasi Perpustakaan'),
                        flex: 3,
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Text(':'),
                      Expanded(
                        child: Text('${detail?.lokasi}'),
                        flex: 4,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
