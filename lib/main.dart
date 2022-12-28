import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muhammad_sabah_ibrahim_homework/src/screen/login_screen.dart';

void main() async {
  GoogleFonts.config.allowRuntimeFetching = true;
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final _defaultLightColorScheme =
      ColorScheme.fromSwatch(primarySwatch: Colors.red);
  static final _defaultDarkColorScheme = ColorScheme.fromSwatch(
    primarySwatch: Colors.red,
    brightness: Brightness.dark,
  );

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
      return MaterialApp(
        title: 'Flutter Homework',
        theme: ThemeData(
          colorScheme: lightDynamic ?? _defaultLightColorScheme,
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            foregroundColor: Colors.black,
          ),
          textTheme: GoogleFonts.ralewayTextTheme(),
        ),
        darkTheme: ThemeData(
          colorScheme: darkDynamic ?? _defaultDarkColorScheme,
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            foregroundColor: Colors.white,
          ),
          textTheme: GoogleFonts.ralewayTextTheme(),
        ),
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        home: const LoginScreen(),
      );
    });
  }
}
