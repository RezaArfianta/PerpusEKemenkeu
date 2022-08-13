import 'package:dio/dio.dart';
import 'katalogmodel.dart';

abstract class ServicesK {
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
