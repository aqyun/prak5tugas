// To parse this JSON data, do
//
//     final vacations = vacationsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Vacations vacationsFromJson(String str) => Vacations.fromJson(json.decode(str));

String vacationsToJson(Vacations data) => json.encode(data.toJson());

class Vacations {
  Vacations({
    required this.data,
  });

  List<Vacation> data;

  factory Vacations.fromJson(Map<String, dynamic> json) => Vacations(
        data:
            List<Vacation>.from(json["data"].map((x) => Vacation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Vacation {
  Vacation({
    required this.id,
    required this.nama,
    required this.lokasi,
    required this.deskripsi,
    required this.hargaTiket,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String nama;
  String lokasi;
  String deskripsi;
  int hargaTiket;
  String imageUrl;
  DateTime createdAt;
  DateTime updatedAt;

  factory Vacation.fromJson(Map<String, dynamic> json) => Vacation(
        id: json["id"],
        nama: json["nama"],
        lokasi: json["lokasi"],
        deskripsi: json["deskripsi"],
        hargaTiket: json["harga_tiket"],
        imageUrl: json["image_url"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "lokasi": lokasi,
        "deskripsi": deskripsi,
        "harga_tiket": hargaTiket,
        "image_url": imageUrl,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
