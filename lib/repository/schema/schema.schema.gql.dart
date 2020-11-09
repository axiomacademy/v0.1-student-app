// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:axiom/repository/schema/serializers.gql.dart' as _i2;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:gql_code_builder/src/serializers/default_scalar_serializer.dart'
    as _i1;

part 'schema.schema.gql.g.dart';

abstract class GTime implements Built<GTime, GTimeBuilder> {
  GTime._();

  factory GTime([String value]) =>
      _$GTime((b) => value != null ? (b..value = value) : b);

  String get value;
  @BuiltValueSerializer(custom: true)
  static Serializer<GTime> get serializer => _i1.DefaultScalarSerializer<GTime>(
      (Object serialized) => GTime(serialized));
}

class GHeartbeatStatus extends EnumClass {
  const GHeartbeatStatus._(String name) : super(name);

  static const GHeartbeatStatus AVAILABLE = _$gHeartbeatStatusAVAILABLE;

  static const GHeartbeatStatus UNAVAILABLE = _$gHeartbeatStatusUNAVAILABLE;

  static Serializer<GHeartbeatStatus> get serializer =>
      _$gHeartbeatStatusSerializer;
  static BuiltSet<GHeartbeatStatus> get values => _$gHeartbeatStatusValues;
  static GHeartbeatStatus valueOf(String name) =>
      _$gHeartbeatStatusValueOf(name);
}

class GSubjectName extends EnumClass {
  const GSubjectName._(String name) : super(name);

  static const GSubjectName PHYSICS = _$gSubjectNamePHYSICS;

  static const GSubjectName ECONOMICS = _$gSubjectNameECONOMICS;

  static const GSubjectName MATHEMATICS = _$gSubjectNameMATHEMATICS;

  static const GSubjectName CHEMISTRY = _$gSubjectNameCHEMISTRY;

  static const GSubjectName BIOLOGY = _$gSubjectNameBIOLOGY;

  static Serializer<GSubjectName> get serializer => _$gSubjectNameSerializer;
  static BuiltSet<GSubjectName> get values => _$gSubjectNameValues;
  static GSubjectName valueOf(String name) => _$gSubjectNameValueOf(name);
}

class GSubjectStandard extends EnumClass {
  const GSubjectStandard._(String name) : super(name);

  static const GSubjectStandard ALEVELS = _$gSubjectStandardALEVELS;

  static const GSubjectStandard OLEVELS = _$gSubjectStandardOLEVELS;

  static const GSubjectStandard IB = _$gSubjectStandardIB;

  static Serializer<GSubjectStandard> get serializer =>
      _$gSubjectStandardSerializer;
  static BuiltSet<GSubjectStandard> get values => _$gSubjectStandardValues;
  static GSubjectStandard valueOf(String name) =>
      _$gSubjectStandardValueOf(name);
}

abstract class GNewSubject implements Built<GNewSubject, GNewSubjectBuilder> {
  GNewSubject._();

  factory GNewSubject([Function(GNewSubjectBuilder b) updates]) = _$GNewSubject;

  GSubjectName get name;
  GSubjectStandard get standard;
  static Serializer<GNewSubject> get serializer => _$gNewSubjectSerializer;
  Map<String, dynamic> toJson() =>
      _i2.serializers.serializeWith(GNewSubject.serializer, this);
  static GNewSubject fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GNewSubject.serializer, json);
}

abstract class GNewStudent implements Built<GNewStudent, GNewStudentBuilder> {
  GNewStudent._();

  factory GNewStudent([Function(GNewStudentBuilder b) updates]) = _$GNewStudent;

  String get username;
  String get firstName;
  String get lastName;
  String get email;
  String get password;
  String get profilePic;
  static Serializer<GNewStudent> get serializer => _$gNewStudentSerializer;
  Map<String, dynamic> toJson() =>
      _i2.serializers.serializeWith(GNewStudent.serializer, this);
  static GNewStudent fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GNewStudent.serializer, json);
}

abstract class GNewTutor implements Built<GNewTutor, GNewTutorBuilder> {
  GNewTutor._();

  factory GNewTutor([Function(GNewTutorBuilder b) updates]) = _$GNewTutor;

  String get username;
  String get firstName;
  String get lastName;
  String get email;
  String get password;
  String get profilePic;
  int get hourlyRate;
  String get bio;
  BuiltList<String> get education;
  BuiltList<GNewSubject> get subjects;
  static Serializer<GNewTutor> get serializer => _$gNewTutorSerializer;
  Map<String, dynamic> toJson() =>
      _i2.serializers.serializeWith(GNewTutor.serializer, this);
  static GNewTutor fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GNewTutor.serializer, json);
}

abstract class GLoginInfo implements Built<GLoginInfo, GLoginInfoBuilder> {
  GLoginInfo._();

  factory GLoginInfo([Function(GLoginInfoBuilder b) updates]) = _$GLoginInfo;

