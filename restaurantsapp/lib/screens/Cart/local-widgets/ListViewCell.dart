import 'package:flutter/material.dart';
import '../../../class/Menu.dart';
import '../../bloc/MenuBloc.dart';

class ListViewCell extends StatefulWidget{

  Menu menu;
  int count;
  final MenuBloc menuBloc;
  ListViewCell(this.menu, this.count, this.menuBloc);

  @override
  State<StatefulWidget> createState() => _ListViewCellState(menu, count, menuBloc);

}

class _ListViewCellState extends State<ListViewCell>{

  Menu menu;
  int count;
  final MenuBloc menuBloc;
  _ListViewCellState(this.menu, this.count, this.menuBloc);

  @override
  Widget build(BuildContext context) {

    _addCart(){
      menuBloc.cartAdd.add(menu);
      setState(() => count = count + 1);
    }

    _removeCart(){
      menuBloc.cartRemove.add(menu.ID);
      setState(() => count = count - 1);
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
<<<<<<< HEAD
          IconButton(icon: Icon(Icons.remove), onPressed: () => _removeCart()), 
=======
          //IconButton(icon: Icon(Icons.exposure_minus_1), onPressed: () => _removeCart()), // Orignial
          //IconButton(icon: Icon(Icons.exposure_neg_1), onPressed: () => _removeCart()), // Just Changed Icon name
>>>>>>> 547c86c8e94d8fb12add673c1cf95ab5dc0e856b
        ],
      ),
    ));
  }

}

