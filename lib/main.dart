import 'package:flutter/material.dart';
import 'package:numed/screens/home_screen.dart';


var  gv="global";
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Numed',
      home: HomeScreen(),
    );
  }
}
