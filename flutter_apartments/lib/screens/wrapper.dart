import 'package:flutter_apartments/screens/authenticate/authenticate.dart';
import 'package:flutter_apartments/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apartments/models/user.dart';
import 'package:provider/provider.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<User>(context);
    if(user == null){
      return Authenticate();
    }else{
      return Home();
    }
  }
}
