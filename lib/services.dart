import 'package:dio/dio.dart';
import 'models/katalogmodel.dart';
import 'models/buku.dart';
import 'models/riwayatmodel.dart';

import 'models/riwayatmodel.dart';
//Buat semua pemanggilan API di seluruh page ke file services.dart ini

abstract class Services {
  static Future<List<Buku>?> getListBukuTerbaru() async {
    try {
      Response response = await Dio().get(
          'https://demo-service.kemenkeu.go.id/perpustakaan/Koleksi/GetTerbaru');
      // ignore: avoid_print
      print('dapat data terbaru');
      if (response.statusCode == 200) {
        return List<Buku>.from(
            response.data['Data'].map((i) => Buku.fromJson(i)));
      } else {
        return null;
      }
    } catch (e) {
      // ignore: avoid_print
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

  static Future<RiwayatResponse?> getListHistory(
      int page, String keyword) async {
        
    try {
      Response response = await Dio().get(
          'https://demo-service.kemenkeu.go.id/perpustakaan/Sirkulasi/GetAll?PageSize=10&Page=$page&keyword=$keyword',
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization":
                "Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjQyNDc0QTY4NDNBM0VBNTc2MTcyNDE2MTIxMEQ2OTlBMEZFNDQ2Q0EiLCJ0eXAiOiJhdCtqd3QiLCJ4NXQiOiJRa2RLYUVPajZsZGhja0ZoSVExcG1nX2tSc28ifQ.eyJuYmYiOjE2NjE5MzUyMjEsImV4cCI6MTY2MTk1MzIyMSwiaXNzIjoiaHR0cHM6Ly9kZW1vLWFjY291bnQua2VtZW5rZXUuZ28uaWQiLCJhdWQiOlsiZnJvbnRlbmQubmFkaW5lIiwiYWdlbmRhLmVrZW1lbmtldSIsInJhcGF0LmVrZW1lbmtldSIsImtlaGFkaXJhbi5la2VtZW5rZXUiLCJvcmdhbmlzYXNpLmhyaXMiLCJwcm9maWwuaHJpcyIsImphYmF0YW4uaHJpcyIsInBhbmdrYXQuaHJpcyIsImRpa2xhdC5ocmlzIiwia2VsdWFyZ2EuaHJpcyIsInBlbmRpZGlrYW4uaHJpcyIsImVrZW1lbmtldSIsImtvbGFib3Jhc2kuZWtlbWVua2V1IiwicGVnYXdhaS5la2VtZW5rZXUiXSwiY2xpZW50X2lkIjoiZWtlbWVua2V1LW9hLWRldiIsIkVuYWJsZU1GQSI6ImZhbHNlIiwic3ViIjoiMmI3YTNiZGMtMGVmZi00YWIyLWI2YjQtZjYwMTM1ZGRlOTk4IiwiYXV0aF90aW1lIjoxNjYxOTM1MjIwLCJpZHAiOiJsb2NhbCIsIm5hbWUiOiJFcml0YSBZdWxpYXN0dXRpIiwiaWQiOiIxMTUyNzkiLCJhZGRyZXNzIjoiQXB0LiBHYWRpbmcgTmlhcyBSZXNpZGVuY2UgVG93ZXIgQ2hyeXNhbnQgTm8uIEMvMTcvSkQgS2VsYXBhIEdhZGluZyBKYWthcnRhIFV0YXJhIiwicGhvbmVfbnVtYmVyIjoiMDgxMjI3MDc3NDc3IiwibmlwIjoiMTk4NTA3MTMyMDEwMTIyMDAxIiwiamFiYXRhbiI6IlBlbGFrc2FuYSIsImplbmlzX2phYmF0YW4iOiJGdW5nc2lvbmFsIFVtdW0gUE5TIiwia29kZV9vcmdhbmlzYXNpIjoiMzUwMzEwMTgwMiIsIm9yZ2FuaXNhc2kiOiJTdWJiaWRhbmcgUGVyYW5jYW5nYW4gZGFuIFBlbmdlbWJhbmdhbiBBcGxpa2FzaSBJLCBCaWRhbmcgQXBsaWthc2ksIFB1c2F0IFNpc3RlbSBJbmZvcm1hc2kgZGFuIFRla25vbG9naSBLZXVhbmdhbiwgU2VrcmV0YXJpYXQgSmVuZGVyYWwiLCJrb2RlX3NhdGtlciI6IjY3MjkwNiIsInNhdGtlciI6IlB1c2F0IFNpc3RlbSBJbmZvcm1hc2kgZGFuIFRla25vbG9naSBLZXVhbmdhbiIsImdyYXZhdGFyIjoiaHR0cHM6Ly9hY2NvdW50LmtlbWVua2V1LmdvLmlkL21hbmFnZS9VcGxvYWRzL1RodW1ibmFpbHMvMTk4NTA3MTMyMDEwMTIyMDAxLmpwZyIsInByZWZlcnJlZF91c2VybmFtZSI6IjE5ODUwNzEzMjAxMDEyMjAwMSIsImVtYWlsIjoiZXJpdGEueUBrZW1lbmtldS5nby5pZCIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJqdGkiOiJpZHR5Z1htYUZOMGJzRTN2N0lSNkRBIiwic2NvcGUiOlsib3BlbmlkIiwicHJvZmlsZSIsImZyb250ZW5kLm5hZGluZSIsImFnZW5kYS5la2VtZW5rZXUiLCJyYXBhdC5la2VtZW5rZXUiLCJrZWhhZGlyYW4uZWtlbWVua2V1Iiwib3JnYW5pc2FzaS5ocmlzIiwicHJvZmlsLmhyaXMiLCJqYWJhdGFuLmhyaXMiLCJwYW5na2F0LmhyaXMiLCJkaWtsYXQuaHJpcyIsImtlbHVhcmdhLmhyaXMiLCJwZW5kaWRpa2FuLmhyaXMiLCJla2VtZW5rZXUiLCJrb2xhYm9yYXNpLmVrZW1lbmtldSIsInBlZ2F3YWkuZWtlbWVua2V1Il0sImFtciI6WyJwd2QiXX0.Jcu7qH7aJk7IZYCmi-51y_MP-gkt0Ajx8WaF1qxgFq9KpI7c-yHHESXYdxFhh0WrGcBAyAoxU6mKNmcEVVgIPWBpPCU_L7z1coLnRDWVLSOblg9Q06R7grRf_16fDJnIruyre7GK8VNKNG9RmuMriKUdhbq08vf6IBirSsrI8jboAjHj6AhlZduk0qshnf-HgoOxMEAxyrW4uQtGGCUWQC5Fx6P4UHrIqKFPVF-eiPX_Rt_NavQEntXm9QDfbA31g_nE_cO9L3DrE06Mv8JHHoLUjaxqGTWuGLpb1uSFlDlnV5mNGoPRzATKQQc3ysvbAzlgzNvvJjb8lw0__nNctBZXvhTMM55qmW2LlAbjb2KMQpt-g1AT4tWhsIehDlktvGQA8oJfMqxrjZ-jHpExz4b13licSIJs51VD1i9Ozir7cMlvsKBk9fAIKTP51HRrSy1pc1zqfSMZNZCPPnUfCjsaKaAxBbtsnEyY4TtOItW-94UzWJoaVb46Yh6yQID1CpQdh1GYGD4UpcndGzSrweC2U4Zhdxjn3Mly_LxoZ9FRaDW8AEL_XYXkxvSmSmqPt6HCFVvyG6R7qPxApBEXUbjM_gctFqKsHfL8oj0qRFP2O8rDpgnGpVslejjsesjccY6XYCTpZ_5B5LlUj-mWPUeQ_aEimZF2-DkfjMVnNx0",
          }));
      print('data riwayat ${response.data}');
      if (response.statusCode == 200) {
        return RiwayatResponse.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<DetailKatalog?> getListDetailCatalogue() async {
    try {
      Response response = await Dio()
          .get('hhttps://demo-service.kemenkeu.go.id/perpustakaan/Koleksi/1');
      if (response.statusCode == 200) {
        return DetailKatalog.fromJson(response.data);
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
