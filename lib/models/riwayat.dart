class Riwayat {
  int? id;
  
  Riwayat();

  Riwayat.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    
}

}