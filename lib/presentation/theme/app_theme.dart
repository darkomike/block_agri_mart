import 'package:block_agri_mart/presentation/theme/theme.dart';
import 'package:flutter/material.dart';

class AppTheme {

  static TextTheme lightTextTheme = const TextTheme(
    bodyText1: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline1: TextStyle(
      fontSize: 48.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline2: TextStyle(
      fontSize: 32.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    headline3: TextStyle(
      fontSize: 21.0,
      color: Colors.black,
    ),
    headline6: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );

  static TextTheme darkTextTheme = const TextTheme(
    bodyText1: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline1: TextStyle(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline2: TextStyle(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline3: TextStyle(
      fontSize: 16.0,
      
      color: Colors.white,
    ),
    headline6: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );


  // LIGHT THEME 
  static ThemeData light() {
    return ThemeData(
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.green[100],
      fontFamily: 'Poppins',
      textTheme: lightTextTheme,
      
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
              
              side: MaterialStateProperty.all(
                BorderSide(color: Colors.green.shade100),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.green.shade600),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular( 10)))),
         

      ),
    );
  }
  
  // DARK THEME 
   static ThemeData dark() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: ColorConstants.backgroundColorD,
      ),
      backgroundColor: ColorConstants.backgroundColorD,
      scaffoldBackgroundColor: ColorConstants.backgroundColorD,
      fontFamily: 'Poppins',
      
      textTheme: darkTextTheme, 
    );
  }
}
