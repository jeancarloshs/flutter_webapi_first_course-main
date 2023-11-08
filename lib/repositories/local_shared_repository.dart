import 'package:shared_preferences/shared_preferences.dart';

class LocalSharedRepository {
  Future<void> saveToken(String token) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("accessToken", token);
  }
}
