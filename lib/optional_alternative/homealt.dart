// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:perpuskemenkeu/widgets/card_buku.dart';
// import 'package:dio/dio.dart';
// import 'package:perpuskemenkeu/services.dart';
// import 'package:perpuskemenkeu/buku.dart';
// import 'package:perpuskemenkeu/widgets/card_buku2.dart';


// class Home extends StatefulWidget {
//   const Home({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<Home> createState() => _Home();
// }

// class _Home extends State<Home> {
//   List<BukuTerbaru>? listBuku;
//   bool loading = false;
//   int currentIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     fetch();
//   }

//   fetch()async{
//     setState(() {
//       loading = true;
//     });
//     listBuku = await Services.getListBukuTerbaru();
//     setState(() {
//       loading = false;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('testing'),
//       ),
//       body: loading ? Center(child: CircularProgressIndicator(),) : listBuku != null ?
//       SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             ListView.builder(
//               physics: NeverScrollableScrollPhysics(),
//               scrollDirection: Axis.vertical,
//               shrinkWrap: true,
//               itemCount: listBuku!.length,
//               itemBuilder: (context, int index){
//                 return InkWell(child: BukuCard(bukuTerbaru: listBuku![index]),
//                 onTap: (){
//                   print('${listBuku![index].id}');
//                 } ,);
//               },
//             ),
//           ],
//         ),
//       ) : Center(child: Text('no data'),),

//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         currentIndex: currentIndex,
//         onTap: (index) => setState(() => currentIndex = index),
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Beranda',
//             ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.book),
//             label: 'Katalog')
//         ],
//       ),


//     );
//   } 
// }