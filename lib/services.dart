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

<<<<<<< HEAD
  static Future<List<PopupKatalog>?> getListDetailCatalogue() async {
    try {
<<<<<<< HEAD
      Response response = await Dio()
          .get('https://demo-service.kemenkeu.go.id/perpustakaan/Koleksi/1');
      if (response.statusCode == 200) {
        return List<PopupKatalog>.from(
            response.data['Data'].map((i) => PopupKatalog.fromJson(i)));
      } else {
        return null;
      }
=======
=======
  static Future<RiwayatResponse?> getListHistory(int page, String keyword) async {
    try {
      Response response = await Dio().get('https://demo-service.kemenkeu.go.id/perpustakaan/Sirkulasi/GetAll?PageSize=10&Page=$page&keyword=$keyword');

>>>>>>> b80198517c62f05045dd4163602968003f8c0951
      print('get riwayat');
      Response responses = await Dio().get('https://demo-service.kemenkeu.go.id/perpustakaan/Sirkulasi/GetAll?PageSize=10&Page=$page',
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization":
                "Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjQyNDc0QTY4NDNBM0VBNTc2MTcyNDE2MTIxMEQ2OTlBMEZFNDQ2Q0EiLCJ0eXAiOiJhdCtqd3QiLCJ4NXQiOiJRa2RLYUVPajZsZGhja0ZoSVExcG1nX2tSc28ifQ.eyJuYmYiOjE2NjEzOTg0NTMsImV4cCI6MTY2MTQxNjQ1MywiaXNzIjoiaHR0cHM6Ly9kZW1vLWFjY291bnQua2VtZW5rZXUuZ28uaWQiLCJhdWQiOlsiZnJvbnRlbmQubmFkaW5lIiwiYWdlbmRhLmVrZW1lbmtldSIsInJhcGF0LmVrZW1lbmtldSIsImtlaGFkaXJhbi5la2VtZW5rZXUiLCJvcmdhbmlzYXNpLmhyaXMiLCJwcm9maWwuaHJpcyIsImphYmF0YW4uaHJpcyIsInBhbmdrYXQuaHJpcyIsImRpa2xhdC5ocmlzIiwia2VsdWFyZ2EuaHJpcyIsInBlbmRpZGlrYW4uaHJpcyIsImVrZW1lbmtldSIsImtvbGFib3Jhc2kuZWtlbWVua2V1IiwicGVnYXdhaS5la2VtZW5rZXUiXSwiY2xpZW50X2lkIjoiZWtlbWVua2V1LW9hLWRldiIsIkVuYWJsZU1GQSI6ImZhbHNlIiwic3ViIjoiMmI3YTNiZGMtMGVmZi00YWIyLWI2YjQtZjYwMTM1ZGRlOTk4IiwiYXV0aF90aW1lIjoxNjYxMzk4NDUyLCJpZHAiOiJsb2NhbCIsIm5hbWUiOiJFcml0YSBZdWxpYXN0dXRpIiwiaWQiOiIxMTUyNzkiLCJhZGRyZXNzIjoiQXB0LiBHYWRpbmcgTmlhcyBSZXNpZGVuY2UgVG93ZXIgQ2hyeXNhbnQgTm8uIEMvMTcvSkQgS2VsYXBhIEdhZGluZyBKYWthcnRhIFV0YXJhIiwicGhvbmVfbnVtYmVyIjoiMDgxMjI3MDc3NDc3IiwibmlwIjoiMTk4NTA3MTMyMDEwMTIyMDAxIiwiamFiYXRhbiI6IlBlbGFrc2FuYSIsImplbmlzX2phYmF0YW4iOiJGdW5nc2lvbmFsIFVtdW0gUE5TIiwia29kZV9vcmdhbmlzYXNpIjoiMzUwMzEwMTgwMiIsIm9yZ2FuaXNhc2kiOiJTdWJiaWRhbmcgUGVyYW5jYW5nYW4gZGFuIFBlbmdlbWJhbmdhbiBBcGxpa2FzaSBJLCBCaWRhbmcgQXBsaWthc2ksIFB1c2F0IFNpc3RlbSBJbmZvcm1hc2kgZGFuIFRla25vbG9naSBLZXVhbmdhbiwgU2VrcmV0YXJpYXQgSmVuZGVyYWwiLCJrb2RlX3NhdGtlciI6IjY3MjkwNiIsInNhdGtlciI6IlB1c2F0IFNpc3RlbSBJbmZvcm1hc2kgZGFuIFRla25vbG9naSBLZXVhbmdhbiIsImdyYXZhdGFyIjoiaHR0cHM6Ly9hY2NvdW50LmtlbWVua2V1LmdvLmlkL21hbmFnZS9VcGxvYWRzL1RodW1ibmFpbHMvMTk4NTA3MTMyMDEwMTIyMDAxLmpwZyIsInByZWZlcnJlZF91c2VybmFtZSI6IjE5ODUwNzEzMjAxMDEyMjAwMSIsImVtYWlsIjoiZXJpdGEueUBrZW1lbmtldS5nby5pZCIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJqdGkiOiJzQzRHdkNrSDVTcHI0Qy1URTFwTlBBIiwic2NvcGUiOlsib3BlbmlkIiwicHJvZmlsZSIsImZyb250ZW5kLm5hZGluZSIsImFnZW5kYS5la2VtZW5rZXUiLCJyYXBhdC5la2VtZW5rZXUiLCJrZWhhZGlyYW4uZWtlbWVua2V1Iiwib3JnYW5pc2FzaS5ocmlzIiwicHJvZmlsLmhyaXMiLCJqYWJhdGFuLmhyaXMiLCJwYW5na2F0LmhyaXMiLCJkaWtsYXQuaHJpcyIsImtlbHVhcmdhLmhyaXMiLCJwZW5kaWRpa2FuLmhyaXMiLCJla2VtZW5rZXUiLCJrb2xhYm9yYXNpLmVrZW1lbmtldSIsInBlZ2F3YWkuZWtlbWVua2V1Il0sImFtciI6WyJwd2QiXX0.A47Hy74J0p3LJCm2EcSYlYokaiM00z7TxzcdyF9EoAaC3lOiPkAB0B-kt2KTfeeERlNAWOLRnLZP6Nus20DNzOQZBa-99pRK3Sk-QWZQLYL5pFOXydON3LP3nhhn27qPfG1vBDAw7ixQEoyfcW_tY8T8WSNA6u1Z1OS7dz20fOeF2w2jl4QJIUv33LPfi1KOtD7BC6dVDEg3E6w77vEYGU3-1uYXpojajgK8nZDMHm-6GZPGekKqyZa6vY1jfTm68YjJbektmMqAE4GDCAyx-yYw1oCbtErFVUIJmSU33LPyUIu_dC-VdmqpLuNZTZ2M0ZyQ9-mWVKlcmJMt4xRzYHIwYQYj6J5yvpWM1ebQvHROho2JDzVcZEHXNLco68yEhY0bdxe7LoCNkGc-zKWQy8Fay2g_E_VNZa3yvBf4TNwmuZD2YMA-UKy7F8evjKw5GEkviA7N3YmV0dlfDpziLdeJpjr3ONwN1K5QFzWDWvHSkx4VWKdfQCPImuoSzdy_wzW-ubge6QISRdxI6SkZg-8jzGuh-r_VXC5KsGeV7WiGMt-P8khatn53fLtD7XdyR7KG1tltMxq86UmPtWedK82ZOqRgkJVCceV38PdBt_U57jw6ByOFLyfTk-FlUR7Xt6ZT1cW3KNT5UFsK2M1hkFE9djClMBIk730xXRkuiCo",
          }));

          if (response.statusCode == 200 ) {
          return RiwayatResponse.fromJson(response.data);
          } else {
            return null;
          }
>>>>>>> 90429cd98c07fbf14521cb20d7c3ed6a59febffc
    } catch (e) {
      print(e);
      return null;
    }
  }

  static createUser(String s, String t, String u) {}
<<<<<<< HEAD
=======



>>>>>>> 90429cd98c07fbf14521cb20d7c3ed6a59febffc
}
