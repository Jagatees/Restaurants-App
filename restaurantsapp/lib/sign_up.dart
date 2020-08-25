import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:restaurantsapp/sign_in.dart';
import 'screens/Main-Menu/main_meun.dart';

Database database = new Database();

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;
  final UserNameController = TextEditingController();
  final RoleController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(),
      body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                // ignore: missing_return
                validator: (input) {
                  if(input.isEmpty){
                    return 'Provide an email';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Email'
                ),
                onSaved: (input) => _email = input,
              ),
              TextFormField(
                // ignore: missing_return
                validator: (input) {
                  if(input.length < 6){
                    return 'Longer password please';
                  }
                },
                decoration: InputDecoration(
                    labelText: 'Password'
                ),
                onSaved: (input) => _password = input,
                obscureText: true,
              ),

              TextField(
                decoration: InputDecoration(
                    labelText: 'Enter your username'
                ),
                controller: UserNameController ,
              ),

              TextField(
                decoration: InputDecoration(
                    labelText: 'Enter your Role'
                ),
                controller: RoleController ,
              ),

              RaisedButton(
                onPressed: signUp,
                child: Text('Sign up'),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(120.0, 0 ,0 , 0),
                child: ListTile(
                  title: new Text('Already Have a Account?'),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignIn()),
                    );
                  } ,
                ),
              ),
            ],
          )
      ),
    );
  }

  void signUp() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        final FirebaseUser user = await FirebaseAuth.instance.currentUser();
        final String uid = user.uid.toString();
        database.sendUserInfo_withUID(uid, UserNameController.text.toString(), RoleController.text.toString());
        database.sendUserInfo_withUID(uid, 'jagatees', 'customer');
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainMenu()));
      }catch(e){
        print(e.message);
      }
    }
  }




}
