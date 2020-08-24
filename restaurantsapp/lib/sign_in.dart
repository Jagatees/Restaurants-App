import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restaurantsapp/sign_up.dart';

import 'main_meun.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInPageState createState() => new _SignInPageState();
}

class _SignInPageState extends State<SignIn> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;

  //Controller for the email and password
  TextEditingController _emailContoller = new TextEditingController();
  TextEditingController _passwordContoller = new TextEditingController();

  @override
  void initState() {
    // implement initState
    super.initState();
    _emailContoller.text = "user@gmail.com";
    _passwordContoller.text = "1234567890";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(),
      body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _emailContoller,
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
                controller: _passwordContoller,
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
              RaisedButton(
                onPressed: signIn,
                child: Text('Sign in'),
              ),


               Padding(
                 padding: const EdgeInsets.fromLTRB(120.0, 0 ,0 , 0),
                 child: ListTile(
                  title: new Text('Make a Account?'),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  } ,
              ),
               ),

            ],
          )
      ),
    );
  }

  void signIn() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        AuthResult user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context) => MainMeun()));
      }catch(e){
        print(e.message);
      }
    }
  }
}