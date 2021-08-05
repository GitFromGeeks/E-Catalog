import 'package:flutter/material.dart';

Widget appfooter() {
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
                              color: Color(0xFF162A49),
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
                                Icons.dashboard,
                                size: 20.0,
                              ),
                              color: Color(0xFF162A49),
                              onPressed: () {},
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
                        color: Color(0xFF162A49)),
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
                  ),
                  Padding(padding: EdgeInsets.only(left: 5.0)),
                  Text(
                    "anasmtenterprises@gmail.com",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Text(
                'Ad. Jabbar Colony near xyz place sambhal road moradabad pin 244001',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                    color: Color(0xFF162A49)),
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Text(
                'Copyright ©2021, All Rights Reserved.',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                    color: Color(0xFF162A49)),
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Text(
                'Powered by MT Enterprises',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12.0,
                    color: Color(0xFF162A49)),
              ),
            ]),
      ),
    ),
  ));
}
