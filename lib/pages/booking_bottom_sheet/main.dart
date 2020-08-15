import 'package:flutter/material.dart';

import 'choose_session_type.dart';
import 'choose_subject.dart';
import 'choose_subject_level.dart';
import 'choose_time.dart';
import 'choose_tutor.dart';
import 'matching.dart';
import 'success.dart';

class BookingBottomSheet extends StatefulWidget {
  BookingBottomSheet({Key key}) : super(key: key);

  @override
  _BookingBottomSheetState createState() => _BookingBottomSheetState();
}

class _BookingBottomSheetState extends State<BookingBottomSheet> {
  String selected = 'book/type';

  bool selectedScheduled;

  String selectedSubject = "";
  String selectedSubjectLevel = "";
  int step = 0;
  int totalSteps = 2;

  Widget build(BuildContext context) {
    switch (selected) {
      case "book/type":
        return ChooseSessionType(onChoose: (scheduled) {
          setState(() {
            selectedScheduled = scheduled;
            totalSteps = (scheduled) ? 4 : 2;
            step += 1;
            selected = "book/subject";
          });
        });
      case "book/subject":
        return ChooseSubject(
            step: step,
            totalSteps: totalSteps,
            onChoose: (subject) {
              setState(() {
                step += 1;
                selectedSubject = subject;
                selected = "book/subjectlevel";
              });
            });
      case "book/subjectlevel":
        return ChooseSubjectLevel(
            step: step,
            totalSteps: totalSteps,
            onChoose: (subjectLevel) {
              setState(() {
                step += 1;
                selectedSubjectLevel = subjectLevel;
                selected = (selectedScheduled) ? "book/time" : "book/match";
              });
            });
      case "book/time":
        return ChooseTime(
            step: step,
            totalSteps: totalSteps,
            onChoose: (time) {
              setState(() {
                step += 1;
                selected = "book/match";
              });
            });
      case "book/match":
        return Matching(onComplete: (tutors) {
          setState(() {
            selected = (selectedScheduled) ? "book/tutor" : "book/success";
          });
        });
      case "book/tutor":
        return ChooseTutor();
      case "book/success":
        return Success();
      default:
        return Container();
    }
  }
}
