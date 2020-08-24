import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';
import '../../services/Menu-DLI.dart';
import 'bloc/MenuBloc.dart';
import '../../class/Drink.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMeunState createState() => _MainMeunState();
}

class _MainMeunState extends State<MainMenu> {
  MenuBloc _menuBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    MenuDLI menuDli = MenuDLI();
    _menuBloc = MenuBloc();

    menuDli.GetDrinks(menuBloc: _menuBloc);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Menu'),
      ),
      drawer: CustomDrawer(),
      body: Container(
          child: Center(
        child: StreamBuilder<List<Drink>>(
          stream: _menuBloc.postListStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(snapshot.data.length,
                      (index) => Text(snapshot.data[index].toString())));
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      )),
    );
  }
}
