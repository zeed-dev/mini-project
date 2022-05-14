import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_app/models/booking.dart';

class BookingService {
  final CollectionReference _ref =
      FirebaseFirestore.instance.collection('bookings');

  Future<void> createBooking(BookingModel booking) async {
    await _ref.doc(booking.id).set(booking.toJson());
  }

  Future<void> updateBooking(BookingModel booking) async {
    await _ref.doc(booking.id).update(booking.toJson());
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
        createdAt: doc["createdAt"],
        updatedAt: doc["updatedAt"],
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
        nama: doc["nama"],
        createdAt: doc["createdAt"],
        updatedAt: doc["updatedAt"],
      ));
    }
    return bookings;
  }
}

BookingService bookingService = BookingService();
