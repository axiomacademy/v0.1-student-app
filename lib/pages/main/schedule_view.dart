import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../bloc/home/home_bloc.dart';
import '../../components/appbar.dart';
import '../../components/list_items.dart';
import '../../models/lesson_preview.dart';
import '../../repository/ferry_client.dart';
import '../../repository/lesson/lesson_repository.dart';

class ScheduleView extends StatefulWidget {
  ScheduleView({Key key}) : super(key: key);

  @override
  _ScheduleViewState createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView>
    with TickerProviderStateMixin {
  DateTime _selectedDay;
  AnimationController _animationController;
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _selectedDay = roundToDay(DateTime.now());

    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            padding: EdgeInsets.only(left: 0.0, right: 0.0, top: 8.0),
            child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
              if (state.status == HomeStatus.loaded) {
                final lessons = state.lessons ?? [];
                final formattedLessons = _formatLessons(lessons);

                final selectedLessons = formattedLessons[_selectedDay] ?? [];

                return ListView(shrinkWrap: true, children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: AxiomAppBar()),
                  _buildTableCalendar(formattedLessons),
                  Divider(),
                  ..._buildEventList(selectedLessons)
                ]);
              } else {
                return Container();
              }
            })));
  }

  ///***************************** CALLBACKS *****************************

  void _onDaySelected(DateTime day, List events) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedDay = roundToDay(day);
    });
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  void _onCalendarCreated(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onCalendarCreated');
  }

  ///*************************** BUILDER UTILITIES *****************************
  Map<DateTime, List<LessonPreview>> _formatLessons(
      List<LessonPreview> lessons) {
    // Sort it to make it easier to cluster
    lessons.sort((l1, l2) => l1.startTime.compareTo(l2.startTime));

    var current = roundToDay(lessons[0].startTime);
    var formattedLessons = {
      current: [
        lessons[0],
      ]
    };

    for (var i = 1; i < lessons.length; i++) {
      if (sameDay(current, lessons[i].startTime)) {
        formattedLessons[current].add(lessons[i]);
      } else {
        current = roundToDay(lessons[i].startTime);
        formattedLessons[current] = [lessons[i]];
      }
    }

    return formattedLessons;
  }

  bool sameDay(DateTime a, DateTime b) {
    return (a.year == b.year) && (a.month == b.month) && (a.day == b.day);
  }

  DateTime roundToDay(DateTime a) {
    final day = Duration(days: 1);
    return DateTime.fromMillisecondsSinceEpoch(a.millisecondsSinceEpoch -
        a.millisecondsSinceEpoch % day.inMilliseconds);
  }

  Widget _buildTableCalendar(Map<DateTime, List<LessonPreview>> lessons) {
    return TableCalendar(
      calendarController: _calendarController,
      events: lessons,
      initialCalendarFormat: CalendarFormat.month,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      availableGestures: AvailableGestures.all,
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        weekendStyle:
            TextStyle().copyWith(color: Theme.of(context).primaryColor),
        holidayStyle:
            TextStyle().copyWith(color: Theme.of(context).primaryColor),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle:
            TextStyle().copyWith(color: Theme.of(context).primaryColor),
      ),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        formatButtonVisible: false,
      ),
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, _) {
          return FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(_animationController),
            child: Container(
              margin: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                  color: Color(0xFFF0E8FA),
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              width: 100,
              height: 100,
              child: Center(
                  child: Text(
                '${date.day}',
                style: TextStyle().copyWith(fontSize: 14.0),
              )),
            ),
          );
        },
        todayDayBuilder: (context, date, _) {
          return Container(
            margin: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
                color: Color(0xFFF1F1F1),
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            width: 100,
            height: 100,
            child: Center(
                child: Text(
              '${date.day}',
              style: TextStyle()
                  .copyWith(fontSize: 14.0, fontWeight: FontWeight.w500),
            )),
          );
        },
        markersBuilder: (context, date, events, holidays) {
          final children = <Widget>[];

          if (events.isNotEmpty) {
            events.forEach(
              (event) => children.add(Container(
                margin: EdgeInsets.all(1.0),
                width: 5,
                height: 5,
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.all(Radius.circular(2.5))),
              )),
            );
          }

          return <Widget>[
            Positioned(bottom: 6.0, child: Row(children: children))
          ];
        },
      ),
      onDaySelected: (date, events, _) {
        _onDaySelected(date, events);
        _animationController.forward(from: 0.0);
      },
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
    );
  }

  List<Widget> _buildEventList(List<LessonPreview> lessons) {
    return lessons
        .map((lesson) => TutorListItem(
            startTime: lesson.startTime,
            endTime: lesson.endTime,
            subject: lesson.subject.name,
            tutorImage: lesson.tutorProfilePic,
            tutorFirstName: lesson.tutorFirstName,
            tutorLastName: lesson.tutorLastName))
        .toList();
  }
}