  String get username;
  String get password;
  static Serializer<GLoginInfo> get serializer => _$gLoginInfoSerializer;
  Map<String, dynamic> toJson() =>
      _i2.serializers.serializeWith(GLoginInfo.serializer, this);
  static GLoginInfo fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GLoginInfo.serializer, json);
}

abstract class GSendMessage
    implements Built<GSendMessage, GSendMessageBuilder> {
  GSendMessage._();

  factory GSendMessage([Function(GSendMessageBuilder b) updates]) =
      _$GSendMessage;

  String get to;
  String get message;
  static Serializer<GSendMessage> get serializer => _$gSendMessageSerializer;
  Map<String, dynamic> toJson() =>
      _i2.serializers.serializeWith(GSendMessage.serializer, this);
  static GSendMessage fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GSendMessage.serializer, json);
}

abstract class GMessageRange
    implements Built<GMessageRange, GMessageRangeBuilder> {
  GMessageRange._();

  factory GMessageRange([Function(GMessageRangeBuilder b) updates]) =
      _$GMessageRange;

  String get to;
  @nullable
  GTime get start;
  @nullable
  GTime get end;
  static Serializer<GMessageRange> get serializer => _$gMessageRangeSerializer;
  Map<String, dynamic> toJson() =>
      _i2.serializers.serializeWith(GMessageRange.serializer, this);
  static GMessageRange fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GMessageRange.serializer, json);
}

abstract class GUpdateNotification
    implements Built<GUpdateNotification, GUpdateNotificationBuilder> {
  GUpdateNotification._();

  factory GUpdateNotification(
      [Function(GUpdateNotificationBuilder b) updates]) = _$GUpdateNotification;

  String get id;
  bool get read;
  static Serializer<GUpdateNotification> get serializer =>
      _$gUpdateNotificationSerializer;
  Map<String, dynamic> toJson() =>
      _i2.serializers.serializeWith(GUpdateNotification.serializer, this);
  static GUpdateNotification fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GUpdateNotification.serializer, json);
}

abstract class GOnDemandMatchRequest
    implements Built<GOnDemandMatchRequest, GOnDemandMatchRequestBuilder> {
  GOnDemandMatchRequest._();

  factory GOnDemandMatchRequest(
          [Function(GOnDemandMatchRequestBuilder b) updates]) =
      _$GOnDemandMatchRequest;

  GNewSubject get subject;
  static Serializer<GOnDemandMatchRequest> get serializer =>
      _$gOnDemandMatchRequestSerializer;
  Map<String, dynamic> toJson() =>
      _i2.serializers.serializeWith(GOnDemandMatchRequest.serializer, this);
  static GOnDemandMatchRequest fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GOnDemandMatchRequest.serializer, json);
}

abstract class GScheduledMatchParameters
    implements
        Built<GScheduledMatchParameters, GScheduledMatchParametersBuilder> {
  GScheduledMatchParameters._();

  factory GScheduledMatchParameters(
          [Function(GScheduledMatchParametersBuilder b) updates]) =
      _$GScheduledMatchParameters;

  GNewSubject get subject;
  GTimeRangeRequest get time;
  static Serializer<GScheduledMatchParameters> get serializer =>
      _$gScheduledMatchParametersSerializer;
  Map<String, dynamic> toJson() =>
      _i2.serializers.serializeWith(GScheduledMatchParameters.serializer, this);
  static GScheduledMatchParameters fromJson(Map<String, dynamic> json) =>
      _i2.serializers
          .deserializeWith(GScheduledMatchParameters.serializer, json);
}

abstract class GScheduledMatchRequest
    implements Built<GScheduledMatchRequest, GScheduledMatchRequestBuilder> {
  GScheduledMatchRequest._();

  factory GScheduledMatchRequest(
          [Function(GScheduledMatchRequestBuilder b) updates]) =
      _$GScheduledMatchRequest;

  String get tutor;
  GNewSubject get subject;
  GTimeRangeRequest get time;
  static Serializer<GScheduledMatchRequest> get serializer =>
      _$gScheduledMatchRequestSerializer;
  Map<String, dynamic> toJson() =>
      _i2.serializers.serializeWith(GScheduledMatchRequest.serializer, this);
  static GScheduledMatchRequest fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GScheduledMatchRequest.serializer, json);
}

abstract class GTimeRangeRequest
    implements Built<GTimeRangeRequest, GTimeRangeRequestBuilder> {
  GTimeRangeRequest._();

  factory GTimeRangeRequest([Function(GTimeRangeRequestBuilder b) updates]) =
      _$GTimeRangeRequest;

  GTime get startTime;
  GTime get endTime;
  static Serializer<GTimeRangeRequest> get serializer =>
      _$gTimeRangeRequestSerializer;
  Map<String, dynamic> toJson() =>
      _i2.serializers.serializeWith(GTimeRangeRequest.serializer, this);
  static GTimeRangeRequest fromJson(Map<String, dynamic> json) =>
      _i2.serializers.deserializeWith(GTimeRangeRequest.serializer, json);
}
