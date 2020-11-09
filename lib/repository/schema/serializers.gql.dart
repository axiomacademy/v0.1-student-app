import 'package:axiom/repository/auth/gql/auth_mutations.data.gql.dart'
    show GLoginTutorData;
import 'package:axiom/repository/auth/gql/auth_mutations.req.gql.dart'
    show GLoginTutorReq;
import 'package:axiom/repository/auth/gql/auth_mutations.var.gql.dart'
    show GLoginTutorVars;
import 'package:axiom/repository/schema/schema.schema.gql.dart'
    show
        GHeartbeatStatus,
        GLoginInfo,
        GMessageRange,
        GNewStudent,
        GNewSubject,
        GNewTutor,
        GOnDemandMatchRequest,
        GScheduledMatchParameters,
        GScheduledMatchRequest,
        GSendMessage,
        GSubjectName,
        GSubjectStandard,
        GTime,
        GTimeRangeRequest,
        GUpdateNotification;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:gql_code_builder/src/serializers/operation_serializer.dart'
    show OperationSerializer;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder = _$serializers.toBuilder()
  ..add(OperationSerializer())
  ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GHeartbeatStatus,
  GLoginInfo,
  GLoginTutorData,
  GLoginTutorReq,
  GLoginTutorVars,
  GMessageRange,
  GNewStudent,
  GNewSubject,
  GNewTutor,
  GOnDemandMatchRequest,
  GScheduledMatchParameters,
  GScheduledMatchRequest,
  GSendMessage,
  GSubjectName,
  GSubjectStandard,
  GTime,
  GTimeRangeRequest,
  GUpdateNotification
])
final Serializers serializers = _serializersBuilder.build();
