part of 'utils.dart';

class BobtailTheme {
  const BobtailTheme({
    Key? key,
  });
  static ThemeData generateTheme() {
    final original = ThemeData.light();
    return ThemeData(
      primaryColor: BobtailCustomColors.primaryColor,
      brightness: Brightness.light,
      canvasColor: BobtailCustomColors.backgroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: BobtailCustomColors.backgroundColor,
        iconTheme: IconThemeData(color: BobtailCustomColors.primaryColor),
        elevation: BobtailElevation.elevation0,
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: BobtailCustomColors.backgroundColor,
          systemNavigationBarDividerColor: BobtailCustomColors.backgroundColor,
          statusBarColor: BobtailCustomColors.backgroundColor,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      textTheme: original.textTheme.copyWith(
        headline3: GoogleFonts.lato(
          textStyle: const TextStyle(
              fontSize: BobtailFontSizes.fontSize36,
              fontWeight: FontWeight.w600,
              letterSpacing: BobtailLetterSpacing.letterSpacing0,
              color: BobtailCustomColors.primaryColor,
              fontStyle: FontStyle.italic),
        ),
        bodyText1: GoogleFonts.lato(
          textStyle: const TextStyle(
              fontSize: BobtailFontSizes.fontSize16,
              fontWeight: FontWeight.normal,
              letterSpacing: BobtailLetterSpacing.letterSpacing0,
              color: BobtailCustomColors.primaryColor,
              fontStyle: FontStyle.italic),
        ),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }
}
