import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../bloc/home/home_bloc.dart';
import '../../components/appbar.dart';
import '../../components/list_items.dart';
import '../../models/lesson_preview.dart';

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
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state.status == HomeStatus.loaded) {
        final lessons = state.lessons ?? [];
        final upcomingLessons = lessons
            .where((lesson) => lesson.startTime.isAfter(DateTime.now()))
            .toList();
        final recentLessons = lessons
            .where((lesson) => lesson.startTime.isBefore(DateTime.now()))
            .toList();

        recentLessons.sort(
            (first, second) => -first.startTime.compareTo(second.startTime));

        return SafeArea(
            child: Container(
                padding: EdgeInsets.only(top: 8.0),
                child: CustomScrollView(shrinkWrap: true, slivers: <Widget>[
                  SliverToBoxAdapter(
                      child: Container(
                          padding: EdgeInsets.only(left: 20.0, right: 10.0),
                          child: AxiomAppBar())),
                  (lessons.isEmpty)
                      ? _Onboarding()
                      : SliverList(
                          delegate: SliverChildListDelegate(<Widget>[
                          _UpcomingLessonsList(upcomingLessons),
                          _RecentLessonsList(recentLessons),
                        ]))
                ])));
      } else {
        return Container();
      }
    });
  }
}

///**************** UTILITY WIDGETS ************************************
class _UpcomingLessonsList extends StatelessWidget {
  final List<LessonPreview> lessons;

  _UpcomingLessonsList(this.lessons);

  @override
  Widget build(BuildContext context) {
    return (lessons.isEmpty)
        ? _LessonsEmpty(
            "./assets/images/no-upcoming.svg",
            "No Upcoming Sessions",
            "Book a new lesson and it will show up here")
        : Container(
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(left: 20.0, bottom: 5.0),
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
                ]));
  }
}

class _RecentLessonsList extends StatelessWidget {
  final List<LessonPreview> lessons;

  _RecentLessonsList(this.lessons);

  @override
  Widget build(BuildContext context) {
    return (lessons.isEmpty)
        ? _LessonsEmpty("./assets/images/no-recents.svg", "No Recent Sessions",
            "Let's complete some sessions and start learning!", imageWidth: 100)
        : Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                Container(
                    padding: EdgeInsets.only(left: 20.0, bottom: 5.0),
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

class _LessonsEmpty extends StatelessWidget {
  final String picturePath;
  final String title;
  final String description;
  final double imageWidth;

  _LessonsEmpty(this.picturePath, this.title, this.description,
      {this.imageWidth = 75});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: 200,
            height: 250,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(picturePath,
                      semanticsLabel: "Filler image", width: imageWidth),
                  Padding(
                      padding: EdgeInsets.only(top: 20.0, bottom: 5.0),
                      child: Text(title,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              .copyWith(fontWeight: FontWeight.w500))),
                  Text(description,
                      style: Theme.of(context).textTheme.bodyText2,
                      textAlign: TextAlign.center),
                ])));
  }
}

class _Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
        child: Center(
            child: Container(
                width: 250,
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset("./assets/images/rocket.svg",
                          semanticsLabel: "Rocket", width: 175),
                      Container(
                          padding: EdgeInsets.only(top: 15.0, bottom: 5.0),
                          child: Text("Ready for launch!",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black))),
                      Text(
                          "Zoom zoom, book a lesson and find a tutor to get up to speed.",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              .copyWith(color: Colors.grey[600])),
                    ]))));
  }
}
