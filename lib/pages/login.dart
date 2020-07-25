import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../components/buttons.dart';
import '../components/text_fields.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Material(
        child: Stack(children: <Widget>[
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
              child: Container(
                  margin: EdgeInsets.all(20.0),
                  child: Material(
                      type: MaterialType.card,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      elevation: 3,
                      child: Container(
                          padding: EdgeInsets.only(
                              top: 25, bottom: 25, left: 25.0, right: 25),
                          child: Form(
                              key: _formKey,
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
                                        padding: EdgeInsets.only(top: 10.0),
                                        child: BorderTextFormField(
                                          labelText: 'Password',
                                          suffixIcon:
                                              Icon(Icons.visibility_off),
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
                                                  onPressed: () {},
                                                  text: "CONTINUE",
                                                  icon: Icons.navigate_next)),
                                        ]))
                                  ]))))))),
    ]));
  }
}
