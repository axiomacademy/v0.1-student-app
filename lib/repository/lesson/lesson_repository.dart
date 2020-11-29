import 'dart:async';

import 'package:ferry/ferry.dart';

import './gql/lesson_requests.req.gql.dart';
import '../../models/lesson_preview.dart';
import '../../models/subject.dart';
import '../exceptions.dart';
import '../ferry_client.dart';

/// Contains all the GraphQL calls relating to authentication
class LessonRepository {
  GGetLessonPreviewReq _lessonReq;
  final _lessonStreamController = StreamController<List<LessonPreview>>();
  final FerryClient _fclient;

  StreamSubscription _lessonSubscription;

  /// The time period for which lessons have been loaded
  DateTime loadedTimeStart, loadedTimeEnd;

  /// Default Constructor, takes in a ferry client instance
  LessonRepository(FerryClient client, this.loadedTimeStart, this.loadedTimeEnd)
      : _fclient = client {
    // Build the upcoming lessons request
    _lessonReq = GGetLessonPreviewReq((b) => b
      ..requestId = 'LessonReq'
      ..fetchPolicy = FetchPolicy.NoCache
      ..vars.input.startTime = loadedTimeStart
      ..vars.input.endTime = loadedTimeEnd);

    final authClient = _fclient.getAuthClient();
    if (authClient == null) {
      throw UnauthenticatedException;
    }

    _lessonSubscription = authClient.request(_lessonReq).listen((res) {
      if (res.hasErrors) {
        throw GQLServerException(res.graphqlErrors.single.message);
      }

      // Default to returning an empty map so that key lookups don't fail
      final List<LessonPreview> lessonPreviews =
          res.data?.lessons?.map((lessonPreviewRaw) {
        final subject = Subject(lessonPreviewRaw.subject.name.name,
            lessonPreviewRaw.subject.standard.name);
        return LessonPreview(
            lessonPreviewRaw.id,
            subject,
            lessonPreviewRaw.summary,
            lessonPreviewRaw.tutor.id,
            lessonPreviewRaw.tutor.firstName,
            lessonPreviewRaw.tutor.lastName,
            lessonPreviewRaw.tutor.profilePic,
            lessonPreviewRaw.startTime,
            lessonPreviewRaw.endTime);
      });

      _lessonStreamController.add(lessonPreviews);
    });
  }

  /// Initialized to an empty list before any request is made
  Stream<List<LessonPreview>> get lessons async* {
    Future.delayed(Duration(seconds: 1), refreshLessons);
    yield* _lessonStreamController.stream;
  }

  /// Refresh stream
  void refreshLessons() {
    final authClient = _fclient.getAuthClient();
    if (authClient == null) {
      throw UnauthenticatedException;
    }

    authClient.requestController.add(_lessonReq);
  }

  /// Paginate by fetching new lessons
  void fetchAndMergeLessons(DateTime startTime, DateTime endTime) {
    final authClient = _fclient.getAuthClient();
    if (authClient == null) {
      throw UnauthenticatedException;
    }

    // Rebuild request
    _lessonReq = _lessonReq.rebuild(
      (b) => b
        ..vars.input.startTime = startTime
        ..vars.input.endTime = endTime
        ..updateResult = (previous, result) =>
            previous?.rebuild((b) => b..lessons.addAll(result.lessons)) ??
            result,
    );

    authClient.requestController.add(_lessonReq);
  }

  /// Automatically disposes StreamController
  void dispose() {
    _lessonStreamController.close();
    _lessonSubscription.cancel();
  }
}
