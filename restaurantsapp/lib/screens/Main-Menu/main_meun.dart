import 'package:flutter/material.dart';
import 'package:restaurantsapp/screens/home/settings_form.dart';
import 'package:restaurantsapp/services/auth.dart';
import '../../widgets/drawer.dart';
import '../../services/Menu-DLI.dart';
import '../bloc/MenuBloc.dart';
import '../../class/Drink.dart';
import 'local-widgets/StructuredGridCell.dart';
import 'local-widgets/PromotionDialog.dart';
import 'package:restaurantsapp/widgets/drawer.dart';




class MainMenu extends StatefulWidget {

  static bool firstTime = false;

  @override
  _MainMeunState createState() => _MainMeunState();
}

class _MainMeunState extends State<MainMenu> with WidgetsBindingObserver{
  MenuBloc _menuBloc;
  final AuthService _auth = AuthService();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    MenuDLI menuDli = MenuDLI();
    _menuBloc = MenuBloc();

    menuDli.getDrinks(menuBloc: _menuBloc);


    
  }

  @override
  Widget build(BuildContext context) {


    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }


    final double itemHeight = 290.8;
    final double itemWidth = 187.5;


    if(!MainMenu.firstTime){
      WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(context: context,builder: (BuildContext context) => CustomDialog()));
      MainMenu.firstTime = true;
    }




    return Scaffold(
      appBar: AppBar(
        title: Text('Main Menu'),
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add_shopping_cart), onPressed: () => Navigator.pushNamed(context, "/Cart")),
        ],
      ),
      drawer: CustomDrawer(),
      body: Container(
          child: Center(
            child: StreamBuilder<List<Drink>>(
              stream: _menuBloc.drinkListStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      childAspectRatio: (itemWidth / itemHeight),
                      children: List.generate(
                          snapshot.data.length,
                          (index) => GestureDetector(
                              onTap: () => _menuBloc.cartAdd.add(snapshot.data[index]),
                              child: StructuredGridCell(snapshot.data[index]))));
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
      )),
    );

    
  }
}
