import 'package:app_rick_and_morty/core/app_colors.dart';
import 'package:app_rick_and_morty/core/app_dependencies.dart';
import 'package:app_rick_and_morty/models/character_model.dart';
import 'package:app_rick_and_morty/store/home_store.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

class GridviewCard extends StatefulWidget {
  final Character character;

  const GridviewCard({super.key, required this.character});

  @override
  State<GridviewCard> createState() => _GridviewCardState();
}

class _GridviewCardState extends State<GridviewCard> {
  final homeStore = getIt<HomeStore>();

  @override
  void initState() {
    super.initState();
    homeStore.generaterCharacterColor(widget.character);
  }

  /*Future<void> getPaletteColor() async {
    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      NetworkImage(widget.character.image),
    );

    if (paletteGenerator.dominantColor != null && mounted) {
      homeStore.updateCharactersColor(
        characterId: widget.character.id.toString(),
        color: paletteGenerator.dominantColor!.color,
      );
    }
  }
  Obs: métedo gerado atualmente na store
  */

  @override
  Widget build(BuildContext context) {
    return Card(
      key: Key("gridCard"),
      shape: RoundedRectangleBorder(borderRadius: .circular(12)),
      clipBehavior: .antiAlias,
      child: AnimatedContainer(
        color: widget.character.color,
        duration: Duration(milliseconds: 800),
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text(
              widget.character.id.toString(),
              style: TextStyle(color: Colors.black54),
            ),
            SizedBox(height: 15),
            Hero(
              tag: ValueKey(widget.character.id),
              child: CachedNetworkImage(
                key: Key("imageGridCard"),
                imageUrl: widget.character.image,
                placeholder: (context, url) =>
                    Container(color: Colors.transparent),
                errorWidget: (context, url, error) => SizedBox(
                  height: 5,
                  width: 5,
                  child: CircularProgressIndicator(color: primaryColor),
                ),
                height: 130,
              ),
            ),
            SizedBox(height: 15),
            Text(
              widget.character.name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: .bold,
                color: Colors.black54,
              ),
              maxLines: 2,
              overflow: .ellipsis,
              textAlign: .center,
            ),
          ],
        ),
      ),
    );
  }
}
