// ignore_for_file: camel_case_types
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:math_to_cash/constants/theme_constants.dart';
import 'package:math_to_cash/signIn.dart';
import 'package:math_to_cash/utilities/helpers.dart';
import 'constants/theme_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'dart:developer' as devtools show log;

ThemeManager _themeManager = ThemeManager();
void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: lightTheme,
    darkTheme: darkTheme,
    themeMode: _themeManager.themeMode,
    home: const MyApp()
  ));
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _myAppState();
}

class _myAppState extends State<MyApp> {

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  themeListener(){
    if(mounted){
      setState(() {

      });
    }
  }

  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme App"),
        actions: [Switch(value: _themeManager.themeMode == ThemeMode.dark, onChanged: (someValue){
          _themeManager.toggleTheme(someValue);
        })]
      ),
      body: Center(
        child: Column(
          children: [
            verticalSpace(20),
            const CircleAvatar(
              radius: 60.0,
              backgroundImage: AssetImage('assets/images/Car.jpg')
            ),
            verticalSpace(20),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Email",
                hintText: "Someone@gmail.com",
              ),
              controller: _email,
            ),
            verticalSpace(15),
              TextFormField(
              obscureText: obscured,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: "Password",
                hintText: "**********",
                suffixIcon: IconButton(
                  onPressed: (){
                    setState(() {
                      if (obscured = true){
                        obscured = false;
                      }
                      else if(obscured = false){
                        obscured = true;
                      }
                    });
                  },
                  icon: const Icon(Icons.remove_red_eye)),
              ),
              controller: _password,
            ),
            verticalSpace(20),
            ElevatedButton(
              onPressed: ()async{

                await Firebase.initializeApp(
                  options: DefaultFirebaseOptions.currentPlatform,
                );

                final email = _email.text;
                final password = _password.text;
                final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: email,
                  password: password,
                );
                print(userCredential);
              },
              child: const Text("Sign up")),
              verticalSpace(20),
              TextButton(
                onPressed: (){
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const SignIn()));
                },
                child: const Text("Already a member? Sign in"))
          ]
        )
      )
    );
  }
}