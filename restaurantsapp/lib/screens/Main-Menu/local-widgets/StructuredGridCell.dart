import 'package:flutter/material.dart';
import '../../../class/Drink.dart';

class StructuredGridCell extends StatelessWidget {
  final Drink drink;
  const StructuredGridCell(this.drink);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 1.5,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Expanded(child: Image.network(drink.ImageURL)),
            SizedBox(height: 10,),
            Text(drink.Name),
          ],
        ));
  }
}
