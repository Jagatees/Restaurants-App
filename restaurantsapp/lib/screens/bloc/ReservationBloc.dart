import 'dart:async';
import '../../class/Reservation-Data.dart';

class ReservationBloc{

  Map<String, List<ReservationData>> _reservation = {};

  final _reservationListSteamController = StreamController<Map<String, List<ReservationData>>>();
  final _reservationAddSteamController = StreamController<ReservationData>();

  Stream<Map<String, List<ReservationData>>> get reservationListStream => _reservationListSteamController.stream;
  StreamSink<Map<String, List<ReservationData>>> get reservationListSink => _reservationListSteamController.sink;

  StreamSink<ReservationData> get reservationAdd => _reservationAddSteamController.sink;

  ReservationBloc(){
    _reservationListSteamController.add(_reservation);

    _reservationAddSteamController.stream.listen((reservation) {


      if(_reservation[reservation.dateTime] == null){
        _reservation[reservation.dateTime] = List<ReservationData>();
        _reservation[reservation.dateTime].add(reservation);
      }else{
        _reservation[reservation.dateTime].add(reservation);
      }

      reservationListSink.add(_reservation);
      print("Reservation Added: "+reservation.toString());
    });

  }

    void dispose() {
    _reservationAddSteamController.close();
    _reservationListSteamController.close();
  }


}