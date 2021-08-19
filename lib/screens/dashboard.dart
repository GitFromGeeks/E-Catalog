import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecatalog/utils/database.dart';
import 'package:firebase/firestore.dart' as prefix;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
        body: StreamBuilder<QuerySnapshot>(
          stream: Database.readItem(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong");
            } else if (snapshot.hasData || snapshot.data != null) {
              return ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 8.0),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  String docID = snapshot.data!.docs[index].id.toString();
                  String name = snapshot.data!.docs[index]['name'];
                  String category = snapshot.data!.docs[index]['category'];
                  String dbimage = snapshot.data!.docs[index]['image'];
                  return Ink(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      title: Column(
                        children: [
                          Text(
                            name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Container(
                            margin: EdgeInsets.all(20.0),
                            child: Image(
                              width: 70.0,
                              height: 70.0,
                              fit: BoxFit.contain,
                              image: NetworkImage(
                                dbimage,
                              ),
                            ),
                          )
                        ],
                      ),
                      subtitle: Text(
                        category,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  );
                },
              );
            }
            return Text("Loading");
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed("/add_product");
          },
          backgroundColor: Colors.black,
          hoverColor: Colors.amber,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}


            // StreamBuilder(
            //   stream: Database.readItem(),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasError) {
            //       return Text("Something went wrong");
            //     } else if (snapshot.hasData || snapshot.data != null) {
            //       return ListView.separated(
            //         separatorBuilder: (context, index) => SizedBox(height: 8.0),
            //         itemCount: snapshot.data!.docs.length,
            //         itemBuilder: (context, index) {
            //           String name =
            //               snapshot.data!.docs[index]['name'].toString();
            //           String category =
            //               snapshot.data!.docs[index]['catelog'].toString();
            //           return Ink(
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(8.0),
            //             ),
            //             child: ListTile(
            //                 shape: RoundedRectangleBorder(
            //                   borderRadius: BorderRadius.circular(8.0),
            //                 ),
            //                 title: Text(
            //                   name,
            //                   maxLines: 1,
            //                   overflow: TextOverflow.ellipsis,
            //                 ),
            //                 subtitle: Text(
            //                   category,
            //                   maxLines: 1,
            //                   overflow: TextOverflow.ellipsis,
            //                 )),
            //           );
            //         },
            //       );
            //     }
            //   },
            // )


            // FutureBuilder<QuerySnapshot>(
            //   future: FirebaseFirestore.instance.collection("catalog").get(),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       final List documents = snapshot.data!.docs;
            //       return ListView(
            //           children: documents
            //               .map((doc) => Card(
            //                     child: ListTile(
            //                       title: Text(doc['name']),
            //                       subtitle: Text(doc['category']),
            //                     ),
            //                   ))
            //               .toList());
            //     } else if (snapshot.hasError) {
            //       return Text(" Something went wrong");
            //     }
            //     return Text("Null return");
            //   },
            // )