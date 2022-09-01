class Catalogue {
  int? id;
  String? judulbuku;
  String? abstrak;
  String? lokasi;

  Catalogue(
      {required this.judulbuku, required this.abstrak, required this.lokasi});

  Catalogue.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    judulbuku = json['JudulBuku'];
    abstrak = json['Abstrak'];
    lokasi = json['Lokasi'];
  }
}

class KatalogResponse {
  List<Catalogue>? data;
  int? total;
  bool? success;
  String? message;

  KatalogResponse({this.data, this.total, this.success, this.message});

  KatalogResponse.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = <Catalogue>[];
      json['Data'].forEach((v) {
        data!.add(Catalogue.fromJson(v));
      });
    }
    total = json['Total'];
    success = json['Success'];
    message = json['Message'];
  }
}

class IsiKatalog {
  String? judulBuku;
  String? abstrak;
  String? lokasi;
  String? subyek;
  String? fileCover;
  String? namaPenerbit;
  String? isbn;
  String? namaPengarang;
  String? tahunTerbit;
  String? lokasiRak;

  IsiKatalog(
      {required this.judulBuku,
      required this.abstrak,
      required this.lokasi,
      required this.subyek,
      required this.fileCover,
      required this.namaPenerbit,
      required this.isbn,
      required this.namaPengarang,
      required this.tahunTerbit,
      required this.lokasiRak});

  IsiKatalog.fromJson(Map<String, dynamic> json) {
    judulBuku = json['JudulBuku'];
    abstrak = json['Abstrak'];
    lokasi = json['Lokasi'];
    subyek = json['Subyek'];
    fileCover = json['FileCover'];
    namaPenerbit = json['NamaPenerbit'];
    isbn = json['Isbn'];
    namaPengarang = json['NamaPengarang'];
    tahunTerbit = json['TahunTerbit'];
    lokasiRak = json['LokasiRak'];
  }
}

class DetailKatalog {
  List<IsiKatalog>? data;
  bool? success;
  String? message;

  DetailKatalog({this.data, this.success, this.message});

  DetailKatalog.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = <IsiKatalog>[];
      json['Data'].forEach((v) {
        data!.add(IsiKatalog.fromJson(v));
      });
    }
    success = json['Success'];
    message = json['Message'];
  }
}
