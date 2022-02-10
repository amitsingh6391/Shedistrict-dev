import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shedistrict/ui/core/page_transition.dart';
import 'package:google_fonts/google_fonts.dart';

//we will define our Apptheme class for definign our app themes;
class Apptheme {
  final BuildContext context;
  Apptheme(this.context);

  static const btnHeight = 45.0;
  static const btnWidth = 180.0;
  static const inputHeight = 45.0;
  static const normalTextSize = 15.0;
  static const labelTextSize = 17.0;

  static const backgroundColor = Color(0xffffffff);
  static const secondaryColor = Color(0xfffdeff6);
  static const lightbuttonColor = Color.fromRGBO(237, 96, 169, 0.5);

  static const conversattionColor = Color(0xfffFED32C);
  static const conversattionlightColor = Color(0xffFFF0B5);

  static const filterColor = Color(0xff60EDAC);

  static const filterlightColor = Color(0xFFe7fcf3);

  static const primaryColor = Color(0xffed60a9);
  static const assentColor = Color(0xff101010);
  static const eventsColor = Color(0xff808DF1);
  static const assentColor2 = Color(0xff808DF1);
  static const purchaseColor = Color(0xff47C2E9);
  static const black = Colors.black;
  static final grayBackground = Colors.grey.shade200;

  static final eventCardColor = Color.fromRGBO(
    128,
    141,
    241,
    0.14,
  );

  static final eventbuttonColorlight = Color.fromRGBO(
    128,
    141,
    241,
    0.53,
  );

  static final profileColor = Color.fromRGBO(
    128,
    141,
    241,
    0.03,
  );
  static const eventInputBackgroundColor = Color.fromRGBO(128, 141, 241, 0.1);

  // Color(0xFFEAEAFF).withOpacity(0.1);

  static const eventCardColorlight = Color.fromRGBO(
    128,
    141,
    241,
    0.1,
  );

  static const editIconsColor = Color(0xFF808DF1);
  static const messageIconDisabledColor = Color.fromRGBO(237, 96, 169, 0.5);
  static const messageIconActivieColor = Color(0xFFEC77C8);
  static const messageIconColor = Color(0xFFEC77C8);
  static const postCardIconBackgroundColor =
      Color.fromRGBO(128, 141, 241, 0.12);
  static const postCardIconColor = Color(0xFF808DF1);
  static const backbuttonColor = Color.fromRGBO(
    128,
    141,
    241,
    0.12,
  );

  static const lightColor = Color.fromRGBO(
    142,
    142,
    142,
    0.5,
  );

  // Color(0xff8E8E8E);

  static const chatlightColor = Color(0xffF3F3F3);

  TextStyle lightText = GoogleFonts.poppins(
    color: lightColor,
    fontSize: 17,
  );

  TextStyle boldText = GoogleFonts.poppins(
    color: assentColor,
    fontWeight: FontWeight.w500,
  );
  TextStyle thinText = GoogleFonts.poppins(
    color: assentColor,
    fontWeight: FontWeight.w100,
  );
  TextStyle lightboldText = GoogleFonts.poppins(
    color: assentColor,
    fontWeight: FontWeight.w400,
  );

  TextStyle normalText = GoogleFonts.poppins(
    color: assentColor,
    fontWeight: FontWeight.w300,
  );

  static ThemeData theme = ThemeData(
    // shadowColor: Color.fromRGBO(0, 0, 0, 0.1),
    pageTransitionsTheme: PageTransitionsTheme(builders: {
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      // TargetPlatform.iOS: RotationFadeTransitionBuilder(),
      TargetPlatform.android: RotationFadeTransitionBuilder(),
    }),
    primaryTextTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 10,
        // color: Colors.red,
      ),
      bodyText2: TextStyle(
        fontSize: 5,
        // color: Colors.red,
      ),
    ),
    accentIconTheme: const IconThemeData(
      color: primaryColor,
    ),
    scaffoldBackgroundColor: backgroundColor,
    fontFamily: "Circular_Bold",
    accentColor: primaryColor,
    buttonTheme: const ButtonThemeData(
      buttonColor: assentColor,
      padding: EdgeInsets.symmetric(vertical: 20),
      minWidth: double.maxFinite,
      colorScheme: ColorScheme.light(brightness: Brightness.dark),
    ),
    buttonColor: primaryColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          primaryColor,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 15,
          ),
        ),
        minimumSize: MaterialStateProperty.all(
          const Size(
            34,
            50,
          ),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          backgroundColor,
        ),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 20,
            fontFamily: "Circular",
          ),
        ),
        minimumSize: MaterialStateProperty.all(
          const Size(
            34,
            50,
          ),
        ),
      ),
    ),
    // textTheme: GoogleFonts.poppinsTextTheme(),
    appBarTheme: const AppBarTheme(
      elevation: 3,
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: backgroundColor,
      ),
      color: backgroundColor,
      centerTitle: false,
      brightness: Brightness.light,
      iconTheme: IconThemeData(
        color: Colors.black,
        opacity: 18,
        size: 25,
      ),

      textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 12.0,
        ),
        headline6: TextStyle(
          fontSize: 25.0,
          fontStyle: FontStyle.italic,
        ),
        bodyText2: TextStyle(
          fontSize: 14.0,
          fontFamily: 'Hind',
        ),
      ),
    ),
    toggleableActiveColor: primaryColor,
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: primaryColor),
      ),
      labelStyle: TextStyle(
        color: Color(0xff253157),
      ),
      hintStyle: TextStyle(
        color: Color(0xff253157),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
    ),
  );
}
