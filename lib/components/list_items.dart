import 'package:flutter/material.dart';
import 'avatar.dart';

class SubjectListItem extends StatelessWidget {
  final String duration;
  final String date;
  final String subject;
  final String description;

  SubjectListItem(
      {@required this.subject,
      @required this.duration,
      @required this.date,
      @required this.description,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Material(
            child: Ink(
                child: InkWell(
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    splashColor: Color(0xFFF0E8FA),
                    onTap: () {},
                    child: Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Row(children: <Widget>[
                          SubjectAvatar(subject),
                          Expanded(
                              child: Container(
                                  margin: EdgeInsets.only(left: 14.0),
                                  padding:
                                      EdgeInsets.only(top: 10.0, bottom: 12.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Color(0xFFE0E0E0),
                                              width: 1.0))),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top: 5.0, bottom: 5.0),
                                            child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Expanded(
                                                      child: Text(subject,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .subtitle1)),
                                                  Text(duration.toUpperCase(),
                                                      style: Theme.of(context)
                                                          .primaryTextTheme
                                                          .overline
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600)),
                                                  Text(
                                                      " | " +
                                                          date.toUpperCase(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .overline
                                                          .copyWith(
                                                              color: Color(
                                                                  0xFF666666),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500))
                                                ])),
                                        Padding(
                                            padding: EdgeInsets.only(top: 4.0),
                                            child: Text(description,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption
                                                    .copyWith(
                                                        color: Color(
                                                            0xFF666666)))),
                                      ]))),
                        ]))))));
  }
}
