import 'package:flutter/material.dart';
import 'package:math_to_cash/constants/theme_constants.dart';

void main(){
  runApp(MaterialApp(
    theme: lightTheme,
    darkTheme: darkTheme,
    home: const HomeScreen()
  ));
}

enum MenuAction{logout}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // PopupMenuButton<MenuAction>(
          //   itemBuilder: itemBuilder
          // )
        ]
      )
    );
  }
}