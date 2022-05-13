import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_app/models/booking.dart';

class BookingService {
  final CollectionReference _ref =
      FirebaseFirestore.instance.collection('bookings');

  Future<void> createBooking(BookingModel booking) async {
    await _ref.doc(booking.id).set({
      'userId': booking.userId,
      'dateVisit': booking.dateVisit,
      'vaksinKe': booking.vaksinKe,
      'status': booking.status,
      'faskes': booking.faskes,
      'alamat': booking.alamat,
      'no_telp': booking.noTelp,
      'nama': booking.nama,
    });
  }

  Future<void> updateBooking(BookingModel booking) async {
    await _ref.doc(booking.id).update({
      'id': booking.id,
      'userId': booking.userId,
      'dateVisit': booking.dateVisit,
      'vaksinKe': booking.vaksinKe,
      'status': booking.status,
      'faskes': booking.faskes,
      'alamat': booking.alamat,
      'no_telp': booking.noTelp,
      'nama': booking.nama,
    });
  }

  Future<List<BookingModel>> getBookingByUserId(String userId) async {
    QuerySnapshot snapshot =
        await _ref.where('userId', isEqualTo: userId).get();
    List<BookingModel> bookings = [];
    for (var doc in snapshot.docs) {
      bookings.add(BookingModel(
        id: doc.id,
        userId: doc["userId"],
        dateVisit: doc["dateVisit"],
        vaksinKe: doc["vaksinKe"],
        status: doc["status"],
        faskes: doc["faskes"],
        alamat: doc["alamat"],
        noTelp: doc["no_telp"],
        nama: doc["nama"],
      ));
    }
    return bookings;
  }

  Future<List<BookingModel>> getBookingByStatus(String status) async {
    QuerySnapshot snapshot =
        await _ref.where('status', isEqualTo: status).get();
    List<BookingModel> bookings = [];
    for (var doc in snapshot.docs) {
      bookings.add(BookingModel(
        id: doc.id,
        userId: doc["userId"],
        dateVisit: doc["dateVisit"],
        vaksinKe: doc["vaksinKe"],
        status: doc["status"],
        faskes: doc["faskes"],
        alamat: doc["alamat"],
        noTelp: doc["no_telp"],
      ));
    }
    return bookings;
  }
}

BookingService bookingService = BookingService();
