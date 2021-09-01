import 'package:ecatalog/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthPage extends StatelessWidget {
  final TextEditingController passwordController = TextEditingController();
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
                              "info@mtenterprises@gmail.com",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
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
        body: Center(
          child: Card(
            child: Container(
              color: Colors.white38,
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.6,
              child: Center(
                child: Column(
                  children: [
                    Text("Admin Login", style: GoogleFonts.abel()),
                    _password(),
                    _loginButton(context)
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  // Widget _buildLogo() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Padding(
  //         padding: const EdgeInsets.symmetric(vertical: 70),
  //         child: Image(
  //           image: AssetImage('mt.png'),
  //           height: 40.0,
  //           width: 40.0,
  //         ),
  //       )
  //     ],
  //   );
  // }

  Widget _password() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        controller: passwordController,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: Color(0xff2470c7),
            ),
            labelText: "Password"),
      ),
    );
  }

  Widget _loginButton(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 1.4 * ((MediaQuery.of(context).size.height) / 25),
          width: 5 * ((MediaQuery.of(context).size.width) / 15),
          margin: EdgeInsets.only(top: 10, bottom: 20),
          child: ElevatedButton(
            child: Text(
              "LOGIN",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
                fontSize: MediaQuery.of(context).size.height / 50,
              ),
            ),
            onPressed: () {
              if (passwordController.text == "anas") {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Dashboard()));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (BuildContext context) => Dashboard()));
            },
          ),
        )
      ],
    );
  }

  final snackBar =
      SnackBar(content: Text("Invalid !", style: TextStyle(color: Colors.red)));
}
