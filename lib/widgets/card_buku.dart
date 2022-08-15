import 'package:flutter/material.dart';
import 'package:perpuskemenkeu/buku.dart';

class CardBuku extends StatelessWidget {
  const CardBuku({Key? key, required this.bukuTerbaru}) : super(key: key);
  final BukuTerbaru bukuTerbaru;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Container(
            width: 180,
            child: Column(
              children: [
                ClipRRect(borderRadius: 
                BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                  child: Image(
                    image: NetworkImage(
                        'https://perpustakaan.kemenkeu.go.id/img/FileCover/${bukuTerbaru.fileCover}'
                        // 'https://picsum.photos/200/300'
                        ),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Text(
            '${bukuTerbaru.judulBuku}',
            // 'Angkasa',
            style: TextStyle(fontSize: 15),
          ),        
        ],
      ),
    );
  }
}
