class Buku {
  int? id;
  String? judulBuku;
  String? fileCover;
  String? createdDate;
  String? namaPengarang;
  String? namaPenerbit;
  dynamic jumlah;
  String? lokasiRak;
  String? lokasi;

  Buku({
    required this.judulBuku, required this.fileCover, required this.createdDate, 
    required this.namaPengarang, required this.namaPenerbit, required this.jumlah,
    required this.lokasiRak, required this.lokasi});
  
  Buku.fromJson(Map<String, dynamic> json){
    id = json['Id'];
    judulBuku = json['JudulBuku'];
    fileCover = json['FileCover'];
    createdDate = json['CreatedDate'];
    namaPengarang = json['NamaPengarang'];
    namaPenerbit = json['NamaPenerbit'];
    jumlah = json['Jumlah'];
    lokasiRak = json['LokasiRak'];
    lokasi = json['Lokasi'];
  }
}