import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LangProvider with ChangeNotifier{
String language="en";
changeLanguage (String lan)async{
  SharedPreferences prfs=await SharedPreferences.getInstance();
  prfs.setString('lang',lan);
  getLanguage();
  notifyListeners();
  
  
}
getLanguage ()async{
  SharedPreferences prfs=await SharedPreferences.getInstance();
  language=prfs.getString("lang")??"en";
  notifyListeners();



}





}