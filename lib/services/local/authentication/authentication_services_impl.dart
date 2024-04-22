
import 'package:shopping/core/constants.dart';
import 'package:shopping/services/local/authentication/authentication_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalAuthentificationServiceImpl implements LocalAuthentificationService {
  @override
  Future<bool> deleteToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.remove(Constants.SHOPPING_ACCESS_TOKEN);
  }

  @override
  Future<String?> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(Constants.SHOPPING_ACCESS_TOKEN);
  }

  @override
  Future<bool> saveToken(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(Constants.SHOPPING_ACCESS_TOKEN, token);
    return true;
  }
  

  @override
  Future<bool> deleteUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(Constants.SHOPPING_USER);
    return true;
  }

  @override
  Future<bool> saveUser(user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(Constants.SHOPPING_USER, user);
    return true;
  }

   @override
  Future<String?> getUser() async {
    SharedPreferences preferences = await  SharedPreferences.getInstance();
    return preferences.getString(Constants.SHOPPING_USER);
  }

  @override
  Future<bool> hasAuthToken() async {
    SharedPreferences preferences = await  SharedPreferences.getInstance();
    if (preferences.getString(Constants.SHOPPING_ACCESS_TOKEN) != null){
      return true;
    }
    else{
      return false;
    }
  }  
}
