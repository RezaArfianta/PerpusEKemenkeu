import 'dart:convert';

import 'package:dio/dio.dart';
import 'models/katalogmodel.dart';
import 'models/buku.dart';
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

  static Future<KatalogResponse?> getListCatalogue(
      int page, String keyword) async {
    try {
      Response response = await Dio().get(
          'https://demo-service.kemenkeu.go.id/perpustakaan/Koleksi/GetAll?PageSize=10&Page=$page');
      print('data katalog');
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
          'https://demo-service.kemenkeu.go.id/perpustakaan/Sirkulasi/GetAll?PageSize=10&Page=$page',
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization":
                "Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjQyNDc0QTY4NDNBM0VBNTc2MTcyNDE2MTIxMEQ2OTlBMEZFNDQ2Q0EiLCJ0eXAiOiJhdCtqd3QiLCJ4NXQiOiJRa2RLYUVPajZsZGhja0ZoSVExcG1nX2tSc28ifQ.eyJuYmYiOjE2NjE5MTM0MjUsImV4cCI6MTY2MTkzMTQyNSwiaXNzIjoiaHR0cHM6Ly9kZW1vLWFjY291bnQua2VtZW5rZXUuZ28uaWQiLCJhdWQiOlsiZnJvbnRlbmQubmFkaW5lIiwiYWdlbmRhLmVrZW1lbmtldSIsInJhcGF0LmVrZW1lbmtldSIsImtlaGFkaXJhbi5la2VtZW5rZXUiLCJvcmdhbmlzYXNpLmhyaXMiLCJwcm9maWwuaHJpcyIsImphYmF0YW4uaHJpcyIsInBhbmdrYXQuaHJpcyIsImRpa2xhdC5ocmlzIiwia2VsdWFyZ2EuaHJpcyIsInBlbmRpZGlrYW4uaHJpcyIsImVrZW1lbmtldSIsImtvbGFib3Jhc2kuZWtlbWVua2V1IiwicGVnYXdhaS5la2VtZW5rZXUiXSwiY2xpZW50X2lkIjoiZWtlbWVua2V1LW9hLWRldiIsIkVuYWJsZU1GQSI6ImZhbHNlIiwic3ViIjoiMmI3YTNiZGMtMGVmZi00YWIyLWI2YjQtZjYwMTM1ZGRlOTk4IiwiYXV0aF90aW1lIjoxNjYxOTEzNDI1LCJpZHAiOiJsb2NhbCIsIm5hbWUiOiJFcml0YSBZdWxpYXN0dXRpIiwiaWQiOiIxMTUyNzkiLCJhZGRyZXNzIjoiQXB0LiBHYWRpbmcgTmlhcyBSZXNpZGVuY2UgVG93ZXIgQ2hyeXNhbnQgTm8uIEMvMTcvSkQgS2VsYXBhIEdhZGluZyBKYWthcnRhIFV0YXJhIiwicGhvbmVfbnVtYmVyIjoiMDgxMjI3MDc3NDc3IiwibmlwIjoiMTk4NTA3MTMyMDEwMTIyMDAxIiwiamFiYXRhbiI6IlBlbGFrc2FuYSIsImplbmlzX2phYmF0YW4iOiJGdW5nc2lvbmFsIFVtdW0gUE5TIiwia29kZV9vcmdhbmlzYXNpIjoiMzUwMzEwMTgwMiIsIm9yZ2FuaXNhc2kiOiJTdWJiaWRhbmcgUGVyYW5jYW5nYW4gZGFuIFBlbmdlbWJhbmdhbiBBcGxpa2FzaSBJLCBCaWRhbmcgQXBsaWthc2ksIFB1c2F0IFNpc3RlbSBJbmZvcm1hc2kgZGFuIFRla25vbG9naSBLZXVhbmdhbiwgU2VrcmV0YXJpYXQgSmVuZGVyYWwiLCJrb2RlX3NhdGtlciI6IjY3MjkwNiIsInNhdGtlciI6IlB1c2F0IFNpc3RlbSBJbmZvcm1hc2kgZGFuIFRla25vbG9naSBLZXVhbmdhbiIsImdyYXZhdGFyIjoiaHR0cHM6Ly9hY2NvdW50LmtlbWVua2V1LmdvLmlkL21hbmFnZS9VcGxvYWRzL1RodW1ibmFpbHMvMTk4NTA3MTMyMDEwMTIyMDAxLmpwZyIsInByZWZlcnJlZF91c2VybmFtZSI6IjE5ODUwNzEzMjAxMDEyMjAwMSIsImVtYWlsIjoiZXJpdGEueUBrZW1lbmtldS5nby5pZCIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJqdGkiOiJUVXhLYm8zbmNqV1Y1SWdONmRkMG1RIiwic2NvcGUiOlsib3BlbmlkIiwicHJvZmlsZSIsImZyb250ZW5kLm5hZGluZSIsImFnZW5kYS5la2VtZW5rZXUiLCJyYXBhdC5la2VtZW5rZXUiLCJrZWhhZGlyYW4uZWtlbWVua2V1Iiwib3JnYW5pc2FzaS5ocmlzIiwicHJvZmlsLmhyaXMiLCJqYWJhdGFuLmhyaXMiLCJwYW5na2F0LmhyaXMiLCJkaWtsYXQuaHJpcyIsImtlbHVhcmdhLmhyaXMiLCJwZW5kaWRpa2FuLmhyaXMiLCJla2VtZW5rZXUiLCJrb2xhYm9yYXNpLmVrZW1lbmtldSIsInBlZ2F3YWkuZWtlbWVua2V1Il0sImFtciI6WyJwd2QiXX0.MuKRYRClHcnlDkfX7iBM5imotVihCtlEKcgcuLlWbOmk14tNB1r4cV8pPIX_UutbEPYwbXz-pO3iVOZNXfhQqOVfU9LzyTypjo34MIFRfnp-0Z_bp7g3COtNikT_LdPAPvpCzLANRoefaj7-tuNlYGFTo1b8oim-MzIWFkNAHGyBN-9FeugeE05wFVjRaws9pmYAFbtKZfcoPJlsLunoXHdnryH7ZzMtHsDlQ_q3OPnky_D1Oon_-PcR4yx9w2YAk3q5Q2PM6M-PoOWlncAbbAc8xG8CMgLzI7qMtowXlgmZOORvaGqgTLaZpL0mS04DZ9Q27p2zDdMpcSKRhffnRmVmeAA2JiMB2M9RDr-1zXwLWX_bavjGp_YwIEdOpM5V2bAdNJAw7vbjbGRzMFFkpx3LJMAkIgehteyVg1wthxR9d0Z7Wm-kd9u5aGKYWZlsfRGGa1EmgC20e1blSFGXO2_zsP8wrqeS807T1tqL0oW_otOZbdBatPDVBE4H-uf9nQk3rKv1VsWnf8ZDAHdyUMdFqTXqSYVJTTqRU9j7mAy7mozXtWG0uHeQi8T-cIf17b5wvimgsHe_evhIH672f7QZwC4LpHQeE1J7on6XjfL81C-L5uHNN-QniCVEk60RZGl7RUqddPoLPffXPZe36N4BnjnVEUgSpibZ-ueCjrU",
          }));
      print('data riwayat');
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

  static Future<DetailKatalogResponse?> getDetailCatalogue(int id) async {
    try {
      Response response = await Dio()
          .get('https://demo-service.kemenkeu.go.id/perpustakaan/Koleksi/$id');
      print('popup katalog');
      print(jsonEncode(response.data));
      if (response.statusCode == 200) {
        return DetailKatalogResponse.fromJson(response.data);
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
