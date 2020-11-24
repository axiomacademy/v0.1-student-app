import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../components/buttons.dart';
import '../pages/register.dart';
import '../pages/login.dart';

/// WelcomePage, redirect to this for unauthneticated user
class WelcomePage extends StatefulWidget {
  /// Default WelcomePage constructor
  WelcomePage({Key key}) : super(key: key);

  /// Convenience method to route to WelcomePage
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => WelcomePage());
  }

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
            child: Container(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Column(children: <Widget>[
                  Container(
                      width: double.infinity,
                      height: 400,
                      child:
                          PageView(controller: _controller, children: <Widget>[
                        InformationPage(
                            "./assets/images/reading_time.svg",
                            "Accessible. Anytime, Anywhere.",
                            "On-demand tutoring and scheduled lessons whenever you feel like it. It’s all up to you"),
                        InformationPage(
                            "./assets/images/wallet.svg",
                            "Affordable. Pay only when you use.",
                            "A pricing model that is both flexible and transparent, making your life a lot easier"),
                        InformationPage(
                            "./assets/images/celebrating.svg",
                            "Awesome. By students, for students.",
                            "Packed with nice-to-have features, designed to ensure learning is convenient and fun"),
                      ])),
                  SmoothPageIndicator(
                    controller: _controller, // PageController
                    count: 3,
                    effect: WormEffect(
                        dotWidth: 12.0,
                        dotHeight: 12.0,
                        activeDotColor: Color(0xFFF55F89),
                        dotColor: Color(0xFFD8D8D8)), // your preferred effect
                  ),
                  Spacer(),
                  Padding(
                      padding: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Column(mainAxisSize: MainAxisSize.min, children: <
                          Widget>[
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Hello!",
                                textAlign: TextAlign.start,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headline4
                                    .copyWith(fontWeight: FontWeight.w500))),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Welcome to Axiom.",
                                textAlign: TextAlign.start,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 24))),
                        Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: RaisedButton(
                                onPressed: () {},
                                color: Color(0xFFF5F5F5),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4.0))),
                                elevation: 0,
                                highlightElevation: 1,
                                child: Row(children: <Widget>[
                                  SvgPicture.asset(
                                      "./assets/images/google-icon.svg",
                                      semanticsLabel: "Main Image",
                                      width: 17,
                                      height: 17),
                                  Spacer(),
                                  Text("LOGIN WITH GOOGLE",
                                      style:
                                          Theme.of(context).textTheme.button),
                                  Spacer()
                                ]))),
                        StandardRaisedButton(
                            onPressed: () {
                              Navigator.of(context).push(LoginPage.route());
                            },
                            text: "LOGIN WITH EMAIL",
                            icon: Icons.mail),
                        OutlineButton(
                            onPressed: () {
                              Navigator.of(context).push(RegisterPage.route());
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.0))),
                            highlightedBorderColor:
                                Theme.of(context).primaryColor,
                            splashColor: Color(0xFFD7C6F3),
                            highlightColor: Color(0x00FFFFFF),
                            highlightElevation: 0,
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                            child: Row(children: <Widget>[
                              Spacer(),
                              Text("SIGN UP",
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .button),
                              Spacer()
                            ])),
                      ])),
                ]))));
  }
}

/// InformationPage shows the sliding displays
class InformationPage extends StatelessWidget {
  /// imagePath: path to svg, titleText: the big title, subtitleText: smol text
  final String imagePath, titleText, subtitleText;

  /// Default constructor for the Information page
  InformationPage(this.imagePath, this.titleText, this.subtitleText, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 50, bottom: 50),
              child: SvgPicture.asset(imagePath,
                  semanticsLabel: "Main Image", width: 240, height: 160)),
          Padding(
              padding: EdgeInsets.only(top: 0),
              child: Text(titleText,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center)),
          Padding(
              padding: EdgeInsets.only(top: 15, bottom: 15),
              child: Text(subtitleText,
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                      color: Color(0xBC000000), fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center)),
        ]));
  }
}
