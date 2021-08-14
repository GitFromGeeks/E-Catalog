import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/footer.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  @override
  bool e = false;
  void initState() {
    super.initState();
    e = false;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CarouselSlider(
                    items: [
                      Container(
                        // margin: EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0.0),
                            image: DecorationImage(
                                image: AssetImage("c1.jpg"), fit: BoxFit.fill)),
                      ),
                      Container(
                        // margin: EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0.0),
                            image: DecorationImage(
                                image: AssetImage("c2.jpg"), fit: BoxFit.fill)),
                      ),
                      Container(
                        // margin: EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0.0),
                            image: DecorationImage(
                                image: AssetImage("c3.jpg"), fit: BoxFit.fill)),
                      ),
                      Container(
                        // margin: EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0.0),
                            image: DecorationImage(
                                image: AssetImage("c4.jpg"), fit: BoxFit.fill)),
                      ),
                    ],
                    options: CarouselOptions(
                      height: (MediaQuery.of(context).size.width >= 500.0)
                          ? MediaQuery.of(context).size.height * 0.9
                          : MediaQuery.of(context).size.height * 0.4,
                      // height: MediaQuery.of(context).size.height * 0.9,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      // aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.easeInOut,
                      enableInfiniteScroll: true,
                      autoPlayInterval: Duration(seconds: 3),
                      viewportFraction: 1.0,
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 30.0)),
              MouseRegion(
                onHover: (event) {
                  setState(() {
                    e = true;
                  });
                },
                onExit: (event) {
                  setState(() {
                    e = false;
                  });
                },
                child: CupertinoButton(
                    borderRadius: BorderRadius.circular(50.0),
                    color: e ? Colors.amberAccent : Colors.blueAccent,
                    child: Text("Catalog",
                        style: GoogleFonts.oswald(
                            textStyle: TextStyle(
                          fontSize: 25.0,
                          letterSpacing: 4.0,
                        ))),
                    onPressed: () {
                      Navigator.of(context).pushNamed("/catalog");
                    }),
              ),
              Padding(padding: EdgeInsets.only(top: 30.0)),
              Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                      text: '  Who we are',
                      style: GoogleFonts.oswald(
                          textStyle: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900],
                              letterSpacing: 2.0,
                              wordSpacing: 4.0)) // style: TextStyle(
                      //     color: Colors.blue,
                      //     fontSize: 40.0,
                      //     fontWeight: FontWeight.bold,
                      //     fontFamily: "arial"),
                      ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(right: 30.0)),
                  Expanded(
                    flex: 4,
                    child: Text(
                        "We, MT Enterprises, are pleased to introduce ourselves as a respectable manufacturer and exporter of attractive products like Table Lamps, Contemporary Table Lamps, Lighting Lamp, Floor Lamps, Modern Lamps, Vintage Lamps, Door Knobs, Drawer Pull, Bathroom Set etc. All the designs of our products are in trend and are praised by our valuable customers. The progressive & creative thinking of our professionals, expertise in their domain and talent helps us in bringing out an innovative range.",
                        style: GoogleFonts.pacifico()),
                  ),
                  Padding(padding: EdgeInsets.only(right: 30.0)),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 30.0)),
              Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                      text: '  Our Aim',
                      style: GoogleFonts.oswald(
                          textStyle: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900],
                              letterSpacing: 2.0,
                              wordSpacing: 4.0))),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(right: 30.0)),
                  Expanded(
                    flex: 4,
                    child: Text(
                        "Our aim is to extend our existing clients base around the globe and acquaint the world with our splendid designs we thereby welcome new business proposals, tie-ups and bulk orders from world over. Competitive prices, On time delivery, exclusive guarantee are the things which makes us different from others. Our mission is to make buying simple for you and extremely hassle free.",
                        style: GoogleFonts.pacifico()),
                  ),
                  Padding(padding: EdgeInsets.only(right: 30.0)),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 30.0)),
              Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                      text: '  Custom Design',
                      style: GoogleFonts.oswald(
                          textStyle: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900],
                              letterSpacing: 2.0,
                              wordSpacing: 4.0))),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(right: 30.0)),
                  Expanded(
                    flex: 4,
                    child: Text(
                        "Our expert craftsmen and designing team helps us in presenting innovative ideas in form of lanterns and home decor products. Products offered by us are manufactured by compiling skills with innovations. We can also custom-design Lamps & Lamp Accessories in accordance with the specifications and configurations of the buyers.",
                        style: GoogleFonts.pacifico()),
                  ),
                  Padding(padding: EdgeInsets.only(right: 30.0)),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 30.0)),
              Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                      text: '  Our Product',
                      style: GoogleFonts.oswald(
                          textStyle: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900],
                              letterSpacing: 2.0,
                              wordSpacing: 4.0))),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(right: 30.0)),
                  Expanded(
                    flex: 4,
                    child: Text(
                        "Our products are manufactured using premium quality raw material like aluminum, copper, iron, silver, glass and other products. Raw materials used in designing our products are procured from trusted vendors across the globe.The quality of our handcrafted products never disappointed any of our clients till date. Domestic as well as international clients have always appreciated our handcrafted products.",
                        style: GoogleFonts.pacifico()),
                  ),
                  Padding(padding: EdgeInsets.only(right: 30.0)),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 30.0)),
              Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                      text: '  Client Satisfaction',
                      style: GoogleFonts.oswald(
                          textStyle: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900],
                              letterSpacing: 2.0,
                              wordSpacing: 4.0))),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(right: 30.0)),
                  Expanded(
                    flex: 4,
                    child: Text(
                        "MT Enterprises believes in long term business. Customer’s satisfaction is our top most priority that’s why quality of our products is confirmed & tested several times at each & every stage of production then products are tested against stringent quality standards.",
                        style: GoogleFonts.pacifico()),
                  ),
                  Padding(padding: EdgeInsets.only(right: 30.0)),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 30.0)),
              Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                      text: '  Our Product',
                      style: GoogleFonts.oswald(
                          textStyle: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900],
                              letterSpacing: 2.0,
                              wordSpacing: 4.0))),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Wrap(
                spacing: 20.0,
                runSpacing: 10.0,
                children: [
                  Column(
                    children: [
                      Image(
                        height: MediaQuery.of(context).size.height * 0.3,
                        image: AssetImage("h1.jpg"),
                      ),
                      Text("Category Name")
                    ],
                  ),
                  Column(
                    children: [
                      Image(
                        height: MediaQuery.of(context).size.height * 0.3,
                        image: AssetImage("h2.jpg"),
                      ),
                      Text("Category Name")
                    ],
                  ),
                  Column(
                    children: [
                      Image(
                        height: MediaQuery.of(context).size.height * 0.3,
                        image: AssetImage("h3.jpg"),
                      ),
                      Text("Category Name")
                    ],
                  ),
                  Column(
                    children: [
                      Image(
                        height: MediaQuery.of(context).size.height * 0.3,
                        image: AssetImage("h4.jpg"),
                      ),
                      Text("Category Name")
                    ],
                  ),
                  Column(
                    children: [
                      Image(
                        height: MediaQuery.of(context).size.height * 0.3,
                        image: AssetImage("h5.jpg"),
                      ),
                      Text("Category Name")
                    ],
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              appfooter(context)
            ],
          ),
        ),
      ),
    );
  }
}



