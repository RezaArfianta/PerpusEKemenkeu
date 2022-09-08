import 'dart:developer';
import 'package:flutter/material.dart';
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
  ScrollController _scrollController = ScrollController();
  List<Catalogue?> listKatalog = [];
  KatalogResponse? inikatalog;
  int page = 1;
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
        print('ok $page ${listKatalog.length}');
        fetch(page++, '');
      }
    });
  }

  fetch(int page, String keyword) async {
    setState(() {
      loading = true;
    });
    inikatalog = await Services.getListCatalogue(page, keyword);
    if (inikatalog != null) {
      listKatalog.addAll(inikatalog!.data!);
      inikatalog!.data!.forEach((element) {
        print("isi katalog ${element.judulbuku}");
      });
      hasMore = page * 10 <= inikatalog!.total!;
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
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.all(10),
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Judul Buku / Abstrak',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.white)),
                      ),
                      controller: InputController,
                      onSubmitted: (text) {
                        listKatalog.clear();
                        fetch(page, text);
                        print(InputController);
                      },
                    )),
                Container(
                    height: 700,
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context)
                          .copyWith(scrollbars: false),
                      child: ListView.builder(
                          controller: _scrollController,
                          shrinkWrap: true,
                          padding: EdgeInsets.all(10),
                          itemCount: listKatalog.length + 1,
                          itemBuilder: (context, int index) {
                            if (index == listKatalog.length) {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: Center(
                                    child: hasMore
                                        ? Center(
                                            child:
                                                const CircularProgressIndicator())
                                        : const Text('data habis')),
                              );
                            } else {
                              return KatalogCard(
                                  iniKatalog: listKatalog[index]);
                            }
                          }),
                    )),
              ],
            ),
          ),
        ));
  }
}
