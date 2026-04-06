import 'package:app_rick_and_morty/core/app_colors.dart';
import 'package:app_rick_and_morty/models/character_model.dart';
import 'package:flutter/material.dart';

class AdaptedBoxDetails extends StatelessWidget {
  final Character character;
  const AdaptedBoxDetails({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        children: [
          SizedBox(height: 10),
          Text(
            "${character.name.toUpperCase()} | #${character.id}",
            style: TextStyle(
              fontSize: 20,
              fontWeight: .bold,
              color: primaryColor,
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 20,
            children: [
              Chip(
                label: Text(character.status),
                backgroundColor: character.color,
                shape: RoundedRectangleBorder(borderRadius: .circular(20)),
              ),
              Chip(
                label: Text(character.species),
                backgroundColor: character.color,
                shape: RoundedRectangleBorder(borderRadius: .circular(20)),
              ),
              Chip(
                label: Text(character.gender),
                backgroundColor: character.color,
                shape: RoundedRectangleBorder(borderRadius: .circular(20)),
              ),
            ],
          ),

          const SizedBox(height: 20),
          Container(
            alignment: .topLeft,
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  "Última localização conhecida:",
                  style: TextStyle(color: primaryColor),
                ),
                Text(
                  character.location.name,
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: .bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 15),
                Text("Local de origem:", style: TextStyle(color: primaryColor)),
                Text(
                  character.origin.name,
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: .bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  "Quantidades de vezes que apareceu:",
                  style: TextStyle(color: primaryColor),
                ),
                Text(
                  "${character.episode.length} episódios",
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: .bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
