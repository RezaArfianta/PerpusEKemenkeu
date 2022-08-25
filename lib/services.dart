import 'package:dio/dio.dart';
import 'models/katalogmodel.dart';
import 'models/buku.dart';

//Buat semua pemanggilan API di seluruh page ke file services.dart ini

abstract class Services {
  static Future<List<Buku>?> getListBukuTerbaru() async {
    try {
      Response response = await Dio().get(
          'https://demo-service.kemenkeu.go.id/perpustakaan/Koleksi/GetTerbaru');
      print('dapat data terbaru');
      if (response.statusCode == 200) {
        return List<Buku>.from(
            response.data['Data'].map((i) => Buku.fromJson(i)));
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<List<Buku>?> getListBukuTerlaris() async {
    try {
      Response response = await Dio().get(
          'https://demo-service.kemenkeu.go.id/perpustakaan/Koleksi/GetTerlaris');
      print('dapat data terlaris');
      if (response.statusCode == 200) {
        return List<Buku>.from(
            response.data['Data'].map((i) => Buku.fromJson(i)));
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<KatalogResponse?> getListCatalogue(int page) async {
    try {
      Response response = await Dio().get(
          'https://demo-service.kemenkeu.go.id/perpustakaan/Koleksi/GetAll?PageSize=10&Page=$page');
      if (response.statusCode == 200) {
        return KatalogResponse.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<List<PopupKatalog>?> getListDetailCatalogue() async {
    try {
      Response response = await Dio()
          .get('https://demo-service.kemenkeu.go.id/perpustakaan/Koleksi/1');
      if (response.statusCode == 200) {
        return List<PopupKatalog>.from(
            response.data['Data'].map((i) => PopupKatalog.fromJson(i)));
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  static createUser(String s, String t, String u) {}
}
