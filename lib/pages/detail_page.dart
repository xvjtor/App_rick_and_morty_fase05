import 'package:app_rick_and_morty/models/character_model.dart';
import 'package:app_rick_and_morty/widgets/adapted_box_details_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Character character;
  const DetailPage({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            floating: true,
            collapsedHeight: 60,
            expandedHeight: 260,
            flexibleSpace: Hero(
              tag: ValueKey(character.id),
              child: CachedNetworkImage(
                key: Key("imageDetails"),
                imageUrl: character.image,

                fit: BoxFit.cover,
              ),
            ),
          ),
       
        
          SliverToBoxAdapter(child: AdaptedBoxDetails(character: character)),
        ],
      ),
    );
  }
}
