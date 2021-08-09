import 'package:ecatalog/components/footer.dart';
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
                            "anas@mtenterprises@gmail.com",
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
                  "+91 xxxxxxxxxx",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                  ),
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
                          tileColor: Colors.white10,
                          title: Text(
                            "Product Name",
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.bold),
                          ),
                          // trailing: ,
                          subtitle: Text("Rate Rs.xxxxx"),
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
    );
  }
}
