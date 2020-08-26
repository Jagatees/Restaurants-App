import 'package:flutter/material.dart';
import 'package:restaurantsapp/class/Reservation-Data.dart';
import '../../services/Reservation-DAL.dart';
import '../bloc/ReservationBloc.dart';
import 'local-widgets/ListViewCell.dart';

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
        body: StreamBuilder<Map<String, List<ReservationData>>>(
          stream: _reservationBloc.reservationListStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<String> keys = snapshot.data.keys.toList();
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) =>
                            ListViewCell(
                                snapshot.data[keys[index]], keys[index]),
                        itemCount: keys.length),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                        child: SafeArea(
                            child: RaisedButton(
                                onPressed: () => {}, child: Text("Reserve")))),
                  )
                ],
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ));
  }
}
