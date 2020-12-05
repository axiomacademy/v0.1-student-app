import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/home/home_bloc.dart';
import '../../components/appbar.dart';
import '../../components/list_items.dart';
import '../../models/lesson_preview.dart';
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
        child: Container(
      padding: EdgeInsets.only(top: 8.0),
      child: ListView(shrinkWrap: true, children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 20.0, right: 10.0),
            child: AxiomAppBar()),
        BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          if (state.status == HomeStatus.loaded) {
            final lessons = state.lessons ?? [];
            return _UpcomingLessonsList(lessons
                .where((lesson) => lesson.startTime.isAfter(DateTime.now()))
                .toList());
          } else {
            return Container();
          }
        }),
        BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          if (state.status == HomeStatus.loaded) {
            final lessons = state.lessons ?? [];
            return _RecentLessonsList(lessons
                .where((lesson) => lesson.startTime.isBefore(DateTime.now()))
                .toList());
          } else {
            return Container();
          }
        }),
      ]),
    ));
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
            return TutorListItem(
                active: false,
                showTimeTo: true,
                startTime: lesson.startTime,
                endTime: lesson.endTime,
                subject: lesson.subject.name,
                tutorFirstName: lesson.tutorFirstName,
                tutorLastName: lesson.tutorLastName,
                tutorImage: lesson.tutorProfilePic);
          }).toList(),
        ]);
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
                startTime: lesson.startTime,
                endTime: lesson.endTime,
                summary: lesson.summary);
          }).toList(),
        ]);
  }
}
