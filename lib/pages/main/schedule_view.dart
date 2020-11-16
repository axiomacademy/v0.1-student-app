import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../components/appbar.dart';
import '../../components/avatar.dart';

class ScheduleView extends StatefulWidget {
  ScheduleView({Key key}) : super(key: key);

  @override
  _ScheduleViewState createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView>
    with TickerProviderStateMixin {
  Map<DateTime, List<Map<String, dynamic>>> _events;
  List _selectedEvents;
  AnimationController _animationController;
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();

    _events = {
      _selectedDay.subtract(Duration(days: 30)): [
        {
          "image":
              "https://s3-ap-southeast-1.amazonaws.com/engpeepingmoon/140919054722tiger-shroff.jpg",
          "duration": "2 - 4pm",
          "topic": "Physics",
          "tutorname": "Arvinderjit Singh"
        }
      ],
      _selectedDay.subtract(Duration(days: 27)): [
        {
          "image":
              "https://s3-ap-southeast-1.amazonaws.com/engpeepingmoon/140919054722tiger-shroff.jpg",
          "duration": "1 - 2pm",
          "topic": "Physics",
          "tutorname": "Arvinderjit Singh"
        }
      ],
      _selectedDay.subtract(Duration(days: 20)): [
        {
          "image": "https://s3.envato.com/files/236560326/preview.jpg",
          "duration": "2 - 4pm",
          "topic": "Economics",
          "tutorname": "Jasmine Sylvia"
        },
      ],
      _selectedDay.subtract(Duration(days: 16)): [
        {
          "image":
              "https://s3-ap-southeast-1.amazonaws.com/engpeepingmoon/140919054722tiger-shroff.jpg",
          "duration": "2 - 4pm",
          "topic": "Physics",
          "tutorname": "Arvinderjit Singh"
        },
        {
          "image": "https://s3.envato.com/files/236560326/preview.jpg",
          "duration": "11am - 1pm",
          "topic": "Economics",
          "tutorname": "Jasmine Sylvia"
        },
      ],
      _selectedDay.subtract(Duration(days: 4)): [
        {
          "image":
              "https://s3-ap-southeast-1.amazonaws.com/engpeepingmoon/140919054722tiger-shroff.jpg",
          "duration": "2 - 4pm",
          "topic": "Physics",
          "tutorname": "Arvinderjit Singh"
        },
        {
          "image": "https://s3.envato.com/files/236560326/preview.jpg",
          "duration": "11am - 1pm",
          "topic": "Economics",
          "tutorname": "Jasmine Sylvia"
        },
      ],
      _selectedDay.subtract(Duration(days: 2)): [
        {
          "image": "https://s3.envato.com/files/236560326/preview.jpg",
          "duration": "11am - 1pm",
          "topic": "Economics",
          "tutorname": "Jasmine Sylvia"
        },
      ],
      _selectedDay: [
        {
          "image":
              "https://s3-ap-southeast-1.amazonaws.com/engpeepingmoon/140919054722tiger-shroff.jpg",
          "duration": "2 - 4pm",
          "topic": "Physics",
          "tutorname": "Arvinderjit Singh"
        },
        {
          "image": "https://s3.envato.com/files/236560326/preview.jpg",
          "duration": "11am - 1pm",
          "topic": "Economics",
          "tutorname": "Jasmine Sylvia"
        },
      ],
      _selectedDay.add(Duration(days: 1)): [
        {
          "image":
              "https://s3-ap-southeast-1.amazonaws.com/engpeepingmoon/140919054722tiger-shroff.jpg",
          "duration": "2 - 4pm",
          "topic": "Physics",
          "tutorname": "Arvinderjit Singh"
        },
      ],
      _selectedDay.add(Duration(days: 7)): [
        {
          "image": "https://s3.envato.com/files/236560326/preview.jpg",
          "duration": "11am - 1pm",
          "topic": "Economics",
          "tutorname": "Jasmine Sylvia"
        },
      ],
      _selectedDay.add(Duration(days: 11)): [
        {
          "image":
              "https://s3-ap-southeast-1.amazonaws.com/engpeepingmoon/140919054722tiger-shroff.jpg",
          "duration": "2 - 4pm",
          "topic": "Physics",
          "tutorname": "Arvinderjit Singh"
        },
        {
          "image": "https://s3.envato.com/files/236560326/preview.jpg",
          "duration": "11am - 1pm",
          "topic": "Economics",
          "tutorname": "Jasmine Sylvia"
        },
      ],
      _selectedDay.add(Duration(days: 17)): [
        {
          "image": "https://s3.envato.com/files/236560326/preview.jpg",
          "duration": "11am - 1pm",
          "topic": "Economics",
          "tutorname": "Jasmine Sylvia"
        },
      ],
    };

    _selectedEvents = _events[_selectedDay] ?? [];
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
            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 8.0),
            child: ListView(shrinkWrap: true, children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 10.0), child: AxiomAppBar()),
              _buildTableCalendar(),
              Divider(),
              ..._buildEventList()
            ])));
  }

  ///************************************** CALLBACKS *****************************

  void _onDaySelected(DateTime day, List events) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
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

  ///***************************** BUILDER UTILITIES *****************************
  Widget _buildTableCalendar() {
    return TableCalendar(
      calendarController: _calendarController,
      events: _events,
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

  List<Widget> _buildEventList() {
    return _selectedEvents
        .map((event) => LessonListItem(
            tutorImage: event["image"],
            time: event["duration"],
            subject: event["topic"],
            tutorName: event["tutorname"]))
        .toList();
  }
}

class LessonListItem extends StatelessWidget {
  final String tutorImage;
  final String time;
  final String subject;
  final String tutorName;

  LessonListItem(
      {@required this.time,
      @required this.tutorImage,
      @required this.subject,
      @required this.tutorName,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
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
                    UserAvatar(tutorImage, active: false),
                    Expanded(
                        child: Container(
                            margin: EdgeInsets.only(left: 14.0),
                            padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Color(0xFFE0E0E0), width: 1.0))),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: 5.0, bottom: 5.0),
                                      child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text(time.toUpperCase(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .overline
                                                    .copyWith(
                                                        color:
                                                            Color(0xFF666666),
                                                        fontWeight:
                                                            FontWeight.w500))
                                          ])),
                                  Text(subject,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1),
                                  Padding(
                                      padding: EdgeInsets.only(top: 5.0),
                                      child: Text(tutorName,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2
                                              .copyWith(
                                                  color: Color(0xFF666666)))),
                                ]))),
                  ]),
                ))));
  }
}
