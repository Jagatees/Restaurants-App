import 'dart:async';
import '../../class/Drink.dart';
import '../../class/Menu.dart';

class MenuBloc{
 List<Drink> _drinks = new List<Drink>();
 List<Menu> _cart = new List<Menu>();

  final _drinkListSteamController = StreamController<List<Drink>>();
  final _drinkListAddController = StreamController<Drink>();

  final _cartListSteamController = StreamController<List<Menu>>();
  final _cartAddSteamController = StreamController<Menu>();


  //getters
  Stream<List<Drink>> get drinkListStream => _drinkListSteamController.stream;
  StreamSink<List<Drink>> get drinkListSink => _drinkListSteamController.sink;

  Stream<List<Menu>> get cartListStream => _cartListSteamController.stream;
  StreamSink<List<Menu>> get cartListSink => _cartListSteamController.sink;


  StreamSink<Drink> get drinkAdd => _drinkListAddController.sink;
  StreamSink<Menu> get cartAdd => _cartAddSteamController.sink;

  MenuBloc() {
    _drinkListSteamController.add([]);
    

    _drinkListAddController.stream.listen((drink) {
      _drinks.add(drink);
      drinkListSink.add(_drinks);
    });


    _cartAddSteamController.stream.listen((menu) {
      _cart.add(menu);
      cartListSink.add(_drinks);
      print("Menu Added: "+menu.toString());
    });

  }

  void dispose() {
    _drinkListAddController.close();
    _drinkListSteamController.close();
    _cartListSteamController.close();
    _cartAddSteamController.close();
  }
}

