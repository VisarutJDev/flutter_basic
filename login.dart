import 'package:flutter/material.dart';

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

  void validateAndSubmit() {
    if(validateAndSave()) {

    }
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
                      minWidth: 140.0,
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
                  ],
                )))));
  }
}
