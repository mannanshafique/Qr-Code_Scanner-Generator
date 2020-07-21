import 'package:barcode_scan/barcode_scan.dart';
import 'package:barcode_scan/platform_wrapper.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class Scan extends StatefulWidget {
  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  String result = "Not Yet Scanned";

  Future _scanQR() async {
    try {
      var qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult.rawContent;
      });
    } on PlatformException catch (ex) {
      //platform exception error when user denided camera permission
      if (ex.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          result = "Camera Permission Denied";
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
        });
      }
    } on FormatException {
      //Qr format is not good or back press
      setState(() {
        result = "Backed Press";
      });
    } catch (ex) {
      setState(() {
        result = "Unknown error $ex";
      });
    }
  }

  Future<void> _lauchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true, //yani app nahi count ho ga height may
        appBar: AppBar(
          title: Text("QR Code Scanner App"),
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          "Result",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        GestureDetector(
                          onTap: () {
                            _lauchInBrowser(result);
                          },
                          child: Text(
                            result,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 15),
                child: RaisedButton.icon(
                  color: Colors.blue,
                  elevation: 5,
                  onPressed: () {
                    _scanQR();
                  },
                  label: Text(
                    "SCAN QR CODE",
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.black, width: 3.0)),
                )),
            SizedBox(
              height: 15,
            )
          ],
        ));
  }
}