// Card(
//                       child: Column(
//                     children: [
//                       Image(
//                         height: MediaQuery.of(context).size.height * 0.3,
//                         width: MediaQuery.of(context).size.width,
//                         image: AssetImage('h1.jpg'),
//                       ),
//                       Text("product Name")
//                     ],
//                   )),
//                   Card(
//                       child: Column(
//                     children: [
//                       Image(
//                         height: MediaQuery.of(context).size.height * 0.3,
//                         width: MediaQuery.of(context).size.width,
//                         image: AssetImage('h2.jpg'),
//                       ),
//                       Text("product Name")
//                     ],
//                   )),
//                   Card(
//                       child: Column(
//                     children: [
//                       Image(
//                         height: MediaQuery.of(context).size.height * 0.3,
//                         width: MediaQuery.of(context).size.width,
//                         image: AssetImage('h3.jpg'),
//                       ),
//                       Text("product Name")
//                     ],
//                   )),
//                   Card(
//                       child: Column(
//                     children: [
//                       Image(
//                         height: MediaQuery.of(context).size.height * 0.3,
//                         width: MediaQuery.of(context).size.width,
//                         image: AssetImage('h4.jpg'),
//                       ),
//                       Text("product Name")
//                     ],
//                   )),

// "MT Enterprises is a widely known and reliable representative and distributor of various products in the Sensory Analysis Field such as Sensory Instruments (electronic nose, electronic tongue and electronic eye FIZZ Software for conducting automated Sensory and Consumer Tests, ARCS Software which provides complete Panel Managment Solutions and Olfactory Port for GC.We also have products for measurment of Nuisance(Odour Pollution and Air Pollution) in Indoor and Outdoor Environments. With offered gamut of products, we are providing one stop destination to meet each client's demand in the most effective manner MT Enterprises is head quartered in New Delhi, the capital of India and has associates at different cities to cover the entire India. Mr. Sachin Tanwar, our great mentor, has been driving the organization with his business acumen and skills. He favors sustainable relationship and ethical business policies to provide rewarding experience to the clients. He has experience of more than 25 years in the field of Analytical Instrumentation and Sensory Analysis and has worked in world class companies like Shimadzu, Hitachi, Ametek, Alpha MOS etc.We count big organisations like CFTRI, CSIO, IIT Kharagpur, CDAC, RDSO, Dr. Reddy’s Lab,Glenmark, ITC, CEERI, AIIMS,IOCL,CPCB,TATA Global Beverages, Nestle, Marico,Givaudan and others as our customers.")),
