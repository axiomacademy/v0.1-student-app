import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/// Raised button with text and icon
class StandardRaisedButton extends StatelessWidget {
  /// Callback on pressed
  final VoidCallback onPressed;

  /// The main buttom text
  final String text;

  /// Main button icon
  final IconData icon;

  /// Whether the button is displaying a loading indicator
  final bool loading;

  /// Standard IconRaisedButton constructor
  StandardRaisedButton(
      {@required this.onPressed,
      @required this.text,
      this.icon,
      this.loading = false,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: onPressed,
        color: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0))),
        elevation: 1,
        highlightColor: Color(0x00FFFFFF),
        splashColor: Color(0xFF8E58DF),
        highlightElevation: 3,
        child: Row(children: <Widget>[
          (icon != null && !loading)
              ? Icon(
                  icon,
                  color: Colors.white,
                  size: 17.0,
                )
              : Container(),
          Spacer(),
          (!loading)
              ? Text(text.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(color: Colors.white))
              : SpinKitThreeBounce(color: Colors.white, size: 20),
          Spacer()
        ]));
  }
}

/// Standard Flat Button
class StandardFlatButton extends StatelessWidget {
  /// Callback on pressed
  final VoidCallback onPressed;

  /// The main buttom text
  final String text;

  /// Main button icon
  final IconData icon;

  /// Whether the button is displaying a loading indicator
  final bool loading;

  /// Default constructor for flat button
  StandardFlatButton(
      {@required this.onPressed,
      @required this.text,
      this.icon,
      this.loading = false,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        padding: EdgeInsets.all(10.0), //adds padding inside the button
        materialTapTargetSize: MaterialTapTargetSize
            .shrinkWrap, //limits the touch area to the button area
        minWidth: 0, //wraps child's width
        height: 0, //wraps child's height
        child: FlatButton(
          onPressed: onPressed,
          splashColor: Color(0xFFD7C6F3),
          highlightColor: Color(0xFFF0E8FA),
          child: Row(children: <Widget>[
            (icon != null && !loading)
                ? Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: Icon(icon, color: Theme.of(context).primaryColor))
                : Container(),
            (!loading)
                ? Text(
                    text.toUpperCase(),
                    style: Theme.of(context)
                        .primaryTextTheme
                        .button
                        .copyWith(fontWeight: FontWeight.w600),
                  )
                : SpinKitThreeBounce(
                    color: Theme.of(context).primaryColor, size: 20)
          ]),
        ));
  }
}
