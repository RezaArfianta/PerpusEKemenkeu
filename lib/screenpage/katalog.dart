import 'dart:developer';
import 'package:perpuskemenkeu/screenpage/beranda.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:perpuskemenkeu/widgets/card_katalog.dart';
import 'package:dio/dio.dart';
import 'package:perpuskemenkeu/services.dart';
import 'package:perpuskemenkeu/models/katalogmodel.dart';

class Katalog extends StatefulWidget {
  const Katalog({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Katalog> createState() => _Katalog();
}

class _Katalog extends State<Katalog> {
  List<Catalogue>? listKatalog;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    fetch();
  }

  fetch() async {
    setState(() {
      loading = true;
    });
    listKatalog = await Services.getListCatalogue();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Perpustakaan'),
      ),
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : listKatalog != null
              ? Container(
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 15),
                          height: 40,
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              hintText: 'Judul Buku / Abstrak',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: Colors.grey)),
                            ),
                          )),
                      Container(
                        height: 800,
                        child: ListView.separated(
                          padding: EdgeInsets.all(10),
                          itemCount: listKatalog!.length,
                          separatorBuilder: (context, _) => SizedBox(
                            width: 12,
                          ),
                          itemBuilder: (context, int index) {
                            return InkWell(
                              child:
                                  KatalogCard(iniKatalog: listKatalog![index]),
                              onTap: () {
                                print('ada');
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: Text('Angkasa'),
                                          content: Text('Angkasa lalala'),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text('Close'))
                                          ],
                                        ));
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                    ],
                    shrinkWrap: true,
                  ),
                )
              : Center(
                  child: Text('no data'),
                ),
    );
  }
}
