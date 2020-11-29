part of 'home_bloc.dart';

/// Status of the home page
enum HomeStatus {
  /// State where the home page is loading first time
  initial,

  /// State where the lesson data is fully loaded
  loaded,

  /// State where the lesson data is being refreshed
  loading,

  /// State where there is some error loading data
  error
}

/// HomeState represents the bloc state of the HomeView
class HomeState extends Equatable {
  /// The list of lessons pulled
  final List<LessonPreview> lessons;

  /// Current home page status
  final HomeStatus status;

  const HomeState._({this.status = HomeStatus.initial, this.lessons});

  /// Initial State
  const HomeState.initial() : this._();

  /// Loaded State
  const HomeState.loaded(List<LessonPreview> lessons)
      : this._(status: HomeStatus.loaded, lessons: lessons);

  /// Loading fresh data (paginating)
  const HomeState.loading(List<LessonPreview> lessons)
      : this._(status: HomeStatus.loading, lessons: lessons);

  /// Error state
  const HomeState.error() : this._(status: HomeStatus.error);

  @override
  List<Object> get props => [status, lessons];
}
