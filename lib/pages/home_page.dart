import 'package:app_rick_and_morty/core/app_colors.dart';
import 'package:app_rick_and_morty/core/app_dependencies.dart';
import 'package:app_rick_and_morty/store/home_store.dart';

import 'package:app_rick_and_morty/widgets/gridview_characters_widget.dart';
import 'package:app_rick_and_morty/widgets/listview_characters_widget.dart';
import 'package:app_rick_and_morty/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeStore = getIt<HomeStore>();
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    homeStore.loadCharacters();
    scrollController.addListener(scrollListener);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollListener() {
    if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 200 &&
        !homeStore.isLoading &&
        homeStore.hasNextPage) {
      homeStore.loadCharacters();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: .symmetric(horizontal: 20),
          child: Column(
            children: [
              Align(
                alignment: .topLeft,
                child: Column(
                  children: [
                    Text(
                      "Rick and Morty",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 40,
                        fontWeight: .bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: .topLeft,
                child: Text(
                  "Procure pelo seu personagem",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 18,
                    fontWeight: .bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              SearchWidget(),
              SizedBox(height: 10),
              Align(
                alignment: .topRight,
                child: Observer(
                  builder: (context) {
                    return IconButton(
                      onPressed: () {
                        if (homeStore.isGrid == false) {
                          homeStore.isGrid = true;
                        } else {
                          homeStore.isGrid = false;
                        }
                      },
                      icon: Icon(
                        homeStore.isGrid ? Icons.list : Icons.grid_view,
                        color: primaryColor,
                        size: 30,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 15),
              Observer(
                builder: (context) {
                  return homeStore.isGrid
                      ? GridviewCharacters(scrollController: scrollController)
                      : ListviewCharacters(scrollController: scrollController);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
