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
        data!.add(new Catalogue.fromJson(v));
      });
    }
    total = json['Total'];
    success = json['Success'];
    message = json['Message'];
  }
}
