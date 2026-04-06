import 'package:app_rick_and_morty/core/app_dependencies.dart';

import 'package:app_rick_and_morty/pages/detail_page.dart';
import 'package:app_rick_and_morty/store/home_store.dart';
import 'package:app_rick_and_morty/widgets/gridview_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class GridviewCharacters extends StatefulWidget {
  final ScrollController scrollController;
  const GridviewCharacters({super.key, required this.scrollController});

  @override
  State<GridviewCharacters> createState() => _GridviewCharactersState();
}

class _GridviewCharactersState extends State<GridviewCharacters> {
  final homeStore = getIt<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Observer(
        builder: (context) {
          return GridView.builder(
            key: Key("gridView"),
            controller: widget.scrollController,
            itemCount: homeStore.filteredCharacters.length + 1,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 2.8,
            ),
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
                  child: GridviewCard(character: character),
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
