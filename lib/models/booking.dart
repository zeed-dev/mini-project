import 'package:cloud_firestore/cloud_firestore.dart';

class BookingModel {
  final String? id;
  final String? userId;
  final String? dateVisit;
  final String? vaksinKe;
  final String? status;
  final String? faskes;
  final String? alamat;
  final String? noTelp;
  final String? nama;
  final Timestamp? createdAt;
  final Timestamp? updatedAt;

  BookingModel({
    this.id,
    this.userId,
    this.dateVisit,
    this.vaksinKe,
    this.status = "BOOKED",
    this.faskes,
    this.alamat,
    this.noTelp,
    this.nama,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'dateVisit': dateVisit,
      'vaksinKe': vaksinKe,
      'status': status,
      'faskes': faskes,
      'alamat': alamat,
      'no_telp': noTelp,
      'nama': nama,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory BookingModel.fromJson(Map<String, dynamic> map) {
    return BookingModel(
      id: map['id'],
      userId: map['userId'],
      dateVisit: map['dateVisit'],
      vaksinKe: map['vaksinKe'],
      status: map['status'],
      faskes: map['faskes'],
      alamat: map['alamat'],
      noTelp: map['no_telp'],
      nama: map['nama'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }

  BookingModel copyWith({
    String? id,
    String? userId,
    String? dateVisit,
    String? vaksinKe,
    String? status,
    String? faskes,
    String? alamat,
    String? noTelp,
    String? nama,
    Timestamp? createdAt,
    Timestamp? updatedAt,
  }) {
    return BookingModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      dateVisit: dateVisit ?? this.dateVisit,
      vaksinKe: vaksinKe ?? this.vaksinKe,
      status: status ?? this.status,
      faskes: faskes ?? this.faskes,
      alamat: alamat ?? this.alamat,
      noTelp: noTelp ?? this.noTelp,
      nama: nama ?? this.nama,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
