import 'package:flutter/material.dart';
import 'package:perpuskemenkeu/buku.dart';
import 'package:dio/dio.dart';

class BukuCard extends StatelessWidget {
  const BukuCard({Key? key, required this.bukuTerbaru}) : super(key: key);
  final BukuTerbaru bukuTerbaru;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        
      ),
      child: Column(
        children: <Widget> [
          Container(
            width: 200,
            margin: EdgeInsets.all(8),
            child: Column(
              children: [
                ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                  child: Image(
                    image: NetworkImage(
                        // 'https://perpustakaan.kemenkeu.go.id/img/FileCover/${bukuTerbaru.fileCover}'
                        'https://picsum.photos/200/300'
                        ),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Text(
            // '${bukuTerbaru.judulBuku}',
            'Angkasa',
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
