import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:perpuskemenkeu/models/katalogmodel.dart';
import 'package:perpuskemenkeu/services.dart';

class PopupKatalog extends StatefulWidget {
  PopupKatalog({Key? key, this.katalog}) : super(key: key);
  Catalogue? katalog;

  @override
  State<PopupKatalog> createState() => _PopupKatalogState();
}

class _PopupKatalogState extends State<PopupKatalog> {
  DetailKatalogResponse? detail;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    fetch();
  }

  void fetch() async {
    setState(() {
      isLoading = true;
    });
    detail = await Services.getDetailCatalogue(widget.katalog!.id!);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: isLoading
          ? CircularProgressIndicator()
          : Container(
              margin: EdgeInsets.only(left: 15),
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
                      'https://perpustakaan.kemenkeu.go.id/img/FileCover/${detail?.data?.fileCover}',
                    ),
                    width: 100,
                    height: 250,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    '${detail?.data?.judulBuku!}',
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
                        child: Text(detail?.data?.namaPengarang != null
                            ? '${detail?.data?.namaPengarang}'
                            : ''),
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
                        child: Text('${detail?.data?.namaPenerbit}'),
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
                        child: Text('${detail?.data?.lokasiRak}'),
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
                        child: Text('${detail?.data?.lokasi}'),
                        flex: 4,
                      )
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
