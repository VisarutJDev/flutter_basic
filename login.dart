import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  String _user;
  String _password;

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void validateAndSubmit() async {
    if(validateAndSave()) {
        try {
          FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _user, password: _password);
          _showAlert('Signed in: ${user.uid}');
        }catch (e) {
          _showAlert(e.toString());
        }
    }
  }

  void emailRegister() async {
    if(validateAndSave()){
      try {
        FirebaseUser user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _user, password: _password);
        _showAlert('Registered user: ${user.uid}');
      }catch (e) {
        _showAlert(e.toString());
      }
    }
  }

  void _showAlert(String value) {
    if (value.isEmpty) return;
    showDialog(
        context: context,
      builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Alert'),
            content: Text(value),
            actions: <Widget>[
              FlatButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Center(
            child: Container(
                padding: EdgeInsets.all(10.0),
                child: Form(
                  key: formKey,
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'LAZYDEV',
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 50.0),
                    ),
                    Text(
                      'LAZY IS GOOD',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 33.0),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30.0),
                    ),
                    TextFormField(
                      validator: (value) =>
                          value.isEmpty ? 'Email can\'t be empty' : null,
                      onSaved: (value) => _user = value,
                      decoration: InputDecoration(
                        labelText: 'User',
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(50.0),
                          ),
                        ),
                        hintStyle: new TextStyle(color: Colors.grey[800]),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                    ),
                    TextFormField(
                      onSaved: (value) => _password = value,
                      validator: (value) =>
                          value.isEmpty ? 'Password can\'t be empty' : null,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(50.0),
                          ),
                        ),
                        hintStyle: new TextStyle(color: Colors.grey[800]),
                      ),
                      obscureText: true,
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                    ),
                    ButtonTheme(
                      minWidth: 185.0,
                      height: 50.0,
                      child: RaisedButton(
                        color: Colors.grey,
                        onPressed: validateAndSubmit,
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(50.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                    ),
                    ButtonTheme(
                      minWidth: 140.0,
                      height: 50.0,
                      child: RaisedButton(
                        color: Colors.grey,
                        onPressed: emailRegister,
                        child: Text(
                          'Create Account',
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(50.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                )))));
  }
}
