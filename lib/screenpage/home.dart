import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:perpuskemenkeu/widgets/card_buku.dart';
import 'package:dio/dio.dart';
import 'package:perpuskemenkeu/services.dart';
import 'package:perpuskemenkeu/buku.dart';
import 'package:perpuskemenkeu/optional_alternative/card_buku2.dart';


class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  List<BukuTerbaru>? listBuku;
  bool loading = false;
  int currentIndex = 0;

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
        title: Text('Beranda'),
      ),
      body: loading ? Center(child: CircularProgressIndicator(),) : listBuku != null ?
      Container(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 15),       
              height: 40,
              child: Text('Buku Terbaru', 
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,),
            ),
            Container(
            height: 360,
            child: ListView.separated(
              padding: EdgeInsets.all(10),         
              scrollDirection: Axis.horizontal,
              itemCount: listBuku!.length,
              separatorBuilder: (context, _) => SizedBox(width: 12,),
              itemBuilder: (context, int index){
                return InkWell(child: CardBuku(bukuTerbaru : listBuku![index]),
                onTap: (){
                  print('ada');
                  showDialog(
                    context: context, builder: (context) => AlertDialog(
                      title: Text('Angkasa'),
                      content: Text('Angkasa lalala'),
                      actions: [
                        TextButton(onPressed: (){
                          Navigator.pop(context);
                        }, child: Text('Close'))
                      ],
                    ));
                  } ,);
                },
              ),
            ),
          ]
        ),
      ) : Center(child: Text('no data'),),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Katalog')
        ],
      ),


    );
  } 
}