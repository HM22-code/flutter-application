import 'package:flutter/material.dart';
import 'package:flutter_application/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "regular",
        appBarTheme:  AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        )
      ),
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
