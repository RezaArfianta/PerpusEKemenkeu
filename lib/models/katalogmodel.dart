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

class DetailKatalogResponse {
  IsiKatalog? data;
  String? errors;
  bool? success;
  String? message;

  DetailKatalogResponse({this.data, this.errors, this.success, this.message});

  DetailKatalogResponse.fromJson(Map<String, dynamic> json) {
    data = json['Data'] != null ? new IsiKatalog.fromJson(json['Data']) : null;
    errors = json['Errors'];
    success = json['Success'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    data['Errors'] = this.errors;
    data['Success'] = this.success;
    data['Message'] = this.message;
    return data;
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
      {this.judulBuku,
      this.abstrak,
      this.lokasi,
      this.subyek,
      this.fileCover,
      this.namaPenerbit,
      this.isbn,
      this.namaPengarang,
      this.tahunTerbit,
      this.lokasiRak});

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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['JudulBuku'] = this.judulBuku;
    data['Abstrak'] = this.abstrak;
    data['Lokasi'] = this.lokasi;
    data['Subyek'] = this.subyek;
    data['FileCover'] = this.fileCover;
    data['NamaPenerbit'] = this.namaPenerbit;
    data['Isbn'] = this.isbn;
    data['NamaPengarang'] = this.namaPengarang;
    data['TahunTerbit'] = this.tahunTerbit;
    data['LokasiRak'] = this.lokasiRak;
    return data;
  }
}
