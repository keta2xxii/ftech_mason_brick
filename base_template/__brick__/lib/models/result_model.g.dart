// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      data: json['data'],
      code: json['code'] as int,
      developerMessage: json['developerMessage'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'code': instance.code,
      'developerMessage': instance.developerMessage,
    };
