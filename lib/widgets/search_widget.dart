import 'package:app_rick_and_morty/core/app_dependencies.dart';
import 'package:app_rick_and_morty/store/home_store.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final homeStore = getIt<HomeStore>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        key: Key("Filtro") ,
        onChanged: homeStore.setSearch,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.grey[600], fontSize: 16),

          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon((Icons.search), color: Colors.grey[600]),
          hintText: "Nome ou identificador",
          border: OutlineInputBorder(
            borderRadius: .circular(10),
            borderSide: .none,
          ),
          contentPadding: .symmetric(vertical: 8, horizontal: 10),
        ),
      ),
    );
  }
}
