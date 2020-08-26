import 'package:flutter/material.dart';
import '../Screen-Arguments/ReservationInfo.dart';

class ReservationInfo extends StatefulWidget {
  static const routeName = "/ReservationInfo";

  
  //Defualt construtor
  ReservationInfo();

  @override
  State<StatefulWidget> createState() => _ReservationInfoState();
}

class _ReservationInfoState extends State<ReservationInfo> {


  _ReservationInfoState();

  @override
  Widget build(BuildContext context) {
    
    final ScreenArgumentsReservationInfo args = ModalRoute.of(context).settings.arguments;
    print(args.reservationID);

    return Scaffold(
      appBar: AppBar(
        title: Text("Reservation"),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(decoration: InputDecoration(hintText: "Name"),),
            SizedBox(height: 10,),
            TextFormField(decoration: InputDecoration(hintText: "Contact Person"),)
          ],
        ),
      ),
    );
  }
}
