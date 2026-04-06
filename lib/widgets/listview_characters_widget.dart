import 'package:app_rick_and_morty/core/app_dependencies.dart';
import 'package:app_rick_and_morty/pages/detail_page.dart';
import 'package:app_rick_and_morty/store/home_store.dart';

import 'package:app_rick_and_morty/widgets/listview_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ListviewCharacters extends StatefulWidget {
  final ScrollController scrollController;
  const ListviewCharacters({super.key, required this.scrollController});

  @override
  State<ListviewCharacters> createState() => _ListviewCharactersState();
}

class _ListviewCharactersState extends State<ListviewCharacters> {
  final homeStore = getIt<HomeStore>();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Observer(
        builder: (context) {
          return ListView.builder(
            key: Key("listView"),
            controller: widget.scrollController,
            itemCount: homeStore.filteredCharacters.length + 1,

            itemBuilder: (context, index) {
              if (index < homeStore.filteredCharacters.length) {
                final character = homeStore.filteredCharacters[index];
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailPage(character: character),
                      ),
                    );
                  },
                  child: ListviewCard(character: character),
                );
              }
              return homeStore.isLoading || homeStore.hasError
                  ? const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    )
                  : Container();
            },
          );
        },
      ),
    );
  }
}
