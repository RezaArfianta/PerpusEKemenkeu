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
  bool loading = false;
  bool hasMore = true;

  @override
  void initState() {
    super.initState();
    fetch(page, '');

    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        print('ok $page ${listRiwayat.length}');
        fetch(page++, '');
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
        child: ListView(
          shrinkWrap: false,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
                margin: EdgeInsets.only(left: 15),
                height: 40,
                child: TextField(
                  onSubmitted: (text) {
                    fetch(page, text);
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Judul Buku / Abstrak',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.grey)),
                  ),
                )),
            Container(
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
                    return InkWell(
                      child: RiwayatCard(
                        iniRiwayat: listRiwayat[index],
                      ),
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
                  }
                },
              ),
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
