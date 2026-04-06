import 'package:app_rick_and_morty/models/character_model.dart';

class CharacterResponse {
  final int count;
  final int pages;
  final String? next;
  final String? prev;
  final List<Character> results;

  CharacterResponse({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
    required this.results,
  });

  factory CharacterResponse.fromMap(Map<String, dynamic> data) =>
      CharacterResponse(
        count: data["info"]["count"],
        pages: data["info"]["pages"],
        next: data["info"]["next"],
        prev: data["info"]["prev"],
        results: (data["results"] as List)
            .map((character) => Character.fromMap(character))
            .toList(),
      );
}
