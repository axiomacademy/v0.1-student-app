// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:axiom/repository/auth/gql/auth_mutations.ast.gql.dart' as _i5;
import 'package:axiom/repository/auth/gql/auth_mutations.data.gql.dart' as _i2;
import 'package:axiom/repository/auth/gql/auth_mutations.var.gql.dart' as _i3;
import 'package:axiom/repository/schema/serializers.gql.dart' as _i7;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:uuid/uuid.dart' as _i6;

part 'auth_mutations.req.gql.g.dart';

abstract class GLoginTutorReq
    implements
        Built<GLoginTutorReq, GLoginTutorReqBuilder>,
        _i1.OperationRequest<_i2.GLoginTutorData, _i3.GLoginTutorVars> {
  GLoginTutorReq._();

  factory GLoginTutorReq([Function(GLoginTutorReqBuilder b) updates]) =
      _$GLoginTutorReq;

  static void _initializeBuilder(GLoginTutorReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'LoginTutor')
    ..requestId = _i6.Uuid().v1()
    ..executeOnListen = true;
  _i3.GLoginTutorVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  @nullable
  String get requestId;
  @nullable
  @BuiltValueField(serialize: false)
  _i2.GLoginTutorData Function(_i2.GLoginTutorData, _i2.GLoginTutorData)
      get updateResult;
  @nullable
  _i2.GLoginTutorData get optimisticResponse;
  @nullable
  String get updateCacheHandlerKey;
  @nullable
  Map<String, dynamic> get updateCacheHandlerContext;
  @nullable
  _i1.FetchPolicy get fetchPolicy;
  @nullable
  bool get executeOnListen;
  @override
  _i2.GLoginTutorData parseData(Map<String, dynamic> json) =>
      _i2.GLoginTutorData.fromJson(json);
  static Serializer<GLoginTutorReq> get serializer =>
      _$gLoginTutorReqSerializer;
  Map<String, dynamic> toJson() =>
      _i7.serializers.serializeWith(GLoginTutorReq.serializer, this);
  static GLoginTutorReq fromJson(Map<String, dynamic> json) =>
      _i7.serializers.deserializeWith(GLoginTutorReq.serializer, json);
}
