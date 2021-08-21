import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecatalog/utils/database.dart';
import 'package:firebase/firestore.dart' as prefix;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Catalog extends StatefulWidget {
  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  String? FltCategory;
  @override
  void initState() {
    super.initState();
    FltCategory = "Stools";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Image(
            image: AssetImage('mt.png'),
            height: 60.0,
            width: 60.0,
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
                        primary: FltCategory == "Tables"
                            ? Colors.grey
                            : Colors.white,
                        padding: EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 20.0)),
                    onPressed: () {
                      setState(() {
                        FltCategory = "Tables";
                      });
                    },
                    child: Text(
                      "Tables",
                      style: TextStyle(
                          color: Colors.orangeAccent,
                          fontWeight: FontWeight.bold),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        // fixedSize: Size(35, 20),
                        primary: FltCategory == "Stools"
                            ? Colors.grey
                            : Colors.white,
                        padding: EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 20.0)),
                    onPressed: () {
                      setState(() {
                        FltCategory = "Stools";
                      });
                    },
                    child: Text(
                      "Stools",
                      style: TextStyle(
                          color: Colors.orangeAccent,
                          fontWeight: FontWeight.bold),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        // fixedSize: Size(35, 20),
                        primary:
                            FltCategory == "Pots" ? Colors.grey : Colors.white,
                        padding: EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 20.0)),
                    onPressed: () {
                      setState(() {
                        FltCategory = "Pots";
                      });
                    },
                    child: Text(
                      "Pots",
                      style: TextStyle(
                          color: Colors.orangeAccent,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
          Flexible(
            child: StreamBuilder<QuerySnapshot>(
              stream: Database.readItem(FltCategory ?? "Stools"),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("Something went wrong");
                } else if (snapshot.hasData || snapshot.data != null) {
                  return ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 8.0),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      // String docID = snapshot.data!.docs[index].id.toString();
                      String name = snapshot.data!.docs[index]['name'];
                      String category = snapshot.data!.docs[index]['category'];
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






          // Expanded(
          //   child: Container(
          //     child: ListView.builder(
          //       itemCount: 6,
          //       itemBuilder: (BuildContext context, int index) {
          //         return Card(
          //           color: Colors.white,
          //           shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(10.0)),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.stretch,
          //             children: [
          //               Image(
          //                   // fit: BoxFit.fill,
          //                   height: MediaQuery.of(context).size.height * 0.3,
          //                   width: MediaQuery.of(context).size.width,
          //                   image: AssetImage("h${index + 1}.jpg")),
          //               ListTile(
          //                 tileColor: Colors.blueGrey,
          //                 title: Text(
          //                   "    Product Name",
          //                   style: TextStyle(
          //                       color: Colors.white,
          //                       fontSize: 25.0,
          //                       fontWeight: FontWeight.bold),
          //                 ),
          //                 // trailing: ,
          //               ),

          //               // Image(image: AssetImage("h${index + 1}.jpg")),
          //               // Text(
          //               //   "Product Name",
          //               //   style: TextStyle(
          //               //     fontSize: 35.0,
          //               //     fontWeight: FontWeight.bold,
          //               //   ),
          //               // ),
          //             ],
          //           ),
          //         );
          //       },
          //     ),
          //   ),
          // ),