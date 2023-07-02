import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:math_to_cash/homescreen.dart';
// import 'package:math_to_cash/main.dart';
import 'package:math_to_cash/signIn.dart';
import 'package:math_to_cash/utilities/helpers.dart';

import 'firebase_options.dart';

class ValidateEmail extends StatefulWidget {
  const ValidateEmail({super.key});

  @override
  State<ValidateEmail> createState() => ValidateEmailState();
}

class ValidateEmailState extends State<ValidateEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Math to Cash",
        style: TextStyle(
          fontFamily: 'CutiveMono'
        ),
        ),
        centerTitle: true,
      ),
      body:FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.done:
            final user = FirebaseAuth.instance.currentUser;
            if(user?.emailVerified ?? false){
              return const HomeScreen();
            }else{
              return const VerifyEmail();
            }
            default:
              return const Text("Loading...");
        }
      }
    )
    );
  }
}

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Math to Cash",
        style: TextStyle(
          fontFamily: 'CutiveMono'
        ),
        ),
        centerTitle: true,
      ),
      body: Column(
      children: [
        verticalSpace(20),
        const Text("Call us overprotective but we need to make sure it's really you trying to sign in and not some creep sitting in a dark room with a hoodie over his head.",
        style: TextStyle(fontFamily: 'ShareTechMono')
        ),
        verticalSpace(20),
        const Text("Click here to verify your email"),
        TextButton(
          onPressed: ()async{
            final user = FirebaseAuth.instance.currentUser;
            await user?.sendEmailVerification();
            Navigator.push(
              context,
              MaterialPageRoute(builder: ((context) => const SignIn())));
          },
          child: const Text("Send email verification"),
        )
      ]
    )
    );
  }
}

