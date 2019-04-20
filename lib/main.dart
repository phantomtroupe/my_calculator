import 'package:flutter/material.dart';
import './app_screen/home_screen.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(fontFamily: 'sans-serif'),
  debugShowCheckedModeBanner: false,
  title: "My Calculator App",
  home: Material(
    child: HomeScreen(),
  ),
));