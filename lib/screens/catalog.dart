import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecatalog/utils/database.dart';
// import 'package:firebase/firestore.dart' as prefix;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Catalog extends StatefulWidget {
  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  // ignore: non_constant_identifier_names
  String? FltCategory;
  @override
  void initState() {
    super.initState();
    FltCategory = "Houseware";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Image(
                image: AssetImage('mt.png'),
                height: 60.0,
                width: 60.0,
              ),
              Text("MT Enterprises",
                  style: GoogleFonts.pacifico(
                      color: Colors.black, fontSize: 15.0))
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
                            "info@mtenterprises.in",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: FltCategory == "Houseware"
                            ? Colors.grey
                            : Colors.white,
                        padding: EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 20.0)),
                    onPressed: () {
                      setState(() {
                        FltCategory = "Houseware";
                      });
                    },
                    child: Text(
                      "Houseware",
                      style: TextStyle(
                          color: Colors.orangeAccent,
                          fontWeight: FontWeight.bold),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        // fixedSize: Size(35, 20),
                        primary: FltCategory == "Kitchenware"
                            ? Colors.grey
                            : Colors.white,
                        padding: EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 20.0)),
                    onPressed: () {
                      setState(() {
                        FltCategory = "Kitchenware";
                      });
                    },
                    child: Text(
                      "Kitchenware",
                      style: TextStyle(
                          color: Colors.orangeAccent,
                          fontWeight: FontWeight.bold),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        // fixedSize: Size(35, 20),
                        primary: FltCategory == "Decorative"
                            ? Colors.grey
                            : Colors.white,
                        padding: EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 20.0)),
                    onPressed: () {
                      setState(() {
                        FltCategory = "Decorative";
                      });
                    },
                    child: Text(
                      "Decorative",
                      style: TextStyle(
                          color: Colors.orangeAccent,
                          fontWeight: FontWeight.bold),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        // fixedSize: Size(35, 20),
                        primary: FltCategory == "Seasonal"
                            ? Colors.grey
                            : Colors.white,
                        padding: EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 20.0)),
                    onPressed: () {
                      setState(() {
                        FltCategory = "Seasonal";
                      });
                    },
                    child: Text(
                      "Seasonal",
                      style: TextStyle(
                          color: Colors.orangeAccent,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
          Flexible(
            child: StreamBuilder<QuerySnapshot>(
              stream: Database.readItem(FltCategory ?? "Houseware"),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("Something went wrong");
                } else if (snapshot.hasData || snapshot.data != null) {
                  return ListView.separated(
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 8.0),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      // String docID = snapshot.data!.docs[index].id.toString();
                      String name = snapshot.data!.docs[index]['name'];
                      // String category = snapshot.data!.docs[index]['category'];
                      String dbimage = snapshot.data!.docs[index]['image'];
                      return Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Image(
                                // fit: BoxFit.fill,
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                width: MediaQuery.of(context).size.width,
                                image: NetworkImage("$dbimage")),
                            ListTile(
                              tileColor: Colors.blueGrey,
                              title: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  child: Text(
                                    name,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
                return Text("Loading");
              },
            ),
          ),
        ],
      ),
    );
  }
}
