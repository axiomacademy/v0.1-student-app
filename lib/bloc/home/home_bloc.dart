import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/lesson_preview.dart';
import '../../repository/lesson/lesson_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

/// Home bloc controls the state of the home page
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  /// Stores the lesson repository instance
  final LessonRepository _lessonRepository;

  /// Stores the lesson subscription from the lesson repository
  StreamSubscription<List<LessonPreview>> _lessonSubscription;

  /// Previous cached lesson previews
  List<LessonPreview> lessonsCache;

  /// COnstructor for the home block
  HomeBloc({@required LessonRepository lessonRepository})
      : _lessonRepository = lessonRepository,
        super(const HomeState.initial()) {
    _lessonSubscription = _lessonRepository.lessons
        .listen((lessons) => add(HomeLoadingComplete(lessons)));
  }

  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeLoadingComplete) {
      print("HOME LOADING COMPLETE");
      lessonsCache = event.lessons;
      yield HomeState.loaded(event.lessons);
    } else if (event is HomeRefreshRequested) {
      _lessonRepository.refreshDefaultLessons();
      yield HomeState.loading(lessonsCache);
    } else if (event is HomeLessonsRequested) {
      _lessonRepository.fetchLessons(event.startTime, event.endTime);
      yield HomeState.loading(lessonsCache);
    }
  }

  @override
  Future<void> close() {
    _lessonSubscription?.cancel();
    _lessonRepository.dispose();
    return super.close();
  }
}
