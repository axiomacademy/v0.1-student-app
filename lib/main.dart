import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/auth/auth_bloc.dart';

import 'pages/main/main.dart';
import 'pages/welcome.dart';

import 'repository/auth/auth_repository.dart';
import 'repository/ferry_client.dart';
import 'repository/student/student_repository.dart';

import 'themer.dart';

void main() {
  // Start the ferry client
  final fclient = FerryClient("http://localhost:8080/query");
  final authRepository = AuthRepository(fclient);

  // Anything that handles authentication needs a reference to auth repository
  final studentRepository = StudentRepository(fclient, authRepository);

  runApp(AxiomApp(
      authRepository: authRepository, studentRepository: studentRepository));
}

/// The main flutter application
class AxiomApp extends StatelessWidget {
  /// Root Auth Repository
  final AuthRepository authRepository;

  /// Root Student Repository
  final StudentRepository studentRepository;

  /// Root App constructor
  AxiomApp(
      {Key key,
      @required this.authRepository,
      @required this.studentRepository})
      : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: authRepository),
        RepositoryProvider.value(value: studentRepository)
      ],
      child: BlocProvider(
          create: (_) => AuthBloc(
              authRepository: authRepository,
              studentRepository: studentRepository),
          child: AxiomAppView()),
    );
  }
}

/// The app view with the material routing logic
class AxiomAppView extends StatefulWidget {
  /// Default AxiomAppView constructor
  AxiomAppView({Key key}) : super(key: key);

  @override
  _AxiomAppViewState createState() => _AxiomAppViewState();
}

class _AxiomAppViewState extends State<AxiomAppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Axiom",
      theme: buildTheme(),
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              switch (state.status) {
                case AuthStatus.authenticated:
                  _navigator.pushAndRemoveUntil<void>(
                      MainPage.route(), (route) => false);
                  break;
                case AuthStatus.unauthenticated:
                  _navigator.pushAndRemoveUntil<void>(
                      WelcomePage.route(), (route) => false);
                  break;
                default:
                  break;
              }
            },
            child: child);
      },
      onGenerateRoute: (_) =>
          MaterialPageRoute<void>(builder: (_) => Container()),
    );
  }
}
