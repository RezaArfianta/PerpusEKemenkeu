import 'package:flutter/material.dart';
import 'package:perpuskemenkeu/widgets/card_buku.dart';
import 'package:dio/dio.dart';
import 'package:perpuskemenkeu/services.dart';
import 'package:perpuskemenkeu/buku.dart';


class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  List<BukuTerbaru>? listBuku;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    fetch();
  }

  fetch()async{
    setState(() {
      loading = true;
    });
    listBuku = await Services.getListBukuTerbaru();
    setState(() {
      loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('testing'),
      ),
      body: loading ? Center(child: CircularProgressIndicator(),) : listBuku != null ?
      ListView.builder(
        itemCount: listBuku!.length,
        itemBuilder: (context, int index){
          return Column(
            children: [
              CardBuku(bukuTerbaru: listBuku![index])
            ],
          );
        },
      ) : Center(child: Text('no data'),)


    );
  } 
}