import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/appbar.dart';
import '../../components/avatar.dart';
import '../../components/buttons.dart';
import '../../components/list_items.dart';
import '../../models/lesson_preview.dart';

import '../../repository/ferry_client.dart';
import '../../repository/lesson/lesson_repository.dart';

import '../../bloc/home/home_bloc.dart';

class HomeView extends StatefulWidget {
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
                context.read<FerryClient>(),
                DateTime.now().subtract(Duration(days: 30)),
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
                      return _UpcomingLessonList([]);
                    }),
                    _RecentLessonsList()
                  ]),
                ))));
  }
}

///**************** UTILITY WIDGETS ************************************
/*class _UpcomingLessonList extends StatefulWidget {
  _UpcomingLessonList({Key key}) : super(key: key);

  @override
  _UpcomingLessonListState createState() => _UpcomingLessonListState();
}*/

class _UpcomingLessonList extends StatelessWidget {
  final List<LessonPreview> lessons;

  _UpcomingLessonList(this.lessons) {
    print(lessons);
  }

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
          _UpcomingListItem(
              active: true,
              readableDate: "Happening now",
              readableTime: "",
              subject: "Physics",
              tutorName: "Arvinderjit Singh",
              tutorImage:
                  "https://s3-ap-southeast-1.amazonaws.com/engpeepingmoon/140919054722tiger-shroff.jpg"),
          _UpcomingListItem(
              readableDate: "In 2 days",
              readableTime: "10 - 11AM",
              subject: "Economics",
              tutorName: "Jasmine Sylvia",
              tutorImage: "https://s3.envato.com/files/236560326/preview.jpg"),
        ]);
  }
}

class _RecentLessonsList extends StatelessWidget {
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
          SubjectListItem(
              subject: "Physics",
              date: "26 June 2020",
              duration: "15 mins",
              description:
                  "Went through the basics of circular motion and summarised concepts on pressure"),
          SubjectListItem(
              subject: "Mathematics",
              date: "25 June 2020",
              duration: "2 hours",
              description:
                  "Discussing and summarizing pre-calculus, touching on limits"),
          SubjectListItem(
              subject: "Economics",
              date: "20 June 2020",
              duration: "1 hour",
              description:
                  "Taught supply-demand curves, price inelasticity and other key concepts"),
          SubjectListItem(
              subject: "Chemistry",
              date: "20 June 2020",
              duration: "2 hours",
              description: "Exam revision and prep-work"),
          SubjectListItem(
              subject: "Physics",
              date: "14 June 2020",
              duration: "2 hours",
              description: "Went through specific gravity, bouyancy concepts"),
        ]);
  }
}

class _UpcomingListItem extends StatelessWidget {
  final String tutorImage;
  final String readableDate;
  final String readableTime;
  final String subject;
  final String tutorName;
  final bool active;

  _UpcomingListItem(
      {@required this.readableDate,
      @required this.readableTime,
      @required this.tutorImage,
      @required this.subject,
      @required this.tutorName,
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
                              Text(subject,
                                  style: Theme.of(context).textTheme.subtitle1),
                              Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                  child: Text(tutorName,
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
