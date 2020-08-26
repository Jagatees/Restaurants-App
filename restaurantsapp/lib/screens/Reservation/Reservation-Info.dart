import 'package:flutter/material.dart';
import '../Screen-Arguments/ReservationInfo.dart';
import '../../services/Reservation-DAL.dart';

class ReservationInfo extends StatefulWidget {
  static const routeName = "/ReservationInfo";

  //Defualt construtor
  ReservationInfo();

  @override
  State<StatefulWidget> createState() => _ReservationInfoState();
}

class _ReservationInfoState extends State<ReservationInfo> {
  
  
  _ReservationInfoState();

  //Text field controllers
  TextEditingController _name = TextEditingController();
  TextEditingController _contact = TextEditingController();


  ReservationDAL reservationDAL = ReservationDAL();

  _addReservation(DateTime reservationID) async{
    await reservationDAL.addReservation(_name.text, _contact.text, reservationID);
    print("Reserved");
    Navigator.popAndPushNamed(context, "/Main-Menu");
  }

  @override
  Widget build(BuildContext context) {
    final ScreenArgumentsReservationInfo args =
        ModalRoute.of(context).settings.arguments;
    print(args.reservationID);

    return Scaffold(
      appBar: AppBar(
        title: Text("Reservation"),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: _name,
              decoration: InputDecoration(hintText: "Name"),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _contact,
              decoration: InputDecoration(hintText: "Contact Person"),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  onPressed: () {_addReservation(args.reservationID);},
                  child: Text("Reserve"),
                ))
          ],
        ),
      ),
    );
  }
}
