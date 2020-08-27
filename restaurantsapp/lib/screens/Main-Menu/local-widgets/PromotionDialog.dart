import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomDialog extends StatefulWidget {
  //Defualt construtor
  CustomDialog();

  @override
  State<StatefulWidget> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: dialogContent()
          
        );
  }

  dialogContent() {
    return Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(17),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0)),
            ]),
        child: Image.network(
            "http://www.malaysiafnb.com/photo/promotion/july/BBQPlazaJulyPromotion.jpg"));
  }
}
