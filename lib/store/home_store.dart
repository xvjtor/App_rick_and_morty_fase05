import 'package:app_rick_and_morty/models/character_model.dart';

import 'package:app_rick_and_morty/services/rick_and_morty_api_sevice.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';
import 'package:palette_generator/palette_generator.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final RickAndMortyApiSevice service;

  HomeStoreBase(this.service);

  int offset = 1;

  @observable
  bool isLoading = false;

  @observable
  bool hasError = false;

  @observable
  bool isGrid = false;

  @observable
  bool hasNextPage = true;

  @observable
  ObservableList<Character> characters = <Character>[].asObservable();

  @observable
  String? search;

  @action
  void setSearch(String? text) => search = text;

  @computed
  List<Character> get filteredCharacters {
    if (search == null) return characters.toList();
    return characters
        .where(
          (characters) =>
              characters.name.toLowerCase().contains(search!.toLowerCase()) ||
              characters.id.toString().contains(search!),
        )
        .toList();
  }

  @action
  Future<void> loadCharacters() async {
    if (isLoading || !hasNextPage) return;
    isLoading = true;
    hasError = false;

    await Future.delayed(Duration(milliseconds: 200));

    try {
      final characterResponse = await service.loadCharacters(offset: offset);

      
      characters.addAll(characterResponse.results);

      hasNextPage = characterResponse.next != null;

      offset += 1;
    } on DioException catch (e) {
      if (e.response?.statusCode == 429) {
        hasError = true;
      }
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> generaterCharacterColor(Character character) async {
    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      NetworkImage(character.image),
    );
    if (paletteGenerator.dominantColor != null) {
      final indexCharacter = characters.indexWhere(
        (e) => e.id.toString() == character.id.toString(),
      );
      characters[indexCharacter] = characters[indexCharacter].copyWith(
        color: paletteGenerator.dominantColor!.color,
      );
    }
  }
}
