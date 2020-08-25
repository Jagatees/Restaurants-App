import 'package:flutter/material.dart';
import 'package:restaurantsapp/screens/bloc/MenuBloc.dart';
import '../bloc/MenuBloc.dart';
import '../../class/Menu.dart';

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
      body: StreamBuilder<List<Menu>>(
        stream: _menuBloc.cartListStream,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return ListView.separated(
              itemCount: snapshot.data.length ,
              itemBuilder: (BuildContext context, int index){
               return Card(child: Text(snapshot.data[index].toString()),);
                
            } ,
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