import 'package:flutter/material.dart';
import '../../../class/Menu.dart';
import '../../bloc/MenuBloc.dart';


// ignore: must_be_immutable
class ListViewCell extends StatelessWidget{


   Menu menu;
  int count;
  final MenuBloc menuBloc;
  ListViewCell(Menu menu, this.count, this.menuBloc){
    this.menu = menu;
  }


  @override
  Widget build(BuildContext context) {
   
    _addCart(){
      menuBloc.cartAdd.add(menu);
      // setState(() => count = count + 1);
    }

    _removeCart(){
      menuBloc.cartRemove.add(menu.ID);
      // setState(() => count = count - 1);
    }

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
          IconButton(icon: Icon(Icons.add), onPressed: () => _addCart()),
          SizedBox(width:10),
          Text(count.toString(),style: TextStyle(fontSize: 20)),
          SizedBox(width:10),
          IconButton(icon: Icon(Icons.remove), onPressed: () => _removeCart()),
        ],
      ),
    ));
  }

}
