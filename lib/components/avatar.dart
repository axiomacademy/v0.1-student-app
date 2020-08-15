import 'package:flutter/material.dart';

final subjectInfoMap = {
  "physics": ["PH", Color(0xFFF896B6), Color(0xFFFF82AB)],
  "economics": ["EC", Color(0xFF70E39F), Color(0xFF24BE64)],
  "mathematics": ["MA", Color(0xFF96B8F8), Color(0xFF568FFA)],
  "chemistry": ["CM", Color(0xFFE2AA6E), Color(0xFFDF8B31)]
};

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

class SubjectAvatar extends StatelessWidget {
  final double width, height;
  final String subject;

  SubjectAvatar(this.subject, {this.width = 50.0, this.height = 50.0, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(width / 5)),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      subjectInfoMap[subject.toLowerCase()][1],
                      subjectInfoMap[subject.toLowerCase()][2]
                    ])),
            child: Center(
                child: Text(subjectInfoMap[subject.toLowerCase()][0],
                    style: Theme.of(context)
                        .textTheme
                        .button
                        .copyWith(color: Colors.white, fontSize: 10)))));
  }
}
