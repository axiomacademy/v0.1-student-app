import 'package:equatable/equatable.dart';

import 'subject.dart';

/// The tutor model, stores a basic tutor type from GQL endpoint
class Tutor extends Equatable {
  /// Core tutor parameters
  final String id, userName, firstName, lastName, email, profilePic, bio;

  /// Core tutor parametes
  final int hourlyRate, rating;

  /// Core tutor educational qualifications
  final List<String> education;

  /// Core tutor teaching subjects
  final List<Subject> subjects;

  /// Basic immutable const Tutor constructor
  const Tutor(
      this.id,
      this.userName,
      this.firstName,
      this.lastName,
      this.email,
      this.profilePic,
      this.hourlyRate,
      this.bio,
      this.rating,
      this.education,
      this.subjects);

  @override
  List<Object> get props => [
        id,
        userName,
        firstName,
        lastName,
        email,
        profilePic,
        hourlyRate,
        bio,
        rating,
        education,
        subjects
      ];
}
