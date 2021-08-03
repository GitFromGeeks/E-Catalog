import 'package:flutter/material.dart';

class Catalog extends StatefulWidget {
  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MT Enterprises"),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("+91 8586874112"),
          )
        ],
      ),
    );
  }
}
