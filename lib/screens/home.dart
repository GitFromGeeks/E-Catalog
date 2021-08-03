import 'dart:ui';

import 'package:flutter/material.dart';
import '../components/footer.dart';

class HomePage extends StatelessWidget {
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
      body: Center(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: Image(
                      fit: BoxFit.fill,
                      image: AssetImage("handicraft.jpg"),
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/catalog');
                },
                child: Text("Catalog")),
            Text("About"),
            Text("Text area"),
            appfooter()
          ],
        ),
      ),
    );
  }
}
