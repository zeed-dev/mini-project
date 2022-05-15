import 'dart:developer';

import 'package:covid_app/common/enum_state.dart';
import 'package:covid_app/models/booking.dart';
import 'package:covid_app/services/booking_service.dart';
import 'package:covid_app/view_models/base_view_model.dart';

class BookingViewModel extends BaseViewModel {
  BookingModel? _booking;
  BookingModel? get booking => _booking;

  List<BookingModel>? _bookingList;
  List<BookingModel>? get bookingList => _bookingList;

  Future<void> createBooking(BookingModel booking) async {
    try {
      requestStateChnage = RequestState.LOADING;
      await bookingService.createBooking(booking);
      _booking = booking;
      notifyListeners();
      requestStateChnage = RequestState.LOADED;
    } catch (e) {
      log("ERROR createBooking :: $e");
      errMsgChange = e.toString();
      requestStateChnage = RequestState.ERROR;
    }
  }

  Future<void> updateBooking(BookingModel booking) async {
    try {
      requestStateChnage = RequestState.LOADING;
      await bookingService.updateBooking(booking);
      _booking = booking;
      notifyListeners();
      requestStateChnage = RequestState.LOADED;
    } catch (e) {
      log("ERROR updateBooking :: $e");
      errMsgChange = e.toString();
      requestStateChnage = RequestState.ERROR;
    }
  }

  Future<void> getBookingByUserId(String id) async {
    try {
      requestStateChnage = RequestState.LOADING;
      _bookingList = await bookingService.getBookingByUserId(id);
      notifyListeners();
      requestStateChnage = RequestState.LOADED;
    } catch (e) {
      log("ERROR getBookingByUserId :: $e");
      errMsgChange = e.toString();
      requestStateChnage = RequestState.ERROR;
    }
  }

  Future<void> getBookingByStatus(String status) async {
    try {
      requestStateChnage = RequestState.LOADING;
      _bookingList = await bookingService.getBookingByStatus(status);
      notifyListeners();
      requestStateChnage = RequestState.LOADED;
    } catch (e) {
      log("ERROR getBookingByStatus :: $e");
      errMsgChange = e.toString();
      requestStateChnage = RequestState.ERROR;
    }
  }
}
