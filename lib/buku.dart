class BukuTerbaru {
  int? id;
  String? judulbuku;
  String? fileCover;
  DateTime? createdDate;
  String? namaPengarang;
  String? namaPenerbit;
  dynamic jumlah;
  String? lokasiRak;
  String? lokasi;

  BukuTerbaru({
    required this.judulbuku, required this.fileCover, required this.createdDate, 
    required this.namaPengarang, required this.namaPenerbit, required this.jumlah,
    required this.lokasiRak, required this.lokasi});
  
  BukuTerbaru.fromJson(Map<String, dynamic> json){
    id = json['id'];
    fileCover = json['FileCover'];
    createdDate = json['CreatedDate'];
    namaPengarang = json['NamaPengarang'];
    namaPenerbit = json['NamaPenerbit'];
    jumlah = json['Jumlah'];
    lokasiRak = json['LokasiRak'];
    lokasi = json['Lokasi'];
  }
}