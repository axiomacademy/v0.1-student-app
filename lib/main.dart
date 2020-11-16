import 'package:flutter/material.dart';

import 'pages/chat.dart';
import 'pages/login.dart';
import 'pages/main/main.dart';
import 'pages/register.dart';
import 'pages/subject.dart';
import 'pages/tutor.dart';
import 'pages/welcome.dart';

import 'repository/auth/auth_repository.dart';
import 'repository/ferry_client.dart';
import 'repository/student/student_repository.dart';

import 'themer.dart';

void main() {
  runApp(AxiomApp());
}

/// The main flutter application
class AxiomApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Testing repository
    final fclient = FerryClient("http://localhost:8080/query");
    final authRepo = AuthRepository(fclient);
    final studentRepo = StudentRepository(fclient);

    authRepo.logIn(username: "shruthika", password: "password");

    Future.delayed(const Duration(milliseconds: 5000), studentRepo.getSelf)
        .catchError(print);

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
