import 'package:flutter/material.dart';

import 'common/theme.dart';
import 'screens/welcome_screen.dart';
import 'screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:flutter_apartments/services/auth.dart';
import 'models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(
          title: 'MilToMil',
          theme: appTheme,
          initialRoute: '/',
          routes: {
            '/': (context) => Wrapper(),
            '/welcome': (context) => WeclomeScreen(),
            '/aboutyou': (context) => WeclomeScreen(),
            '/search': (context) => WeclomeScreen(),
            '/home': (context) => WeclomeScreen()
          },
        ));
  }
}
