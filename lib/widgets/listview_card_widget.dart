import 'package:app_rick_and_morty/core/app_colors.dart';
import 'package:app_rick_and_morty/core/app_dependencies.dart';
import 'package:app_rick_and_morty/models/character_model.dart';
import 'package:app_rick_and_morty/store/home_store.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ListviewCard extends StatefulWidget {
  final Character character;
  const ListviewCard({super.key, required this.character});

  @override
  State<ListviewCard> createState() => _ListviewCardState();
}

class _ListviewCardState extends State<ListviewCard> {
  final homeStore = getIt<HomeStore>();

  @override
  void initState() {
    super.initState();
    homeStore.generaterCharacterColor(widget.character);
    
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      key: Key("listCard") ,
      shape: RoundedRectangleBorder(borderRadius: .circular(12)),
      clipBehavior: .antiAlias,
      child: AnimatedContainer(
        color: widget.character.color,
        duration: Duration(milliseconds: 800),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Row(
            crossAxisAlignment: .start,

            children: [
              SizedBox(
                height: 120,
                width: 120,
                child: Hero(
                  tag: ValueKey(widget.character.id),
                  child: CachedNetworkImage(
                    key: Key("imageListCard"),
                    imageUrl: widget.character.image,
                    placeholder: (context, url) =>
                        Container(color: Colors.transparent),
                    errorWidget: (context, url, error) => SizedBox(
                      height: 5,
                      width: 5,
                      child: CircularProgressIndicator(color: primaryColor),
                    ),
                    height: 120,
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  mainAxisAlignment: .start,
                  children: [
                    Text(
                      widget.character.name,

                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: .bold,
                        color: Colors.black54,
                      ),
                      maxLines: 2,
                      overflow: .ellipsis,
                    ),
                    const SizedBox(height: 5),

                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              widget.character.status.toLowerCase() == "alive"
                              ? Colors.green
                              : Colors.red,
                          radius: 8,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "${widget.character.status} - ${widget.character.species}",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.character.gender,
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    Align(
                      alignment: .bottomRight,
                      child: Text(
                        widget.character.id.toString(),
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
