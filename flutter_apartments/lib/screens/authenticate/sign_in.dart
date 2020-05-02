import 'package:flutter/material.dart';
import 'package:flutter_apartments/services/auth.dart';
import 'package:email_validator/email_validator.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  // text field state
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in to Mil To Mil'),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text('Register'))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(hintText: 'email'),
                    validator: (val) => EmailValidator.validate(val)
                        ? null
                        : 'Enter a valid email',
                    onChanged: (val) {
                      setState(() => email = val);
                    }),
                SizedBox(height: 20.0),
                TextFormField(
                    decoration: const InputDecoration(hintText: 'password'),
                    validator: (val) => val.length < 6
                        ? 'Enter a password 6+ chars long'
                        : null,
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => password = val);
                    }),
                SizedBox(height: 20.0),
                RaisedButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        dynamic result = await _auth.signInWithEmailAndPassword(
                            email, password);
                        if (result == null) {
                          setState(() => error = 'please supply a valid email');
                        }
                        print(email);
                        print(password);
                      }
                    },
                    color: Colors.pink[400],
                    child:
                        Text('Register', style: TextStyle(color: Colors.white)))
              ],
            )),
      ),
    );
  }
}
