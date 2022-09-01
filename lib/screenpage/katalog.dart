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
  final TextEditingController myController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  List<Catalogue?> listKatalog = [];
  List<IsiKatalog?> listPopup = [];
  KatalogResponse? inikatalog;
  DetailKatalog? iniPopKatalog;
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
        print('ok $page ${listKatalog.length}');
        fetch(page++, '');
      }
    });
  }

  fetch(int page, String keyword) async {
    setState(() {
      loading = true;
    });
    inikatalog = await Services.getListCatalogue(page, '');
    iniPopKatalog = await Services.getListDetailCatalogue();
    listKatalog.addAll(inikatalog!.data!);
    hasMore = page * 10 <= inikatalog!.total!;
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
                    controller: myController,
                    onChanged: (value) {
                      print('onchange');
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
                          return InkWell(
                            child: KatalogCard(iniKatalog: listKatalog[index]),
                            onTap: () {
                              print('ada');
                            },
                          );
                        }
                      })),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ));
  }
}
