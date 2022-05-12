class BookingModel {
  final String? id;
  final String? userId;
  final String? dateVisit;
  final String? vaksinKe;
  final String? status;
  final String? faskes;
  final String? alamat;
  final String? noTelp;

  BookingModel({
    this.id,
    this.userId,
    this.dateVisit,
    this.vaksinKe,
    this.status = "BOOKED",
    this.faskes,
    this.alamat,
    this.noTelp,
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
    );
  }
}
