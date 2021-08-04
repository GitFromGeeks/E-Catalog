import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/footer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  bool e = false;

  @override
  void initState() {
    super.initState();
    e = false;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image(
              image: AssetImage('mt.png'),
              height: 60.0,
              width: 60.0,
            ),
            Text("MT Enterprises")
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.phone,
                  color: Colors.black,
                ),
                Padding(padding: EdgeInsets.only(left: 5.0)),
                Text(
                  "+91 8586874112",
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
                  Container(
                    child: Image(
                        fit: BoxFit.fill,
                        image: AssetImage("handicraft.png"),
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 10.0)),
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
                    child: Text("Catalog"),
                    onPressed: () {
                      Navigator.of(context).pushNamed("/catalog");
                    }),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                      text: '    Who we are',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: RichText(
                        text: TextSpan(
                            text:
                                "MT Enterprises is a widely known and reliable representative and distributor of various products in the Sensory Analysis Field such as Sensory Instruments (electronic nose, electronic tongue and electronic eye FIZZ Software for conducting automated Sensory and Consumer Tests, ARCS Software which provides complete Panel Managment Solutions and Olfactory Port for GC.We also have products for measurment of Nuisance(Odour Pollution and Air Pollution) in Indoor and Outdoor Environments. With offered gamut of products, we are providing one stop destination to meet each client's demand in the most effective manner MT Enterprises is head quartered in New Delhi, the capital of India and has associates at different cities to cover the entire India. Mr. Sachin Tanwar, our great mentor, has been driving the organization with his business acumen and skills. He favors sustainable relationship and ethical business policies to provide rewarding experience to the clients. He has experience of more than 25 years in the field of Analytical Instrumentation and Sensory Analysis and has worked in world class companies like Shimadzu, Hitachi, Ametek, Alpha MOS etc.We count big organisations like CFTRI, CSIO, IIT Kharagpur, CDAC, RDSO, Dr. Reddy’s Lab,Glenmark, ITC, CEERI, AIIMS,IOCL,CPCB,TATA Global Beverages, Nestle, Marico,Givaudan and others as our customers.")),
                  ),
                  Expanded(
                    child: Image(image: AssetImage("handicraft.png")),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              appfooter()
            ],
          ),
        ),
      ),
    );
  }
}
