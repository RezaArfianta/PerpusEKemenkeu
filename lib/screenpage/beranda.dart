import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:perpuskemenkeu/screenpage/katalog.dart';
import 'package:perpuskemenkeu/widgets/card_buku.dart';
import 'package:dio/dio.dart';
import 'package:perpuskemenkeu/services.dart';
import 'package:perpuskemenkeu/models/buku.dart';


class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  List<Buku>? listTerbaru;
  List<Buku>? listTerlaris;
  bool loading = false;
  int currentIndex = 0;

  final screens = [
    Home(title: 'Perpustakaan'),
    Katalog(title: 'Perpustakaan'),
  ];

  void onTappedBar(int index){
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    fetch();
  }

  fetch()async{
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
        title: Text('Beranda'),
      ),
      body: loading ? Center(child: CircularProgressIndicator(),) : listTerbaru != null ?
      Container(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 25,
            ),
            Container(
              margin: EdgeInsets.only(left: 15),       
              height: 40,
              child: Text('Buku Terbaru', 
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,),
            ),
            Container(
            height: 320,
            
            child: ListView.separated(
              padding: EdgeInsets.all(10),         
              scrollDirection: Axis.horizontal,
              itemCount: listTerbaru!.length,
              separatorBuilder: (context, _) => SizedBox(width: 12,),
              itemBuilder: (context, int index){
                return InkWell(child: CardBuku(buku : listTerbaru![index]),
                onTap: (){
                  print('ada');
                 showDialog(
                    context: context, builder: (context) => AlertDialog(
                      title: Text('Angkasa'),
                      content: SingleChildScrollView(
                
                        child: Container(
                          height: 150,
                          width: 150,
                          child: ListView(
                            children: [
                             Text('ok'),
                            ],
                          shrinkWrap: true,
                      ),
                        )),
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
            SizedBox(height: 25,
            ),
            Container(
              margin: EdgeInsets.only(left: 15),       
              height: 40,
              child: Text('Buku Terlaris', 
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,),
            ),
            Container(
            height: 320,
            child: ListView.separated(
              padding: EdgeInsets.all(10),         
              scrollDirection: Axis.horizontal,
              itemCount: listTerlaris!.length,
              separatorBuilder: (context, _) => SizedBox(width: 12,),
              itemBuilder: (context, int index){
                return InkWell(child: CardBuku(buku: listTerlaris![index]),
                onTap: (){
                  print('ada');
                  showDialog(
                    context: context, builder: (context) => AlertDialog(
                      title: Text('Angkasa'),
                      content: SingleChildScrollView(
                
                        child: Container(
                          height: 150,
                          width: 150,
                          child: ListView(
                            children: [
                             Text('ok'),
                            ],
                          shrinkWrap: true,
                      ),
                        )),
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
            SizedBox(height: 25,
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