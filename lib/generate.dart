import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Generate extends StatefulWidget {
  @override
  _GenerateState createState() => _GenerateState();
}

class _GenerateState extends State<Generate> {
  String qrData = "www.google.com";
  TextEditingController qrText = TextEditingController();
  FocusNode myFocusNode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text("QR Code Generator"),
          centerTitle: true,
          elevation: 0,
        ),
        backgroundColor: Color(0xff2196f3),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 90),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 60),
                  child: Container(
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        QrImage(data: qrData),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          qrData,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Text(
              "Get Your data/link in the QR CODE",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                cursorColor: Colors.black,
                style: TextStyle(color: Colors.white, fontSize: 20),
                controller: qrText,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 3, color: Colors.black)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 3, color: Colors.black)),
                    labelText: "Enter The Data/Link",
                    labelStyle: TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 15),
                child: RaisedButton.icon(
                  splashColor: Colors.black,
                  color: Colors.blue,
                  elevation: 5,
                  onPressed: () {
                    if (qrText.text.isEmpty) {
                      setState(() {
                        qrData = "flutter.dev";
                      });
                    } else {
                      setState(() {
                        qrData = qrText.text;
                        qrText.clear();
                      });
                    }
                  },
                  label: Text(
                    "GENERATE QR CODE",
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.black, width: 3.0)),
                )),
            SizedBox(
              height: 15,
            )
          ],
        ));
  }
}
