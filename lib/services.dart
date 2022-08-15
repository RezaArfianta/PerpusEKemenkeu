import 'package:dio/dio.dart';
import 'models/katalogmodel.dart';
import 'models/buku.dart';

//Buat semua pemanggilan API di seluruh page ke file services.dart ini

abstract class Services{

  static Future<List<BukuTerbaru>?> getListBukuTerbaru() async {
    try{
      Response response = await Dio().get('https://demo-service.kemenkeu.go.id/perpustakaan/Koleksi/GetTerbaru');
      print('data dapat');
        if(response.statusCode == 200){
          return List<BukuTerbaru>.from(response.data['Data'].map((i) => BukuTerbaru.fromJson(i)));
        }else{
          return null;
        }
    }catch (e){
      print(e);
      return null;
    }
  }

  static Future<List<Catalogue>?> getListCatalogue() async {
    try {
      Response response = await Dio().get(
          'https://demo-service.kemenkeu.go.id/perpustakaan/Koleksi/GetAll?PageSize=10&Page=1');
      if (response.statusCode == 200) {
        return List<Catalogue>.from(
            response.data['Data'].map((i) => Catalogue.fromJson(i)));
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}