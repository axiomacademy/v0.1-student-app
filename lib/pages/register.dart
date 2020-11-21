import 'package:flutter/material.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/buttons.dart';
import '../components/text_fields.dart';

class RegisterPage extends StatefulWidget {
  /// Convenience method to route to WelcomePage
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => RegisterPage());
  }

  @override
  _RegisterPageState createState() {
    return _RegisterPageState();
  }
}

/// Main page for registration for new students
class _RegisterPageState extends State<RegisterPage> {
  final _registerScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Material(
        child: Stack(children: <Widget>[
      SvgPicture.asset("./assets/images/background-register.svg",
          semanticsLabel: "Background Color", width: width),
      SafeArea(
          child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Register",
                      style: Theme.of(context).textTheme.headline4.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                            "Give us some basic information about yourself and we’ll get you up and running in a jiffy",
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
                      controller: _registerScrollController,
                      child: Container(
                          margin: EdgeInsets.all(20.0),
                          child: Material(
                              type: MaterialType.card,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              elevation: 3,
                              child: Container(
                                  padding: EdgeInsets.only(
                                      top: 30,
                                      bottom: 20,
                                      left: 25.0,
                                      right: 25.0),
                                  child: _RegisterForm())))))))
    ]));
  }
}

/// Register Form widget
class _RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() {
    return _RegisterFormState();
  }
}

class _RegisterFormState extends State<_RegisterForm> {
  final _registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _registerFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            BorderTextFormField(
                labelText: 'Username',
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                }),
            Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: BorderTextFormField(
                  labelText: 'First Name',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                )),
            Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: BorderTextFormField(
                  labelText: 'Last Name',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                )),
            Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: BorderTextFormField(
                  labelText: 'Email',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                )),
            Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: BorderTextFormField(
                  labelText: 'Password',
                  suffixIcon: Icon(Icons.visibility_off),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                )),
            Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: BorderTextFormField(
                  labelText: 'Confirm Password',
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
                  TextFlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      text: "BACK"),
                  Spacer(),
                  Container(
                      width: 140.0,
                      child: IconRaisedButton(
                          onPressed: () {
                            if (_registerFormKey.currentState.validate()) {
                              Scaffold.of(context).showSnackBar(
                                  SnackBar(content: Text('Processing Data')));
                            }
                          },
                          text: "CONTINUE",
                          icon: Icons.navigate_next)),
                ])),
          ],
        ));
  }
}
