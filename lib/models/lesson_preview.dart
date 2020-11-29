import 'package:equatable/equatable.dart';
import 'subject.dart';

/// Lesson preview model
class LessonPreview extends Equatable {
  /// Standard lesson preview fields
  final String id,
      summary,
      tutorId,
      tutorFirstName,
      tutorLastName,
      tutorProfilePic;

  /// Standard lesson preview fields
  final DateTime startTime, endTime;

  /// Standard lesson preview fields
  final Subject subject;

  /// Default lesson constructor
  const LessonPreview(
      this.id,
      this.subject,
      this.summary,
      this.tutorId,
      this.tutorFirstName,
      this.tutorLastName,
      this.tutorProfilePic,
      this.startTime,
      this.endTime);

  @override
  List<Object> get props => [
        id,
        subject,
        summary,
        tutorId,
        tutorFirstName,
        tutorLastName,
        tutorProfilePic,
        startTime,
        endTime
      ];
}
