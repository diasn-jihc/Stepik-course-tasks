// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Character _$CharacterFromJson(Map<String, dynamic> json) => _Character(
  info: Info.fromJson(json['info'] as Map<String, dynamic>),
  results: (json['results'] as List<dynamic>)
      .map((e) => Results.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CharacterToJson(_Character instance) =>
    <String, dynamic>{'info': instance.info, 'results': instance.results};

_Info _$InfoFromJson(Map<String, dynamic> json) => _Info(
  count: (json['count'] as num).toInt(),
  pages: (json['pages'] as num).toInt(),
  next: json['next'] as String?,
  prev: json['prev'] as String?,
);

Map<String, dynamic> _$InfoToJson(_Info instance) => <String, dynamic>{
  'count': instance.count,
  'pages': instance.pages,
  'next': instance.next,
  'prev': instance.prev,
};

_Results _$ResultsFromJson(Map<String, dynamic> json) => _Results(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  status: json['status'] as String,
  species: json['species'] as String,
  gender: json['gender'] as String,
  image: json['image'] as String,
);

Map<String, dynamic> _$ResultsToJson(_Results instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'status': instance.status,
  'species': instance.species,
  'gender': instance.gender,
  'image': instance.image,
};
