import 'package:equatable/equatable.dart';

/// The subject model, stores basic subject info
class Subject extends Equatable {
  /// Core subject parameters
  final String name, standard;

  /// Basic immutable const Subject constructor
  const Subject(this.name, this.standard);

  @override
  List<Object> get props => [name, standard];
}
