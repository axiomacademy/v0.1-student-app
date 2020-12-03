import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../bloc/home/home_bloc.dart';
import '../../components/appbar.dart';
import '../../components/avatar.dart';
import '../../components/buttons.dart';
import '../../components/list_items.dart';
import '../../models/lesson_preview.dart';
import '../../repository/ferry_client.dart';
import '../../repository/lesson/lesson_repository.dart';

/// The main home views
class HomeView extends StatefulWidget {
  /// Main constructor
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: RepositoryProvider(
            create: (context) => LessonRepository(
                RepositoryProvider.of<FerryClient>(context),
                DateTime.now().subtract(Duration(days: 40)),
                DateTime.now().add(Duration(days: 7))),
            child: Container(
                padding: EdgeInsets.only(top: 8.0),
                child: BlocProvider(
                  create: (context) => HomeBloc(
                      lessonRepository:
                          RepositoryProvider.of<LessonRepository>(context)),
                  child: ListView(shrinkWrap: true, children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(left: 20.0, right: 10.0),
                        child: AxiomAppBar()),
                    BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                      if (state.status == HomeStatus.loaded) {
                        final lessons = state.lessons ?? [];
                        return _UpcomingLessonsList(lessons
                            .where((lesson) =>
                                lesson.startTime.isAfter(DateTime.now()))
                            .toList());
                      } else {
                        return Container();
                      }
                    }),
                    BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                      if (state.status == HomeStatus.loaded) {
                        final lessons = state.lessons ?? [];
                        return _RecentLessonsList(lessons
                            .where((lesson) =>
                                lesson.startTime.isBefore(DateTime.now()))
                            .toList());
                      } else {
                        return Container();
                      }
                    }),
                  ]),
                ))));
  }
}

///**************** UTILITY WIDGETS ************************************
class _UpcomingLessonsList extends StatelessWidget {
  final List<LessonPreview> lessons;

  _UpcomingLessonsList(this.lessons);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(
                  left: 20.0, right: 10.0, top: 20.0, bottom: 5.0),
              child: Text("Upcoming Sessions",
                  style: Theme.of(context).textTheme.headline6)),
          ...lessons.map((lesson) {
            return _UpcomingListItem(
                active: false,
                readableDate: _readableDate(lesson.startTime),
                readableTime: _readableTime(lesson.startTime, lesson.endTime),
                subject: lesson.subject.name,
                tutorFirstName: lesson.tutorFirstName,
                tutorLastName: lesson.tutorLastName,
                tutorImage: lesson.tutorProfilePic);
          }).toList(),
        ]);
  }

  String _readableDate(DateTime startTime) {
    final timeTo = startTime.difference(DateTime.now());

    if (timeTo.inDays > 0) {
      return "In ${timeTo.inDays} ${timeTo.inDays == 1 ? 'day' : 'days'}";
    } else if (timeTo.inHours > 0) {
      return "In ${timeTo.inHours} ${timeTo.inHours == 1 ? 'hour' : 'hours'}";
    } else if (timeTo.inMinutes > 0) {
      return "In ${timeTo.inMinutes} ${timeTo.inMinutes == 1 ? 'minute' : 'minutes'}";
    } else {
      return "Happening Now";
    }
  }

  String _readableTime(DateTime startTime, DateTime endTime) {
    final startMeridian = (startTime.hour < 12) ? "AM" : "PM";
    final startHour =
        (startTime.hour < 12) ? startTime.hour : startTime.hour - 12;
    final startMin = startTime.minute.toString().padLeft(2, '0');
    ;

    final endMeridian = (endTime.hour < 12) ? "AM" : "PM";
    final endHour = (endTime.hour < 12) ? endTime.hour : endTime.hour - 12;
    final endMin = endTime.minute.toString().padLeft(2, '0');

    // Formats to the readable time (6:00 - 8:00 PM)
    return "${(startHour == 0) ? "12" : startHour}:$startMin ${(startMeridian == endMeridian) ? "" : startMeridian} - ${(endHour == 0) ? "12" : endHour}:$endMin $endMeridian";
  }
}

class _RecentLessonsList extends StatelessWidget {
  final List<LessonPreview> lessons;

  _RecentLessonsList(this.lessons);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(
                  left: 20.0, right: 10.0, top: 20.0, bottom: 5.0),
              child: Text("Recent Sessions",
                  style: Theme.of(context).textTheme.headline6)),
          ...lessons.map((lesson) {
            return SubjectListItem(
                subject: lesson.subject.name,
                date: _readableDate(lesson.startTime),
                duration: _readableDuration(lesson.startTime, lesson.endTime),
                description: lesson.summary);
          }).toList(),
        ]);
  }

  String _readableDuration(DateTime startTime, DateTime endTime) {
    final duration = endTime.difference(startTime);

    if (duration.inDays > 0) {
      return "${duration.inDays} ${duration.inDays == 1 ? 'day' : 'days'}";
    } else if (duration.inHours > 0) {
      return "${duration.inHours} ${duration.inHours == 1 ? 'hour' : 'hours'}";
    } else if (duration.inMinutes > 0) {
      return "${duration.inMinutes} ${duration.inMinutes == 1 ? 'minute' : 'minutes'}";
    } else {
      return "";
    }
  }

  String _readableDate(DateTime startTime) {
    final formatter = DateFormat('dd MMM y');
    return formatter.format(startTime);
  }
}

class _UpcomingListItem extends StatelessWidget {
  final String tutorImage;
  final String subject;

  final String tutorFirstName;
  final String tutorLastName;

  final String readableDate;
  final String readableTime;

  final bool active;

  _UpcomingListItem(
      {@required this.readableDate,
      @required this.readableTime,
      @required this.tutorImage,
      @required this.subject,
      @required this.tutorFirstName,
      @required this.tutorLastName,
      this.active = false,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: Stack(children: <Widget>[
              Row(children: <Widget>[
                UserAvatar(tutorImage, active: active),
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(left: (active) ? 10.0 : 14.0),
                        padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Color(0xFFE0E0E0), width: 1.0))),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                  padding:
                                      EdgeInsets.only(top: 5.0, bottom: 5.0),
                                  child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text(readableDate.toUpperCase(),
                                            style: Theme.of(context)
                                                .accentTextTheme
                                                .overline
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w600)),
                                        Text(
                                            (readableTime != "")
                                                ? " | ${readableTime.toUpperCase()}"
                                                : "",
                                            style: Theme.of(context)
                                                .textTheme
                                                .overline
                                                .copyWith(
                                                    color: Color(0xFF666666),
                                                    fontWeight:
                                                        FontWeight.w500))
                                      ])),
                              Text(
                                  // This formats the subject name to capitalize just the first letter
                                  '${subject[0].toUpperCase()}${subject.substring(1).toLowerCase()}',
                                  style: Theme.of(context).textTheme.subtitle1),
                              Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                  child: Text("$tutorFirstName $tutorLastName",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(color: Color(0xFF666666)))),
                            ]))),
              ]),
              (active)
                  ? Positioned.fill(
                      child: Container(
                          margin: EdgeInsets.only(bottom: 2.0),
                          alignment: Alignment.bottomRight,
                          child: Row(children: <Widget>[
                            Spacer(),
                            StandardFlatButton(
                                onPressed: () {}, text: "Join", icon: Icons.add)
                          ])))
                  : Container(),
            ])));
  }
}
