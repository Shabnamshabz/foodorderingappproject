import 'package:shared_preferences/shared_preferences.dart';

class Localrepository
{
  Future<void> savelogintoken(String token)
  async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userlogintoken',token);
  }

  Future<String?> getlogintoken()
  async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? action = prefs.getString('userlogintoken');
    return action;
  }
  Future<void> removetoken()
  async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('userlogintoken');
  }
}