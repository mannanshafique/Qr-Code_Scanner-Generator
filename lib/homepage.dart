import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_code_scanner_geneator_app/generate.dart';
import 'package:qr_code_scanner_geneator_app/scan.dart';

import 'customclipper.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: drawer(),

//Use to transperent drawer

        // Theme(
        //   data: Theme.of(context).copyWith(
        //     // Set the transparency here
        //     canvasColor: Colors
        //         .transparent, //or any other color you want. e.g Colors.blue.withOpacity(0.5)
        //   ),
        //   child: drawer(),
        // ),

        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text("QR Code Scanner App"),
          centerTitle: true,
          elevation: 0,
        ),
        backgroundColor: Color(0xff73bbf6),
        body: Stack(
          children: <Widget>[
            ClipPath(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 440,
                color: Color(0xff2196f3),
              ),
              clipper: CustomClipPath(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 80,
                ),
                Center(
                  heightFactor: 1,
                  child: Image.asset("images/scanning_phone.png"),
                ),
                SizedBox(
                  height: 5,
                ),
                flatButtons("Scan QR CODE", Scan()),
                flatButtons("Generate QR CODE", Generate()),
              ],
            )
          ],
        ));
  }

  Widget flatButtons(String text, Widget widget) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      child: FlatButton(
        child: Text(
          text,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => widget));
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(color: Colors.blue, width: 3.0)),
      ),
    );
  }

  Widget drawer() {
    return Container(
      // I add container because of change in width
      width: 230,
      child: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0.0), // because upside grey not come
          children: <Widget>[
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xff2196f3),
                ),
                accountName: Text("M.Mannan Shafique"),
                accountEmail: Text("shafiquemanan@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.black,
                  child: Padding(
                    padding: EdgeInsets.all(2.7),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('images/profile_image.jpg'),
                    ),
                  ),
                )),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Scan()));
              },
              child: ListTile(
                leading: CircleAvatar(
                    radius: 23,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      backgroundColor: Color(0xff2196f3),
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                    )),
                subtitle: Text("Click to Scan"),
                title: Text("Scan QR"),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Generate()));
              },
              child: ListTile(
                leading: CircleAvatar(
                    radius: 23,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                        backgroundColor: Color(0xff2196f3),
                        child: FaIcon(
                          FontAwesomeIcons.qrcode,
                          size: 30,
                          color: Colors.white,
                        ))),
                subtitle: Text("Click to Generate"),
                title: Text("Generate QR"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
