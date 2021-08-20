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
  String? FltCategory;
  @override
  void initState() {
    super.initState();
    FltCategory = "Stools";
  }

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
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("/home");
                      },
                      icon: Icon(Icons.logout_rounded))
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
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 8.0),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        String docID = snapshot.data!.docs[index].id.toString();
                        String name = snapshot.data!.docs[index]['name'];
                        String category =
                            snapshot.data!.docs[index]['category'];
                        String dbimage = snapshot.data!.docs[index]['image'];
                        return Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Database.deleteItem(docId: docID);
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ))
                                ],
                              ),
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
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.of(context).pushNamed("/add_product");
            },
            label: Row(
              children: [
                Text("Add"),
                Icon(Icons.add),
              ],
            )),
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