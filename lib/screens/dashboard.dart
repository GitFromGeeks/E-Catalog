import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecatalog/utils/database.dart';
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
            child: Row(
              children: [
                Image(
                  image: AssetImage('mt.png'),
                  height: 80.0,
                  width: 80.0,
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
                            Icon(Icons.mail, size: 15.0, color: Colors.white70),
                            Padding(padding: EdgeInsets.only(left: 5.0)),
                            Text(
                              "info@mtenterprises@gmail.com",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white70,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(left: 5.0)),
                          ],
                        )
                      : Text(" "),
                  Icon(Icons.phone, size: 15.0, color: Colors.white54),
                  Padding(padding: EdgeInsets.only(left: 5.0)),
                  Text(
                    "+91 9897704730",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5.0)),
                  IconButton(
                    icon: Icon(Icons.logout, size: 15.0, color: Colors.white54),
                    onPressed: () {
                      Navigator.of(context).pop("/auth");
                    },
                  ),
                ],
              ),
            )
          ],
        ),
        body: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15.0),
                hintText: 'Search here...',
                icon: Icon(Icons.search),
              ),
              onChanged: (string) {},
            ),
            StreamBuilder<QuerySnapshot>(
              stream: Database.readItem(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                } else if (snapshot.hasData || snapshot.data != null) {
                  return ListView.separated(
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 16.0),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      // var noteInfo = snapshot.data!.docs[index].data()!;
                      String name =
                          snapshot.data!.docs[index]['name'].toString();
                      String category =
                          snapshot.data!.docs[index]['category'].toString();

                      return Ink(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          title: Text(
                            name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
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
                return Center(
                  child: Text("Empty"),
                );
              },
            )
          ],
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
