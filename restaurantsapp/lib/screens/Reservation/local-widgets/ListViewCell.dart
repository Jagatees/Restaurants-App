import 'package:flutter/material.dart';
import '../../../class/Reservation-Data.dart';


class ListViewCell extends StatefulWidget{

  List<ReservationData> reservationData = new List<ReservationData>();
  String date;

  //Defualt construtor
  ListViewCell(this.reservationData, this.date);
  

  @override
  State<StatefulWidget> createState() => _ListViewCellState(this.reservationData, this.date);

}

class _ListViewCellState extends State<ListViewCell>{

  List<ReservationData> reservationData = new List<ReservationData>();
  String date;

  _ListViewCellState(this.reservationData, this.date);

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
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        color: Colors.white,
                          onPressed: () => {},
                          child: Text(reservationData[index].timeSlots))))),
        ],
      ),
    );

  }
}
