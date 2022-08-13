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
