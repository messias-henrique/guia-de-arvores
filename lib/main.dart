// ignore_for_file: prefer_const_constructors, import_of_legacy_library_into_null_safe
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splashscreen/splashscreen.dart';
import 'components/home.dart';

Color _color1 = Color.fromRGBO(194, 213, 155, 1);
Color _color2 = Color.fromRGBO(55, 71, 79, 1);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.pacificoTextTheme(),
      ),
      // home: SizedBox(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return _introScreen();
  }
}

Widget _introScreen() {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Guia de Árvores',
    home: Stack(
      children: <Widget>[
        SplashScreen(
          seconds: 4,
          backgroundColor: _color1,
          title: Text(
            "Guia didático de árvores",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 30.0, color: _color2),
          ),
          navigateAfterSeconds: Home(),
          loaderColor: _color2,
        ),
      ],
    ),
  );
}
