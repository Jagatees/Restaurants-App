import 'package:http/http.dart' as http;
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import '../../../class/Drink.dart';

class MenuBloc{
 List<Drink> _drinks = new List<Drink>();

  final _drinkListSteamController = StreamController<List<Drink>>();
  final _drinkListAddController = StreamController<Drink>();

  //getters
  Stream<List<Drink>> get postListStream => _drinkListSteamController.stream;
  StreamSink<List<Drink>> get postListSink => _drinkListSteamController.sink;

  StreamSink<Drink> get postAdd => _drinkListAddController.sink;

  MenuBloc() {
    _drinkListSteamController.add([]);
    

    _drinkListAddController.stream.listen((post) {
      _drinks.add(post);
      postListSink.add(_drinks);
      print(_drinks);
    });
  }

  void dispose() {
    _drinkListAddController.close();
    _drinkListSteamController.close();
  }
}

