// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterStateLoading _$CharacterStateLoadingFromJson(
  Map<String, dynamic> json,
) => CharacterStateLoading($type: json['runtimeType'] as String?);

Map<String, dynamic> _$CharacterStateLoadingToJson(
  CharacterStateLoading instance,
) => <String, dynamic>{'runtimeType': instance.$type};

CharacterStateLoaded _$CharacterStateLoadedFromJson(
  Map<String, dynamic> json,
) => CharacterStateLoaded(
  characterLoaded: Character.fromJson(
    json['characterLoaded'] as Map<String, dynamic>,
  ),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$CharacterStateLoadedToJson(
  CharacterStateLoaded instance,
) => <String, dynamic>{
  'characterLoaded': instance.characterLoaded,
  'runtimeType': instance.$type,
};

CharacterStateError _$CharacterStateErrorFromJson(Map<String, dynamic> json) =>
    CharacterStateError($type: json['runtimeType'] as String?);

Map<String, dynamic> _$CharacterStateErrorToJson(
  CharacterStateError instance,
) => <String, dynamic>{'runtimeType': instance.$type};
