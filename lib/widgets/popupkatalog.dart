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
          ? Container(
              height: 450,
              width: 200,
              child: Center(child: CircularProgressIndicator()))
          : Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.white),
              height: 450,
              width: 200,
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
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
                    Expanded(
                      child: Text(
                        '${detail?.data?.judulBuku!}',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 30, left: 30, bottom: 30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        child: Image(
                          image: NetworkImage(
                            'https://perpustakaan.kemenkeu.go.id/img/FileCover/${detail?.data?.fileCover}',
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),

                      // width: 50,
                      // height: 200,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(detail?.data?.abstrak != null
                        ? '${detail?.data?.abstrak}'
                        : ''),
                    SizedBox(
                      height: 20,
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
                          child: Text('ISBN'),
                          flex: 3,
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Text(':'),
                        Expanded(
                          child: Text('${detail?.data?.isbn}'),
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
                          child: Text(detail?.data?.lokasiRak != null
                              ? '${detail?.data?.lokasiRak}'
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
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Expanded(
                          child: Text('Subyek'),
                          flex: 3,
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Text(':'),
                        Expanded(
                          child: Text(detail?.data?.subyek != null
                              ? '${detail?.data?.subyek}'
                              : ''),
                          flex: 4,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
