import 'package:flutter/material.dart';

import 'common/theme.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MilToMil',
      theme: appTheme,
      initialRoute: '/welcome',
      routes: {
        '/': (context) => WeclomeScreen(),
        '/welcome': (context) => WeclomeScreen()
      },
    );
  }
}
