import 'package:equatable/equatable.dart';

/// The student model, stores a basic user type from GQL endpoint
class Student extends Equatable {
  /// Core student parameters
  final String id, userName, firstName, lastName, email, profilePic;

  /// Basic immutable const Student constructor
  const Student(this.id, this.userName, this.firstName, this.lastName,
      this.email, this.profilePic);

  @override
  List<Object> get props =>
      [id, userName, firstName, lastName, email, profilePic];
}
