import 'package:flutter/material.dart';
import '../../../class/Drink.dart';

class StructuredGridCell extends StatelessWidget {
  final Drink drink;
  const StructuredGridCell(this.drink);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Card(
            elevation: 1.5,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                Image.network(drink.ImageURL),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    drink.Name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text("Price: \$10.50"),
                ),
                
              ],
            )),
      ),
    );
  }
}
