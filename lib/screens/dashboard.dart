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
                        children: [
                          Image(
                              height: MediaQuery.of(context).size.height * 0.3,
                              width: MediaQuery.of(context).size.width,
                              image: AssetImage("h${index + 1}.jpg")),
                          ListTile(
                            title: Text(
                              "Product Name",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            trailing: FittedBox(
                              fit: BoxFit.fill,
                              child: Row(
                                children: [
                                  IconButton(
                                      color: Colors.black,
                                      icon: Icon(Icons.edit),
                                      onPressed: () {}),
                                  IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.redAccent,
                                      ),
                                      onPressed: () {}),
                                ],
                              ),
                            ),
                          )
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
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
