part of 'home_bloc.dart';

/// HomeEvent is the abstract class of acceptable home bloc events
abstract class HomeEvent extends Equatable {
  /// Empty const constructor
  const HomeEvent();

  @override
  List<Object> get props => [];
}

/// Event when the Home Status is updated
class HomeLoadingComplete extends HomeEvent {
  /// New Home status
  final List<LessonPreview> lessons;

  /// Takes a new status as a constructor
  const HomeLoadingComplete(this.lessons);

  @override
  List<Object> get props => [lessons];
}

/// Requests for pagination or new data
class HomeLessonsRequested extends HomeEvent {
  /// Starting time of lessons
  final DateTime startTime;

  /// Ending time of lessons
  final DateTime endTime;

  /// Standard constructor
  const HomeLessonsRequested(this.startTime, this.endTime);
}

/// Home refresh requested
class HomeRefreshRequested extends HomeEvent {}
