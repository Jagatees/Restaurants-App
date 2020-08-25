import 'package:flutter/material.dart';
import 'package:restaurantsapp/screens/bloc/MenuBloc.dart';
import '../bloc/MenuBloc.dart';
import '../../class/Menu.dart';
import 'local-widgets/ListViewCell.dart';

class Cart extends StatefulWidget{

  //Defualt construtor
  Cart();

  @override
  State<StatefulWidget> createState() => _CartState();

}

class _CartState extends State<Cart>{

  MenuBloc _menuBloc = MenuBloc();
  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Cart View"),),
      body: StreamBuilder<Map<String, List<Menu>>>(
        stream: _menuBloc.cartListStream,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            List<String> keys = snapshot.data.keys.toList();

            return ListView.separated(
              itemCount: snapshot.data.keys.toList().length,
              itemBuilder: (BuildContext context, int index) => ListViewCell(snapshot.data[keys[index]][0], snapshot.data[keys[index]].length, _menuBloc),
            separatorBuilder: (BuildContext context, int index) {
              return Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 5),);
            }
            );
          }else{
            return CircularProgressIndicator();
          }
      },),
    );

  }
}