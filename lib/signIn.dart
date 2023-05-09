import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:math_to_cash/constants/theme_constants.dart';
import 'package:math_to_cash/utilities/helpers.dart';
import 'dart:developer' as devtools show log;

import 'firebase_options.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    theme: lightTheme,
    darkTheme: darkTheme,
    home: const SignIn()
  ))
  ;
}

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Math to Cash",
        style: TextStyle(fontFamily: 'CinzelDecorative')
        )
      ),
      body: Container(
      padding: const EdgeInsets.all(5),
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
              obscureText: true,
              decoration:  InputDecoration(
                border: const OutlineInputBorder(),
                labelText: "Password",
                hintText: "**********",
                suffixIcon:  IconButton(
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
                final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: email,
                  password: password
                );
                print(userCredential);
              },
              child: const Text("Sign in"))
        ]
      )
      )
    );
  }
}