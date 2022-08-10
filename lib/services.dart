import 'package:dio/dio.dart';

import 'buku.dart';

abstract class Services{

  static Future<List<BukuTerbaru>?> getListBukuTerbaru() async {
    try{
      Response response = await Dio().get('https://demo-service.kemenkeu.go.id/perpustakaan/Koleksi/GetTerbaru');
        if(response.statusCode == 200){
          return List<BukuTerbaru>.from(response.data['data'].map((i) => BukuTerbaru.fromJson(i)));
        }else{
          return null;
        }
    }catch (e){
      print(e);
      return null;
    }
  }
}