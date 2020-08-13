import 'package:flutter/material.dart';

import 'choose_session_type.dart';
import 'choose_subject.dart';
import 'choose_subject_level.dart';
import 'choose_time.dart';
import 'matching.dart';

class BookingBottomSheet extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
        initialRoute: "book/type",
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case "book/type":
              builder = (BuildContext _) => ChooseSessionType();
              break;
            case "book/subject":
              builder = (BuildContext _) => ChooseSubject();
              break;
            case "book/subjectlevel":
              builder = (BuildContext _) => ChooseSubjectLevel();
              break;
            case "book/time":
              builder = (BuildContext _) => ChooseTime();
              break;
            case "book/match":
              builder = (BuildContext _) => Matching();
              break;
            default:
              throw Exception('Invalid route: ${settings.name}');
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        });
  }
}
