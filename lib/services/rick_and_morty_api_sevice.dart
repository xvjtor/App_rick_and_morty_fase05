import 'dart:io';

import 'package:app_rick_and_morty/core/app_constants.dart';
import 'package:app_rick_and_morty/models/character_response_model.dart';
import 'package:dio/dio.dart';

class RickAndMortyApiSevice {
  final Dio dio;

  RickAndMortyApiSevice(this.dio);

  Future<CharacterResponse> loadCharacters({required int offset}) async {
    final response = await dio.get(
      Constants.characterEndpoint,
      queryParameters: {"page": offset},
    );
    if (response.statusCode != HttpStatus.ok) {
      throw Exception("Erro ao buscar os personagens na API");
    }

    return CharacterResponse.fromMap(response.data);
  }
}
