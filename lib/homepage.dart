import 'package:flutter/material.dart';
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
}
