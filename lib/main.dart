import 'package:flutter/material.dart';

import 'pages/welcome.dart';
import 'pages/login.dart';
import 'pages/register.dart';
import 'pages/chat.dart';
import 'pages/tutor.dart';
import 'pages/subject.dart';
import 'pages/main/main.dart';

import 'themer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Axiom',
        theme: buildTheme(),
        home: RegisterPage(),
        routes: {
          "/welcome": (context) => WelcomePage(),
          "/login": (context) => LoginPage(),
          "/register": (context) => RegisterPage(),
          "/chat": (context) => ChatPage(),
          "/tutor": (context) => TutorPage(),
          "/subject": (context) => SubjectPage(),
        });
  }
}
