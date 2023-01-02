import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  //keys
  static String userLoggedInKey = 'userLoggedInKey';
  // static String userNameKey = 'userNameKey';
  // static String userEmailKey = 'userEmailKey';

//saving the data to shared preferences
  //saving user logged in status to shared preferences
  static Future<bool> saveUserLoggedInStatus(bool isLoggedIn)async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setBool(userLoggedInKey,isLoggedIn);
  }

  //   //saving user name to shared preferences
  // static Future<bool> saveUserNameKey(String userName)async{
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   return preferences.setString(userNameKey,userName);
  // }
  //
  //   //saving email to shared preferences
  // static Future<bool> saveUserEmailKey(String email)async{
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   return preferences.setString(userNameKey,email);
  // }

//getting the data from shared preferences

  static Future<bool?> getUserLoggedInStatus()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(userLoggedInKey);
  }
}
