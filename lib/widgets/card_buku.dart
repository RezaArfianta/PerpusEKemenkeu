import 'package:flutter/material.dart';
import 'package:perpuskemenkeu/buku.dart';

class CardBuku extends StatelessWidget {

  final BukuTerbaru bukuTerbaru;

  const CardBuku({Key? key, required this.bukuTerbaru}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 24, bottom: 40),
      height: 245,
      width: 202,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 221,
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
            ),
          ),
          Image(
            image: NetworkImage('https://perpustakaan.kemenkeu.go.id/img/FileCover/${bukuTerbaru.fileCover}'),
            width: 150,
            height: 150,
          ),
          Positioned(
            top: 35,
            right: 10,
            child: Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Positioned(
            top: 160,
            child: Container(
              height: 85,
              width: 202,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: RichText(
                      maxLines: 2,
                      text: TextSpan(
                        style: TextStyle(color: Color.fromARGB(1, 2, 3, 4)),
                        children: [
                          TextSpan(
                            text: "${bukuTerbaru.judulbuku}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
