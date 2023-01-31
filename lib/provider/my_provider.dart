//
// import 'package:flutter/material.dart';
// import 'package:todo/layout/prefrancese.dart';
//
// import '../shared/stayls/my_themedata.dart';
//
// class MyProvider extends ChangeNotifier{
//   String languageCode='en';
//   ThemeMode currentTheme=ThemeMode.light;
//
//
//   void changelanguage(String lang){
//     if(languageCode==lang)return;
//
//     languageCode=lang;
//     notifyListeners();
//   }
//   // Color getcolour(String lang){
//   //   return (languageCode==lang? Theme. : MyTHemeData.colorwhit);
//   //
//   // }
//   void changetheme(ThemeMode crrunt){
//     if(currentTheme==crrunt)return;
//     currentTheme=crrunt;
//     prefHandlar.savetheme(currentTheme);
//
//     notifyListeners();
//   }
//   fetchmode(){
//     ThemeMode themeMode=prefHandlar.gettheme();
//     currentTheme =themeMode;
//     notifyListeners();
//
//   }
//
//
// }