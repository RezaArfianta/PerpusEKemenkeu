import 'package:flutter/material.dart';
import 'package:perpuskemenkeu/buku.dart';

class BukuCard extends StatelessWidget {
  const BukuCard({Key? key, required this.bukuTerbaru}) : super(key: key);
   final BukuTerbaru bukuTerbaru;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 200,
      decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(29),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 33,
                    color: Color.fromARGB(10, 120, 12, 104),
                  ),
                ],
              ),
      child: Column(
        children: [
          Image(
            image: NetworkImage('https://perpustakaan.kemenkeu.go.id/img/FileCover/${bukuTerbaru.fileCover}'),
            width: 150,
            height: 150,
          ),
          Text('${bukuTerbaru.judulBuku}',maxLines: 2,)
        ],
      ),
    );
  }
}