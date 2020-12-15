import 'package:icarehotel/shared/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  static String urlLogin = "https://login.wframwork.com";
  static String urlUpload = "https://upload.wframwork.com";

  // Api POST ล็อกอิน [ยังไม่ได้ใช้งาน รอต่อ database]
  static signIn(context, String username, String password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'CusCode': 'ICARE-001',
      'UserName': username,
      'Password': password,
    };
    //print(data);
    try {
      var jsonResponse =
          await Const.httpPost(context, urlLogin + "/api/Login/Login", data);
      if (jsonResponse != null) {
        if (jsonResponse['data']["data"] != null) {
          sharedPreferences.setString("token", jsonResponse['data']['data']);
          return true;
        } else {
          print("Login Error");
          return false;
        }
      } else {
        print("Login Error");
        return false;
      }
    } catch (Exception) {
      print(Exception);
      return false;
    }
  }
}
