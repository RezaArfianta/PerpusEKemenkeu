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
        print('ok $page ${listKatalog.length}');
        fetch(page, keyword);
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
      inikatalog!.data!.forEach((element) {});
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
        resizeToAvoidBottomInset: false,
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
                        hintText: 'Judul Buku / Abstrak',
                        hintStyle: TextStyle(fontSize: 15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.white)),
                      ),
                      controller: InputController,
                      onSubmitted: (text) {
                        listKatalog.clear();
                        page = 1;
                        fetch(page, text);
                        keyword = text;
                        print(InputController);
                      },
                    )),
                Expanded(
                  child: Container(
                      child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context)
                        .copyWith(scrollbars: false),
                    child: ListView.builder(
                        controller: _scrollController,
                        shrinkWrap: true,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        itemCount: listKatalog.length + 1,
                        itemBuilder: (context, int index) {
                          if (index == listKatalog.length) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Center(
                                  child: hasMore
                                      ? const CircularProgressIndicator()
                                      : const Text('data habis')),
                            );
                          } else {
                            return KatalogCard(iniKatalog: listKatalog[index]);
                          }
                        }),
                  )),
                ),
              ],
            ),
          ),
        ));
  }
}
