import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:dio/dio.dart';
import 'package:perpuskemenkeu/services.dart';
import 'package:perpuskemenkeu/models/riwayatmodel.dart';

import '../widgets/card_riwayat.dart';

class RiwayatPage extends StatefulWidget {
  final String title;

  const RiwayatPage({Key? key, required this.title}) : super(key: key);

  @override
  State<RiwayatPage> createState() => _Riwayat();
}

class _Riwayat extends State<RiwayatPage> {
  ScrollController _scrollController = ScrollController();
  List<History?> listRiwayat = [];
  RiwayatResponse? iniriwayat;
  int page = 1;
  String keyword = '';
  bool loading = false;
  bool hasMore = true;
  final TextEditingController InputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetch(page, '');

    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
            page = page + 1;
        print('ok $page ${listRiwayat.length}');
        fetch(page, '');
      }
    });
  }

  fetch(int page, String keyword) async {
    setState(() {
      loading = true;
    });
    iniriwayat = await Services.getListHistory(page, keyword);
    if (iniriwayat != null) {
      listRiwayat.addAll(iniriwayat!.data!);
      iniriwayat!.data!.forEach((element) {
        print("isi riwayat ${element.judulBuku}");
      });

      hasMore = page * 10 <= iniriwayat!.total!;
    }
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
        body: Container(
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: Column(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(
                        bottom: 15, left: 15, right: 15, top: 15),
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Judul Buku',
                        hintStyle: TextStyle(fontSize: 15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.white)),
                      ),
                      controller: InputController,
                      onSubmitted: (text) {
                        listRiwayat.clear();
                        page = 1;
                        fetch(page, text);
                        keyword = text;
                        print(InputController);
                      },
                    )),
                Expanded(
                  child: Container(
                    height: 700,
                    child: ListView.builder(
                      controller: _scrollController,
                      shrinkWrap: true,
                      padding: EdgeInsets.all(10),
                      itemCount: listRiwayat.length + 1,
                      itemBuilder: (context, int index) {
                        if (index == listRiwayat.length) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Center(
                                child: hasMore
                                    ? const CircularProgressIndicator()
                                    : const Text('data habis')),
                          );
                        } else {
                          return RiwayatCard(iniRiwayat: listRiwayat[index]);
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
