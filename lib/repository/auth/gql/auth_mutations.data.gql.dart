// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:axiom/repository/schema/serializers.gql.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'auth_mutations.data.gql.g.dart';

abstract class GLoginTutorData
    implements Built<GLoginTutorData, GLoginTutorDataBuilder> {
  GLoginTutorData._();

  factory GLoginTutorData([Function(GLoginTutorDataBuilder b) updates]) =
      _$GLoginTutorData;

  static void _initializeBuilder(GLoginTutorDataBuilder b) =>
      b..G__typename = 'Mutation';
  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get loginTutor;
  static Serializer<GLoginTutorData> get serializer =>
      _$gLoginTutorDataSerializer;
  Map<String, dynamic> toJson() =>
      _i1.serializers.serializeWith(GLoginTutorData.serializer, this);
  static GLoginTutorData fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GLoginTutorData.serializer, json);
}
