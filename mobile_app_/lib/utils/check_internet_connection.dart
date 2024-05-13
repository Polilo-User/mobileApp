



import 'dart:io';

class CheckInternetConnection {
  static Future<bool> internet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return true;
    } catch(e) {
      return false;
    }
  }
}
