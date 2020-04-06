import 'package:flutter/material.dart';
import 'package:flutter_apartments/api/mock_apartments.dart';
import 'package:flutter_apartments/screens/search_screen.dart';
import 'package:provider/provider.dart';

import 'common/theme.dart';
import 'screens/login.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Using MultiProvider is convenient when providing multiple objects.
    return MultiProvider(
      providers: [        
        // In this sample app, CatalogModel never changes, so a simple Provider
        // is sufficient.
        // in multieprovider the providers cannot be null
        Provider(create: (context) => CatalogModel()),
        Provider(create: (context) => MockApartmentsModel())
        ], 
              child: MaterialApp(
                title: 'Provider Demo',
                theme: appTheme,
                initialRoute: '/search',
                routes: {
                  '/': (context) => MyLogin(),
                  '/search': (context) => SearchScreen(),
                },
              ),
            );
          }
        }
        
        class CatalogModel {
}