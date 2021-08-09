import 'package:ecatalog/screens/auth.dart';
import 'package:flutter/material.dart';

Widget appfooter(context) {
  return (BottomAppBar(
    color: Colors.black87,
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
                              color: Colors.white,
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
                                  onPressed: () {},
                                  icon: Icon(Icons.camera_alt_rounded))),
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
                              color: Colors.white,
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
                  Icon(Icons.phone),
                  Text(
                    '+91 989xxxxxxx, 989xxxxxxx , 0591,458732',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                        color: Colors.white60),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.mail,
                    color: Colors.white,
                  ),
                  Padding(padding: EdgeInsets.only(left: 5.0)),
                  Text(
                    "anasmtenterprises@gmail.com",
                    style: TextStyle(color: Colors.white60),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Text(
                '           Add. Jabbar Colony near xyz place sambhal',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                    color: Colors.white60),
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Text(
                '           road karula Moradabad 244001',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                    color: Colors.white60),
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Text(
                'Copyright ©2021, All Rights Reserved.',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                    color: Colors.white60),
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Text(
                'Powered by MT Enterprises',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                    color: Colors.white60),
              ),
            ]),
      ),
    ),
  ));
}
