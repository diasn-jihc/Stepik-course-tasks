import 'package:course_13_full/feature/data/models/location_model.dart';
import 'package:course_13_full/feature/domain/entities/person_entity.dart';

class PersonModel extends PersonEntity {
  const PersonModel({
    required int id,
    required String name,
    required String status,
    required String species,
    required String type,
    required String gender,
    required LocationEntity origin,
    required LocationEntity location,
    required String image,
    required List<String> episode,
    required DateTime created,
  }) : super(
          id: id,
          name: name,
          status: status,
          species: species,
          type: type,
          gender: gender,
          origin: origin,
          location: location,
          image: image,
          episode: episode,
          created: created,
        );

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      id: json['id'] as int,
      name: json['name'] as String,
      status: json['status'] as String,
      species: json['species'] as String,
      type: json['type'] as String,
      gender: json['gender'] as String,
      origin: LocationModel.fromJson(
        json['origin'] as Map<String, dynamic>,
      ),
      location: LocationModel.fromJson(
        json['location'] as Map<String, dynamic>,
      ),
      image: json['image'] as String,
      episode:
          (json['episode'] as List<dynamic>).map((e) => e as String).toList(),
      created: DateTime.parse(json['created'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'type': type,
      'gender': gender,
      'origin': LocationModel(name: origin.name, url: origin.url).toJson(),
      'location':
          LocationModel(name: location.name, url: location.url).toJson(),
      'image': image,
      'episode': episode,
      'created': created.toIso8601String(),
    };
  }
}
