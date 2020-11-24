import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../components/buttons.dart';
import '../components/text_fields.dart';

import '../bloc/login/login_bloc.dart';
import '../repository/auth/auth_repository.dart';

/// Login Page widget
class LoginPage extends StatefulWidget {
  /// Default constructor for login page
  LoginPage({Key key}) : super(key: key);

  /// Convenience method to route to LoginPage
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => LoginPage());
  }

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: <Widget>[
          SvgPicture.asset("./assets/images/background-login.svg",
              semanticsLabel: "Background Color", width: width),
          SafeArea(
              child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Login",
                          style: Theme.of(context).textTheme.headline4.copyWith(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text(
                                "We’re happy to have you back, login and pick up exactly where you left off",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                        color: Colors.white))),
                      ]))),
          Align(
              alignment: Alignment.bottomCenter,
              child: SafeArea(
                  child: KeyboardAvoider(
                      child: SingleChildScrollView(
                          controller: _loginScrollController,
                          child: Padding(
                              padding: EdgeInsets.only(top: 50.0),
                              child: Container(
                                  margin: EdgeInsets.only(
                                      top: 0.0,
                                      left: 20.0,
                                      right: 20.0,
                                      bottom: 20.0),
                                  child: Material(
                                      type: MaterialType.card,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      elevation: 3,
                                      child: Container(
                                          padding: EdgeInsets.only(
                                              top: 40,
                                              bottom: 30,
                                              left: 25.0,
                                              right: 25),
                                          child: BlocProvider(
                                              create: (context) {
                                                return LoginBloc(
                                                    RepositoryProvider.of<
                                                            AuthRepository>(
                                                        context));
                                              },
                                              child: _LoginForm()))))))))),
        ]));
  }
}

class _LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<_LoginForm> {
  final _loginFormKey = GlobalKey<FormState>();

  // TextEditing controllers for form input
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(listener: (context, state) {
      if (state.status == LoginStatus.failed) {
        Scaffold.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(content: Text(state.message)),
          );
      }
    }, child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Form(
          key: _loginFormKey,
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            BorderTextFormField(
                controller: _usernameController,
                labelText: 'Username',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                }),
            Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: BorderTextFormField(
                  controller: _passwordController,
                  labelText: 'Password',
                  hidden: true,
                  suffixIcon: Icon(Icons.visibility_off),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                )),
            Padding(
                padding: EdgeInsets.only(
                  top: 40.0,
                ),
                child: Row(children: <Widget>[
                  StandardFlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      text: "BACK"),
                  Spacer(),
                  Container(
                      width: 140.0,
                      child: StandardRaisedButton(
                          loading: (state.status == LoginStatus.submitting ||
                              state.status == LoginStatus.successful),
                          onPressed: () => submitForm(context),
                          text: "CONTINUE",
                          icon: Icons.navigate_next)),
                ])),
          ]));
    }));
  }

  void submitForm(BuildContext context) {
    // Dismiss the keyboard
    FocusScope.of(context).unfocus();

    if (_loginFormKey.currentState.validate()) {
      final username = _usernameController.text;
      final password = _passwordController.text;
      context.read<LoginBloc>().add(LoginSubmitted(username, password));
    }
  }
}
