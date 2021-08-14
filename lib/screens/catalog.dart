import 'package:flutter/cupertino.dart';
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
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Image(
                image: AssetImage('mt.png'),
                height: 60.0,
                width: 60.0,
              ),
              // Padding(padding: EdgeInsets.only(right: 5.0)),
              // Text(
              //   "MT Enterprises",
              //   style: TextStyle(fontSize: 15.0),
              // )
            ],
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                MediaQuery.of(context).size.width >= 500.0
                    ? Row(
                        children: [
                          Icon(Icons.mail, size: 15.0, color: Colors.black),
                          Padding(padding: EdgeInsets.only(left: 5.0)),
                          Text(
                            "info@mtenterprises@gmail.com",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(left: 5.0)),
                        ],
                      )
                    : Text(" "),
                Icon(Icons.phone, size: 15.0, color: Colors.black),
                Padding(padding: EdgeInsets.only(left: 5.0)),
                Text(
                  "+91 9897704730",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              TextButton(onPressed: () {}, child: Text("Stools")),
              TextButton(onPressed: () {}, child: Text("Lamps")),
              TextButton(onPressed: () {}, child: Text("Candle")),
              TextButton(onPressed: () {}, child: Text("Frames")),
              TextButton(onPressed: () {}, child: Text("Table")),
            ],
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image(
                            // fit: BoxFit.fill,
                            height: MediaQuery.of(context).size.height * 0.3,
                            width: MediaQuery.of(context).size.width,
                            image: AssetImage("h${index + 1}.jpg")),
                        ListTile(
                          tileColor: Colors.blueGrey,
                          title: Text(
                            "    Product Name",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          ),
                          // trailing: ,
                        ),

                        // Image(image: AssetImage("h${index + 1}.jpg")),
                        // Text(
                        //   "Product Name",
                        //   style: TextStyle(
                        //     fontSize: 35.0,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
