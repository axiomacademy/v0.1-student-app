import 'dart:async';

import 'package:ferry/ferry.dart';

import './gql/lesson_requests.req.gql.dart';
import '../../models/lesson_preview.dart';
import '../../models/subject.dart';
import '../exceptions.dart';
import '../ferry_client.dart';

/// Contains all the GraphQL calls relating to authentication
class LessonRepository {
  final _lessonStreamController = StreamController<List<LessonPreview>>();
  final FerryClient _fclient;

  /// Stores the lesson cache
  OrderedList<String, LessonPreview> cacheLessons = OrderedList();

  /// First time to pull, usually centered around today
  DateTime defaultStartTime, defaultEndTime;

  /// Default Constructor, takes in a ferry client instance
  LessonRepository(
      FerryClient client, this.defaultStartTime, this.defaultEndTime)
      : _fclient = client {
    fetchLessons(defaultStartTime, defaultEndTime);
  }

  /// Will fetch the lessons and merge into the cache
  void fetchLessons(DateTime startTime, DateTime endTime) async {
    print("FETCH: $startTime - $endTime");
    // Build the upcoming lessons request
    final lessonReq = GGetLessonPreviewReq((b) => b
      ..fetchPolicy = FetchPolicy.NoCache
      ..vars.input.startTime = startTime
      ..vars.input.endTime = endTime);

    final authClient = _fclient.getAuthClient();
    if (authClient == null) {
      throw UnauthenticatedException;
    }

    await for (final res in authClient.request(lessonReq)) {
      if (res.hasErrors) {
        print(res.graphqlErrors.single.message);
        throw GQLServerException(res.graphqlErrors.single.message);
      }

      // Default to returning an empty map so that key lookups don't fail
      // Retrieve list
      final rawLessons = res.data?.lessons;

      print("FETCHED ${rawLessons.length} lessons");

      for (var rawLesson in rawLessons) {
        final subject = Subject(
            rawLesson.subject.name.name, rawLesson.subject.standard.name);
        final lesson = LessonPreview(
            rawLesson.id,
            subject,
            rawLesson.summary,
            rawLesson.tutor.id,
            rawLesson.tutor.firstName,
            rawLesson.tutor.lastName,
            rawLesson.tutor.profilePic,
            rawLesson.startTime,
            rawLesson.endTime);

        mergeLessonIntoCache(lesson);
      }

      _lessonStreamController.add(cacheLessons.getAll());
      return;
    }
  }

  /// Update the pulled cache
  void mergeLessonIntoCache(LessonPreview lesson) =>
      cacheLessons.setByKey(lesson.id, lesson);

  /// Get the default lessons
  void refreshDefaultLessons() =>
      fetchLessons(defaultStartTime, defaultEndTime);

  /// Initialized to an empty list before any request is made
  Stream<List<LessonPreview>> get lessons async* {
    Future.delayed(Duration(seconds: 1),
        () => _lessonStreamController.add(cacheLessons.getAll()));
    yield* _lessonStreamController.stream;
  }

  /// Automatically disposes StreamController
  void dispose() {
    _lessonStreamController.close();
  }
}

/// Simple ordered list wrapper
class OrderedList<K, V> {
  /// Contains the actual value elements
  List<V> list = [];

  /// Contains mapping from key to list index
  Map<K, int> order = {};

  /// Sets the elements by key
  void setByKey(K key, V value) {
    if (order.containsKey(key)) {
      final index = order[key];
      list[index] = value;
    } else {
      list.add(value);
      order[key] = list.length - 1;
    }
  }

  /// Returned a cloned list
  List<V> getAll() => List.from(list);
}
