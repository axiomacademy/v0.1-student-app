import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final double width;
  final double height;
  final bool active;
  final String uri;

  UserAvatar(this.uri,
      {this.width = 50.0, this.height = 50.0, this.active = false, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: (active) ? width + 3.4 : width,
        height: (active) ? height + 3.4 : height,
        child: Container(
            padding: (active) ? EdgeInsets.all(1.4) : null,
            decoration: (active)
                ? BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(13.0)),
                    border: Border.all(
                        color: Theme.of(context).accentColor, width: 2.0))
                : null,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Image.network(
                  uri,
                  fit: BoxFit.cover,
                  width: (active) ? width + 3.4 : width,
                  height: (active) ? height + 3.4 : height,
                ))));
  }
}
