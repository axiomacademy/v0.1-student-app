import 'package:flutter/material.dart';

class IconRaisedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final IconData icon;

  IconRaisedButton(
      {@required this.onPressed,
      @required this.text,
      @required this.icon,
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
          Icon(
            icon,
            color: Colors.white,
            size: 17.0,
          ),
          Spacer(),
          Text(text.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .button
                  .copyWith(color: Colors.white)),
          Spacer()
        ]));
  }
}

class TextFlatButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  TextFlatButton({@required this.onPressed, @required this.text, Key key})
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
          child: Text(
            text.toUpperCase(),
            style: Theme.of(context)
                .primaryTextTheme
                .button
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ));
  }
}
