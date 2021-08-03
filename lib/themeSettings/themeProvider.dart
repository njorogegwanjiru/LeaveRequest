import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const MaterialColor primaryBlack = MaterialColor(
  _blackPrimaryValue,
  <int, Color>{
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(_blackPrimaryValue),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);
const MaterialColor blue = MaterialColor(
  _bluePrimaryValue,
  <int, Color>{
    50: Color(0xFFE3F2FD),
    100: Color(0xFFBBDEFB),
    200: Color(0xFF90CAF9),
    300: Color(0xFF64B5F6),
    400: Color(0xFF42A5F5),
    500: Color(_bluePrimaryValue),
    600: Color(0xFF1E88E5),
    700: Color(0xFF1976D2),
    800: Color(0xFF1565C0),
    900: Color(0xFF0D47A1),
  },
);
const int _bluePrimaryValue = 0xFF2196F3;
const int _blackPrimaryValue = 0xFF000000;

ThemeData light = ThemeData(
  fontFamily: 'KoHo',
  brightness: Brightness.light,
  primaryColor: Color(0xff52057B),
  primaryColorBrightness: Brightness.light,
  accentColor: Color(0xff892cdc),
  backgroundColor: Color(0xff52057B),
  scaffoldBackgroundColor: Color(0xffFFFFFF),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Color(0xff892cdc),
  ),
  cardColor: Color(0xffffffff),
  canvasColor: Color(0xffbc6ff1),
  buttonColor: Color(0xff33034d),
  hintColor: Colors.grey,
  textTheme: TextTheme(
    headline6: TextStyle(
      color: Colors.black
    ),
    headline1: TextStyle(color: Color(0xff52057B),fontSize: 16,fontWeight: FontWeight.bold),
    headline2: TextStyle(color: Color(0xff52057B),fontSize: 16,fontWeight: FontWeight.normal),
    bodyText1:  TextStyle(fontWeight: FontWeight.bold,fontSize: 22),
    bodyText2: TextStyle(color: Colors.grey.shade800),
    subtitle1: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,),
    subtitle2: TextStyle(color: Colors.white,fontSize: 18),
  ),
);

ThemeData dark = ThemeData(
  fontFamily: 'KoHo',
  brightness: Brightness.dark,
  primaryColor: Color(0xff121212),
  primaryColorBrightness: Brightness.dark,
  accentColor: Color(0xff52057B),
  scaffoldBackgroundColor: Color(0xff282828),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Color(0xffFFFFFF),
  ),
  cardColor: Color(0xff121212),
  canvasColor: Color(0xff33034d),
  hintColor: Color(0xffbc6ff1),
backgroundColor: Colors.white,
buttonColor: Color(0xff33034d),
  textTheme: TextTheme(
    headline6: TextStyle(
        color: Colors.black
    ),
    headline1: TextStyle(color: Colors.white60,fontSize: 16,fontWeight: FontWeight.bold),
    headline2: TextStyle(color: Colors.white60,fontSize: 16,fontWeight: FontWeight.normal),

    bodyText1:  TextStyle(fontWeight: FontWeight.bold,fontSize: 22),
    bodyText2: TextStyle(color: Colors.white60),
    subtitle1: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,),
    subtitle2: TextStyle(color: Colors.white,fontSize: 18),



),
);

class ThemeNotifier extends ChangeNotifier {
  final String key = "theme";
  SharedPreferences _pref;
  bool _darkTheme;

  bool get darkTheme => _darkTheme;

  ThemeNotifier() {
    _darkTheme = false;
    _loadFromPrefs();
  }

  toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    if (_pref == null) _pref = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = _pref.getBool(key) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _pref.setBool(key, _darkTheme);
  }
}
