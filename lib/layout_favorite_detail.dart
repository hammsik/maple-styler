import 'package:flutter/material.dart';
import 'package:maple_closet/database/database.dart';

class FavoriteDetailScreen extends StatefulWidget {
  final int favoriteId;
  final int listIndex;

  const FavoriteDetailScreen(
      {super.key, required this.favoriteId, required this.listIndex});

  @override
  State<StatefulWidget> createState() {
    return _FavoriteDetailScreen();
  }
}

class _FavoriteDetailScreen extends State<FavoriteDetailScreen> {
  UserFavoriteDataBase database = UserFavoriteDataBase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.6),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: widget.listIndex,
                child: Image.network(
                  'https://maplestory.io/api/KMST/1168/item/${widget.favoriteId}/icon',
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.image_not_supported_outlined);
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    int deleteCnt = await (database
                            .delete(database.userFavoriteItems)
                          ..where(
                              (item) => item.itemid.equals(widget.favoriteId)))
                        .go();
                    Navigator.pop(context, deleteCnt);
                  },
                  child: const Text('delete'))
            ],
          ),
        ),
      ),
    );
  }
}
