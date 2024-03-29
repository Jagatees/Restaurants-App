import 'package:flutter/material.dart';
import 'package:restaurantsapp/screens/Screen-Arguments/ReservationInfo.dart';
import '../../../class/Reservation-Data.dart';
import '../Reservation-Info.dart';
import '../../Reservation/Reservation-Info.dart';

class ListViewCell extends StatefulWidget {
  List<ReservationData> reservationData = new List<ReservationData>();
  String date;

  //Defualt construtor
  ListViewCell(this.reservationData, this.date);

  @override
  State<StatefulWidget> createState() =>
      _ListViewCellState(this.reservationData, this.date);
}

class _ListViewCellState extends State<ListViewCell> {
  List<ReservationData> reservationData = new List<ReservationData>();
  String date;

  _ListViewCellState(this.reservationData, this.date);

  List<Color> btnColor = List<Color>();
  int chosenIndex = 0;

  @override
  void initState() {
    // implement initState
    super.initState();

    for (ReservationData rd in reservationData) {

      Color color = rd.isAvailable == true ? Colors.white : Colors.red;
      btnColor.add(color);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                date,
                style: TextStyle(fontSize: 17),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Column(
              children: List.generate(
                  reservationData.length,
                  (index) => SizedBox(
                      width: double.infinity,
                      child: FlatButton(
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          color: btnColor[index],
                          onPressed: () => Navigator.pushNamed(context, ReservationInfo.routeName, arguments: ScreenArgumentsReservationInfo(reservationData[index].getDateTime) ),
                          child: Text(reservationData[index].timeSlots))))),
        ],
      ),
    );
  }
}
