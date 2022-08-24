import 'package:flutter/material.dart';
import 'package:perpuskemenkeu/models/buku.dart';

class CardBuku extends StatelessWidget {
  CardBuku({Key? key, this.buku}) : super(key: key);
  Buku? buku;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
    
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: Offset(3, 3),
              spreadRadius: 3,
              blurRadius: 5,
              color: Colors.grey.withOpacity(0.5),
            ),
          ],
        ),
        
        child: Column(
    
          children: <Widget> [
            Expanded(
              flex: 4,
              child: Container(
                width: 180,
                child: ClipRRect(borderRadius: 
                BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                  child: Image(
                    
                    image: NetworkImage(
                        'https://perpustakaan.kemenkeu.go.id/img/FileCover/${buku?.fileCover}'
                        // 'https://picsum.photos/200/300'
                        ),
                        fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: 150,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    '${buku?.judulBuku}',
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                     ),
                ),
                ),
            ),        
          ],
        ),
      ),
      onTap: (){
        showDialog(context: context, builder: (context) => 
        Dialog(
          child: Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white
            ),
            height: 450,
            width: 200,
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 30,
                  ),
                Image(image: NetworkImage(
                  'https://perpustakaan.kemenkeu.go.id/img/FileCover/${buku?.fileCover}',         
                  ),
                  width: 100,
                  height: 250,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  '${buku?.judulBuku}',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                ),
                SizedBox(height: 7,),
                Text(
                  'Penulis             : ${buku?.namaPengarang}'
                ),
                SizedBox(height: 5,),
                Text(
                  'Penerbit           : ${buku?.namaPenerbit}'
                ),
                SizedBox(height: 5,),
                 Text(
                  'Lokasi Rak       : ${buku?.namaPengarang}'
                ),
                SizedBox(height: 5,),
                 Text(
                  'Lokasi              : ${buku?.namaPengarang}'
                ),
                 Text(
                  'Perpustakaan'
                ),
              
              ],
              ),
          ),
        ),
        );
      },
    );
  }
}
