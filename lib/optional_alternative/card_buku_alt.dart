// import 'package:flutter/material.dart';
// import 'package:perpuskemenkeu/models/buku.dart';

// class CardTerbaru extends StatelessWidget {
//   const CardTerbaru({Key? key, required this.bukuTerbaru}) : super(key: key);
//   final BukuTerbaru bukuTerbaru;

//   @override
//   Widget build(BuildContext context) {
//     return Container(

//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             offset: Offset(3, 3),
//             spreadRadius: 3,
//             blurRadius: 5,
//             color: Colors.grey.withOpacity(0.5),
//           ),
//         ],
//       ),
      
//       child: Column(

//         children: <Widget> [
//           Expanded(
//             flex: 4,
//             child: Container(
//               width: 180,
//               child: ClipRRect(borderRadius: 
//               BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
//                 child: Image(
                  
//                   image: NetworkImage(
//                       'https://perpustakaan.kemenkeu.go.id/img/FileCover/${bukuTerbaru.fileCover}'
//                       // 'https://picsum.photos/200/300'
//                       ),
//                       fit: BoxFit.fill,
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Container(
//               width: 150,
//               child: Align(
//                 alignment: Alignment.center,
//                 child: Text(
//                   '${bukuTerbaru.judulBuku}',
//                   style: TextStyle(fontSize: 15),
//                   textAlign: TextAlign.center,
//                   maxLines: 3,
//                   overflow: TextOverflow.ellipsis,
//                    ),
//               ),
//               ),
//           ),        
//         ],
//       ),
//     );
//   }
// }
