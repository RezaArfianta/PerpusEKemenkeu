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
          'https://demo-service.kemenkeu.go.id/perpustakaan/Koleksi/GetAll?PageSize=10&Page=$page&keyword=$keyword');
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
          'https://demo-service.kemenkeu.go.id/perpustakaan/Sirkulasi/GetAll?PageSize=10&Page=$page&keyword=$keyword',
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization":
                "Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6IjQyNDc0QTY4NDNBM0VBNTc2MTcyNDE2MTIxMEQ2OTlBMEZFNDQ2Q0EiLCJ0eXAiOiJhdCtqd3QiLCJ4NXQiOiJRa2RLYUVPajZsZGhja0ZoSVExcG1nX2tSc28ifQ.eyJuYmYiOjE2NjI2MTk3NTUsImV4cCI6MTY2MjYzNzc1NSwiaXNzIjoiaHR0cHM6Ly9kZW1vLWFjY291bnQua2VtZW5rZXUuZ28uaWQiLCJhdWQiOlsiZnJvbnRlbmQubmFkaW5lIiwiYWdlbmRhLmVrZW1lbmtldSIsInJhcGF0LmVrZW1lbmtldSIsImtlaGFkaXJhbi5la2VtZW5rZXUiLCJvcmdhbmlzYXNpLmhyaXMiLCJwcm9maWwuaHJpcyIsImphYmF0YW4uaHJpcyIsInBhbmdrYXQuaHJpcyIsImRpa2xhdC5ocmlzIiwia2VsdWFyZ2EuaHJpcyIsInBlbmRpZGlrYW4uaHJpcyIsImVrZW1lbmtldSIsImtvbGFib3Jhc2kuZWtlbWVua2V1IiwicGVnYXdhaS5la2VtZW5rZXUiXSwiY2xpZW50X2lkIjoiZWtlbWVua2V1LW9hLWRldiIsIkVuYWJsZU1GQSI6ImZhbHNlIiwic3ViIjoiMmI3YTNiZGMtMGVmZi00YWIyLWI2YjQtZjYwMTM1ZGRlOTk4IiwiYXV0aF90aW1lIjoxNjYyNjAwNzkwLCJpZHAiOiJsb2NhbCIsIm5hbWUiOiJFcml0YSBZdWxpYXN0dXRpIiwiaWQiOiIxMTUyNzkiLCJhZGRyZXNzIjoiQXB0LiBHYWRpbmcgTmlhcyBSZXNpZGVuY2UgVG93ZXIgQ2hyeXNhbnQgTm8uIEMvMTcvSkQgS2VsYXBhIEdhZGluZyBKYWthcnRhIFV0YXJhIiwicGhvbmVfbnVtYmVyIjoiMDgxMjI3MDc3NDc3IiwibmlwIjoiMTk4NTA3MTMyMDEwMTIyMDAxIiwiamFiYXRhbiI6IlBlbGFrc2FuYSIsImplbmlzX2phYmF0YW4iOiJGdW5nc2lvbmFsIFVtdW0gUE5TIiwia29kZV9vcmdhbmlzYXNpIjoiMzUwMzEwMTgwMiIsIm9yZ2FuaXNhc2kiOiJTdWJiaWRhbmcgUGVyYW5jYW5nYW4gZGFuIFBlbmdlbWJhbmdhbiBBcGxpa2FzaSBJLCBCaWRhbmcgQXBsaWthc2ksIFB1c2F0IFNpc3RlbSBJbmZvcm1hc2kgZGFuIFRla25vbG9naSBLZXVhbmdhbiwgU2VrcmV0YXJpYXQgSmVuZGVyYWwiLCJrb2RlX3NhdGtlciI6IjY3MjkwNiIsInNhdGtlciI6IlB1c2F0IFNpc3RlbSBJbmZvcm1hc2kgZGFuIFRla25vbG9naSBLZXVhbmdhbiIsImdyYXZhdGFyIjoiaHR0cHM6Ly9hY2NvdW50LmtlbWVua2V1LmdvLmlkL21hbmFnZS9VcGxvYWRzL1RodW1ibmFpbHMvMTk4NTA3MTMyMDEwMTIyMDAxLmpwZyIsInByZWZlcnJlZF91c2VybmFtZSI6IjE5ODUwNzEzMjAxMDEyMjAwMSIsImVtYWlsIjoiZXJpdGEueUBrZW1lbmtldS5nby5pZCIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJqdGkiOiJ5T3F1SzlpYm9rOW1EeUZud0I3UXdRIiwic2NvcGUiOlsib3BlbmlkIiwicHJvZmlsZSIsImZyb250ZW5kLm5hZGluZSIsImFnZW5kYS5la2VtZW5rZXUiLCJyYXBhdC5la2VtZW5rZXUiLCJrZWhhZGlyYW4uZWtlbWVua2V1Iiwib3JnYW5pc2FzaS5ocmlzIiwicHJvZmlsLmhyaXMiLCJqYWJhdGFuLmhyaXMiLCJwYW5na2F0LmhyaXMiLCJkaWtsYXQuaHJpcyIsImtlbHVhcmdhLmhyaXMiLCJwZW5kaWRpa2FuLmhyaXMiLCJla2VtZW5rZXUiLCJrb2xhYm9yYXNpLmVrZW1lbmtldSIsInBlZ2F3YWkuZWtlbWVua2V1Il0sImFtciI6WyJwd2QiXX0.LOt5_UXp6AQTV4sM6uJvzVdMMbNu5UIgqRi85qKHQfoZBmqHTfA5aH4BmULF7M0ld4azGcZe_XHJSeaJ4tE58Tq8e4g7eXxc1G7aRgCljpGcmBO1qcCHryv2j18MpJg4PMKlEH47m5K43L6ukZEIk6-48qnnOzY_8J833jdLc3izBE8wobI4MWus-t-v0RIkO9EyXCjZYU-izDV2RrFRY8kuyHbYf-CnaZLNhYFHNnlksLjU57dcy6SDM8xp6R4v5mQMLsV9f1JrXvr76MiZL2TzU7-i8poIvrRKWwNLrdC_RViQ_mTDcFSOfrNSMHt3KwA6J5FNatTkKq6Gnn23o8WryWmRa6unXIJL5QGdsRbwlsmfe2CaPpODrcdTe29TuFx2A4xFPkRAb-8fzQpKKpsvfVZ8ekr2JQuz1zhLKXqeWjlsJRdEV4iwwCn9jQ7orHDzYoqOf_etnGxupQItXQvvAlsHAtiBmtbzYLiGag3DlkPbsMd_8yaevQPEah_echJlBOG4Ymlv6zlQ6p50nrocNuurl1G6eg2AaEgvsGDC3odUtWChctH2NVldR_0g5ZrM3NnNG1mqOYDjeyVfSBpMG9-_EC9jN1E8VYzsmzo4Yvugjk1Tac4GZ2BTYNuqeBJc0JhabFvGtv3F3A_W-WsJJLl4R_qdRCh8pl4x1T4",
          }));
      print('data riwayat');
      if (response.statusCode == 200) {
        print("$response.data");
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
