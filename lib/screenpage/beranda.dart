import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:perpuskemenkeu/screenpage/katalog.dart';
import 'package:perpuskemenkeu/widgets/card_buku.dart';
import 'package:dio/dio.dart';
import 'package:perpuskemenkeu/services.dart';
import 'package:perpuskemenkeu/models/buku.dart';

class Beranda extends StatefulWidget {
  const Beranda({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Beranda> createState() => _Beranda();
}

class _Beranda extends State<Beranda> {
  List<Buku>? listTerbaru;
  List<Buku>? listTerlaris;
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
    listTerbaru = await Services.getListBukuTerbaru();
    listTerlaris = await Services.getListBukuTerlaris();
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
          : listTerbaru != null
              ? Container(
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context)
                        .copyWith(scrollbars: false),
                    child: ListView(children: <Widget>[
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        height: 40,
                        child: Text(
                          'Buku Terbaru',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        height: 320,
                        child: ListView.separated(
                          padding: EdgeInsets.all(10),
                          scrollDirection: Axis.horizontal,
                          itemCount: listTerbaru!.length,
                          separatorBuilder: (context, _) => SizedBox(
                            width: 12,
                          ),
                          itemBuilder: (context, int index) {
                            return CardBuku(buku: listTerbaru![index]);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        height: 40,
                        child: Text(
                          'Buku Terlaris',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        height: 320,
                        child: ListView.separated(
                          padding: EdgeInsets.all(10),
                          scrollDirection: Axis.horizontal,
                          itemCount: listTerlaris!.length,
                          separatorBuilder: (context, _) => SizedBox(
                            width: 12,
                          ),
                          itemBuilder: (context, int index) {
                            return CardBuku(buku: listTerlaris![index]);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                    ]),
                  ),
                )
              : Center(
                  child: Text('no data'),
                ),
    );
  }
}
