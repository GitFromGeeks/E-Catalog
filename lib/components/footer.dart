import 'package:ecatalog/screens/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';

Widget appfooter(context) {
  return (BottomAppBar(
    color: Colors.blueAccent,
    child: Container(
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        height: 45.0,
                        width: 45.0,
                        child: Center(
                          child: Card(
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  25.0), // half of height and width of Image
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.facebook,
                                size: 20.0,
                              ),
                              color: Colors.black,
                              onPressed: () {},
                            ),
                          ),
                        )),
                    Container(
                        height: 45.0,
                        width: 45.0,
                        child: Center(
                          child: Card(
                              elevation: 5.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    25.0), // half of height and width of Image
                              ),
                              child: IconButton(
                                  onPressed: () {
                                    MapsLauncher.launchCoordinates(28.7820617,
                                        78.7644163, 'MT Enterprises');
                                  },
                                  icon: Icon(Icons.location_city))),
                        )),
                    Container(
                        height: 45.0,
                        width: 45.0,
                        child: Center(
                          child: Card(
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  25.0), // half of height and width of Image
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.admin_panel_settings,
                                size: 20.0,
                              ),
                              color: Colors.black,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AuthPage()));
                              },
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.phone,
                    color: Colors.black,
                  ),
                  Text(
                    '+91 9897704730, 9897704730',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                        color: Colors.black),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.mail,
                    color: Colors.black,
                    size: 15.0,
                  ),
                  Padding(padding: EdgeInsets.only(left: 1.0)),
                  Text("anas@mtenterprises.in, farhan@mtenterprises.in",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Text(
                "info@mtenterprises.in",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Text(
                '           285,352 Dhoom Gher Village, Chandusi Road',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                    color: Colors.black),
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Text(
                '           Moradabad 244001',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                    color: Colors.black),
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Text(
                'Copyright ©2021, All Rights Reserved.',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                    color: Colors.black),
              ),
            ]),
      ),
    ),
  ));
}
