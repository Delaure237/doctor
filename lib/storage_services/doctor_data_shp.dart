import 'package:shared_preferences/shared_preferences.dart';

class StorageService{
  static Future<void> setString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static Future<String?> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<void> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
///recupere les donnees d'authentification


// Ajouter ces méthodes à votre AuthenticationBloc
Future<void> persistAuthenticationState(bool isAuthenticated) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('isAuthenticated', isAuthenticated);
}

Future<bool> getAuthenticationState() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isAuthenticated') ?? false;
}
