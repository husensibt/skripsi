import 'package:skripsi/distribusi/model.dart';

class DistribusiModel extends Model {
  static String table = 'matkul';
  int? id;
  String? Nilai;
  String nama;
  String? ket;
//nilai
  DistribusiModel({
    this.id,
    required this.nama,
    this.Nilai,
    //this.nilai,
    this.ket,
  });

  // DistribusiModel.map(dynamic obj) {
  //   this.nama = obj['nama'];
  //   this.nilai = obj['nilai'];
  //   this.ket = obj['ket'];
  //   this.createdAt = obj['createdAt'];
  //   this.updatedAt = obj['updatedAt'];
  // }

  // String? get _nama => nama;
  // String? get _nilai => nilai;
  // String? get _ket => ket;
  // String? get _createdAt => createdAt;
  // String? get _updatedAt => updatedAt;
  static DistribusiModel fromMap(Map<String, dynamic> json) {
    return DistribusiModel(
      id: json['id'],
      nama: json['nama'].toString(),
      Nilai: json['nilai'],
      //nilai: json['nilai'].toString(),
      ket: json['keterangan'],
    );
  }
  // Map<String, dynamic> toMap() {
  //   var map = Map<String, dynamic>();

  //   map['nama'] = nama;
  //   map['nilai'] = nilai;
  //   map['ket'] = ket;
  //   map['createdAt'] = createdAt;
  //   map['updatedAt'] = updatedAt;

  //   return map;
  // }

  // void setMatkuld(int id) {
  //   this.id = id;
  // }
  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'id': id,
      'nama': nama,
      'nilai': Nilai,
      //'nilai': nilai,
      'keterangan': ket,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }
}
