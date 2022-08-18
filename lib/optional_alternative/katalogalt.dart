// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:perpuskemenkeu/widgets/card_katalog.dart';
// import 'package:dio/dio.dart';
// import 'package:perpuskemenkeu/models/katalogmodel.dart';
// import 'package:perpuskemenkeu/services.dart';

// class Katalog extends StatefulWidget {
//   const Katalog({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<Katalog> createState() => _Katalog();
// }

// class _Katalog extends State<Katalog> {
//   List<Catalogue>? listKatalog;
//   bool loading = false;
//   int currentIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     fetch();
//   }

//   fetch() async {
//     setState(() {
//       loading = true;
//     });
//     listKatalog = await Services.getListCatalogue();
//     setState(() {
//       loading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Perpustakaan'),
//       ),
//       body:
//        loading
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : listKatalog != null?
//              Container(
//                  child: 
//                  ListView.builder(
//                     itemCount: listKatalog!.length,
//                     itemBuilder: (context, int index) {
//                       return InkWell(
//                         child: KatalogCard(iniKatalog: listKatalog![index]),
//                         onTap: () {
//                           print('${listKatalog![index].id}');
//                           showDialog(
//                               context: context,
//                               builder: (context) => AlertDialog(
//                                     title: Text('Angkasa'),
//                                     content: Text('Angkasa lalala'),
//                                     actions: [
//                                       TextButton(
//                                           onPressed: () {
//                                             Navigator.pop(context);
//                                           },
//                                           child: Text('Close'))
//                                     ],
//                                   ));
//                         },
//                       );
//                     },
//                   ),
//                )
//               : Center(
//                   child: Text('no data'),
//                 ),
                

//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         currentIndex: currentIndex,
//         onTap: (index) => setState(() => currentIndex = index),
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Beranda',
//           ),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.check_circle), label: 'Katalog')
//         ],
//       ),
//     );
//   }
// }
