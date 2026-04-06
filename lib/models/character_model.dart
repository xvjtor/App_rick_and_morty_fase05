import 'package:flutter/material.dart';

class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final CharacterLocation origin;
  final CharacterLocation location;
  final String image;
  final List<String> episode;
  final String url;
  final Color color;
  

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    this.color = Colors.white,
  });

  factory Character.fromMap(Map<String, dynamic> data) => Character(
    id: data["id"],
    name: data["name"],
    status: data["status"],
    species: data["species"],
    gender: data["gender"],
    origin: CharacterLocation.fromMap(data["origin"]),
    location: CharacterLocation.fromMap(data["location"]),
    image: data["image"],
    episode: List<String>.from(data["episode"].map((x) => x)),
    url: data["url"],
  );

  Character copyWith({
    int? id,
    String? name,
    String? status,
    String? species,
    String? gender,
    dynamic origin,
    dynamic location,
    String? image,
    List<String>? episode,
    String? url,
    Color? color,
  }) {
    return Character(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      species: species ?? this.species,
      gender: gender ?? this.gender,
      origin: origin ?? this.origin,
      location: location ?? this.location,
      image: image ?? this.image,
      episode: episode ?? this.episode,
      url: url ?? this.url,
      color: color ?? this.color,
    );
  }
}

class CharacterLocation {
  CharacterLocation({required this.name, required this.url});
  String name;
  String url;
  factory CharacterLocation.fromMap(Map<String, dynamic> data) =>
      CharacterLocation(name: data["name"], url: data["url"]);
}
