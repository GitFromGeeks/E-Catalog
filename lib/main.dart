import 'package:ecatalog/screens/add_product.dart';
import 'package:ecatalog/screens/auth.dart';
import 'package:ecatalog/screens/dashboard.dart';
import 'package:ecatalog/screens/home.dart';
import 'package:flutter/material.dart';
import './screens/catalog.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MT Enterprises',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/catalog': (context) => Catalog(),
        '/auth': (context) => AuthPage(),
        '/dashboard': (context) => Dashboard(),
        '/home': (context) => HomePage(),
        '/add_product': (context) => Addproduct(),
      },
    );
  }
}
