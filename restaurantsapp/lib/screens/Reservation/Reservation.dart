import 'package:flutter/material.dart';
import 'package:restaurantsapp/class/Reservation-Data.dart';
import '../../services/Reservation-DAL.dart';
import '../bloc/ReservationBloc.dart';

class Reservation extends StatefulWidget {
  static const routeName = "/Reservation";

  //Defualt construtor
  Reservation();

  @override
  State<StatefulWidget> createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  ReservationBloc _reservationBloc = ReservationBloc();
  @override
  void initState() {
    super.initState();

    ReservationDAL reservationDAL = ReservationDAL();
    reservationDAL.getReservations(_reservationBloc);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Reservation")),
        body: StreamBuilder<Map<DateTime, List<ReservationData>>>(
          stream: _reservationBloc.reservationListStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                  itemBuilder: (BuildContext context, int index) =>
                      Text(snapshot.data[DateTime.parse("2020-08-26 19:00:00.000")][0].toString()),
                  separatorBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                    );
                  },
                  itemCount: snapshot.data.length);
            } else {
              return CircularProgressIndicator();
            }
          },
        ));
  }
}
