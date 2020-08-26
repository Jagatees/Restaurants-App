import 'package:flutter/material.dart';
import 'package:restaurantsapp/class/Reservation-Data.dart';
import '../../services/Reservation-DAL.dart';
import '../bloc/ReservationBloc.dart';

class Reservation extends StatefulWidget{
  
  static const routeName = "/Reservation";

  //Defualt construtor
  Reservation();

  @override
  State<StatefulWidget> createState() => _ReservationState();

}

class _ReservationState extends State<Reservation>{

  ReservationBloc _reservationBloc = ReservationBloc();
  @override
  void initState() {
    super.initState();

    ReservationDAL reservationDAL  = ReservationDAL();
    reservationDAL.getReservations(_reservationBloc);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(appBar: AppBar(title: Text("Reservation")), body:Center(child: Text("Hello Reservation")));

  }
}