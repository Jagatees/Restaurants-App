import 'package:flutter/material.dart';
import '../../../class/Menu.dart';
import '../../bloc/MenuBloc.dart';

class ListViewCell extends StatelessWidget {
  Menu menu;
  final int count;
  final MenuBloc menuBloc;
  ListViewCell(this.menu, this.count, this.menuBloc);

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
          Expanded(child: Text(menu.Name, style: TextStyle(fontSize: 15),)),
          SizedBox(width:30),
          IconButton(icon: Icon(Icons.plus_one), onPressed: () => menuBloc.cartAdd.add(menu)),
          SizedBox(width:10),
          Text(count.toString(),style: TextStyle(fontSize: 20)),
          SizedBox(width:10),
          IconButton(icon: Icon(Icons.exposure_minus_1), onPressed: () => menuBloc.cartRemove.add(menu.ID)),
        ],
      ),
    ));
  }
}
