// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  Computed<List<Character>>? _$filteredCharactersComputed;

  @override
  List<Character> get filteredCharacters =>
      (_$filteredCharactersComputed ??= Computed<List<Character>>(
        () => super.filteredCharacters,
        name: 'HomeStoreBase.filteredCharacters',
      )).value;

  late final _$isLoadingAtom = Atom(
    name: 'HomeStoreBase.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$hasErrorAtom = Atom(
    name: 'HomeStoreBase.hasError',
    context: context,
  );

  @override
  bool get hasError {
    _$hasErrorAtom.reportRead();
    return super.hasError;
  }

  @override
  set hasError(bool value) {
    _$hasErrorAtom.reportWrite(value, super.hasError, () {
      super.hasError = value;
    });
  }

  late final _$isGridAtom = Atom(
    name: 'HomeStoreBase.isGrid',
    context: context,
  );

  @override
  bool get isGrid {
    _$isGridAtom.reportRead();
    return super.isGrid;
  }

  @override
  set isGrid(bool value) {
    _$isGridAtom.reportWrite(value, super.isGrid, () {
      super.isGrid = value;
    });
  }

  late final _$charactersAtom = Atom(
    name: 'HomeStoreBase.characters',
    context: context,
  );

  @override
  ObservableList<Character> get characters {
    _$charactersAtom.reportRead();
    return super.characters;
  }

  @override
  set characters(ObservableList<Character> value) {
    _$charactersAtom.reportWrite(value, super.characters, () {
      super.characters = value;
    });
  }

  late final _$searchAtom = Atom(
    name: 'HomeStoreBase.search',
    context: context,
  );

  @override
  String? get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String? value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  late final _$loadCharactersAsyncAction = AsyncAction(
    'HomeStoreBase.loadCharacters',
    context: context,
  );

  @override
  Future<void> loadCharacters() {
    return _$loadCharactersAsyncAction.run(() => super.loadCharacters());
  }

  late final _$generaterCharacterColorAsyncAction = AsyncAction(
    'HomeStoreBase.generaterCharacterColor',
    context: context,
  );

  @override
  Future<void> generaterCharacterColor(Character character) {
    return _$generaterCharacterColorAsyncAction.run(
      () => super.generaterCharacterColor(character),
    );
  }

  late final _$HomeStoreBaseActionController = ActionController(
    name: 'HomeStoreBase',
    context: context,
  );

  @override
  void setSearch(String? text) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
      name: 'HomeStoreBase.setSearch',
    );
    try {
      return super.setSearch(text);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
hasError: ${hasError},
isGrid: ${isGrid},
characters: ${characters},
search: ${search},
filteredCharacters: ${filteredCharacters}
    ''';
  }
}
