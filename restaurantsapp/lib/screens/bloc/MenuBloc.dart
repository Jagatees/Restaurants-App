import 'dart:async';
import '../../class/Drink.dart';
import '../../class/Menu.dart';

class MenuBloc{
 List<Drink> _drinks = new List<Drink>();
 static Map<String, List<Menu>> _cart = {};
 int cartCount = 0;

  final _drinkListSteamController = StreamController<List<Drink>>();
  final _drinkListAddController = StreamController<Drink>();

  final _cartListSteamController = StreamController<Map<String, List<Menu>>>();
  final _cartAddSteamController = StreamController<Menu>();
  final _cartRemoveSteamController = StreamController<String>();


  //getters
  Stream<List<Drink>> get drinkListStream => _drinkListSteamController.stream;
  StreamSink<List<Drink>> get drinkListSink => _drinkListSteamController.sink;

  Stream<Map<String, List<Menu>>> get cartListStream => _cartListSteamController.stream;
  StreamSink<Map<String, List<Menu>>> get cartListSink => _cartListSteamController.sink;
  

  StreamSink<Drink> get drinkAdd => _drinkListAddController.sink;

  StreamSink<Menu> get cartAdd => _cartAddSteamController.sink;
  StreamSink<String> get cartRemove => _cartRemoveSteamController.sink;

  double getCartAmount() {
    List<String> keys = _cart.keys.toList();
    
    double amount = 0;

    for (int i = 0; i < keys.length; i++){
      
      amount += _cart[keys[i]][1].Price * _cart[keys[i]].length;
    }
    return amount;
  }

  MenuBloc() {

    cartCount = _cart.length;

    _drinkListSteamController.add([]);
    _cartListSteamController.add(_cart);
    

    _drinkListAddController.stream.listen((drink) {
      _drinks.add(drink);
      drinkListSink.add(_drinks);
    });


    _cartAddSteamController.stream.listen((menu) {

      if(_cart[menu.ID] == null){
        _cart[menu.ID] = List<Menu>();
        _cart[menu.ID].add(menu);
      }else{
        _cart[menu.ID].add(menu);
      }

      cartListSink.add(_cart);
      print("Menu Added: "+menu.toString());
    });

    _cartRemoveSteamController.stream.listen((value) {
      Menu menu = null;
      if(_cart[value].length == 1){
        menu = _cart[value].last;
        _cart.remove(value);
      }
      else
        menu = _cart[value].removeLast();


      cartListSink.add(_cart);


      print("Cart removed: " + menu.toString());

    });

  }

  void dispose() {
    _drinkListAddController.close();
    _drinkListSteamController.close();
    _cartListSteamController.close();
    _cartAddSteamController.close();
    _cartRemoveSteamController.close();
  }
}

