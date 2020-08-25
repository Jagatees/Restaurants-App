import 'package:flutter/material.dart';
import '../../../class/Menu.dart';

class ListViewCell extends StatelessWidget {
  Menu menu;
  ListViewCell(this.menu);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.network(
            menu.ImageURL,
            height: 30,
            width: 30,
          ),
          SizedBox(width:20),
          Text(menu.Name, style: TextStyle(fontSize: 15),),
          SizedBox(width:30),
          IconButton(icon: Icon(Icons.plus_one), onPressed: () => {}),
          SizedBox(width:10),
          Expanded(child: Text("1",style: TextStyle(fontSize: 20))),
          SizedBox(width:10),
          IconButton(icon: Icon(Icons.exposure_minus_1), onPressed: () => {}),
        ],
      ),
    ));
  }
}
