// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:axiom/repository/schema/schema.schema.gql.dart' as _i1;
import 'package:axiom/repository/schema/serializers.gql.dart' as _i2;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'auth_mutations.var.gql.g.dart';

abstract class GLoginTutorVars
    implements Built<GLoginTutorVars, GLoginTutorVarsBuilder> {
  GLoginTutorVars._();

  factory GLoginTutorVars([Function(GLoginTutorVarsBuilder b) updates]) =
      _$GLoginTutorVars;

  _i1.GLoginInfo get input;
  static Serializer<GLoginTutorVars> get serializer =>
      _$gLoginTutorVarsSerializer;
  Map<String, dynamic> toJson() =>
      _i2.serializers.serializeWith(GLoginTutorVars.serializer, this);
  static GLoginTutorVars fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GLoginTutorVars.serializer, json);
}
