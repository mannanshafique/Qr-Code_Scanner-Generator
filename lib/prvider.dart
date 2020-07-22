import 'package:flutter/foundation.dart';

class ChangeProvider extends ChangeNotifier {
  String qrData = "www.google.com";

  void noText() {
    qrData = "flutter.dev";
    notifyListeners();
  }

  void haveText(String newdata) {
    qrData = newdata;
    notifyListeners();
  }
}
