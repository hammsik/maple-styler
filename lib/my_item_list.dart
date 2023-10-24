import 'package:flutter/material.dart';
import 'package:maple_closet/test.dart';

class ItemList extends StatefulWidget {
  const ItemList({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ItemList();
  }
}

class _ItemList extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
          top: Radius.circular(12), bottom: Radius.circular(18)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 230, 222, 218),
        ),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: <Widget>[
            FutureBuilder<List<List<dynamic>>>(
              future: APIPractice.getSomething(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200.0,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 3.0,
                    ),
                    delegate: SliverChildListDelegate(
                      [Text('망했어.')],
                    ),
                  );
                } else {
                  return SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200.0,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 3.0,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      childCount: snapshot.data?.length,
                      (context, index) => Container(
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            Flexible(
                              fit: FlexFit.loose,
                              child: Image.network(
                                  'https://maplestory.io/api/KMST/1157/item/${snapshot.data?[index][0]}/icon'),
                            ),
                            Expanded(child: Text(snapshot.data?[index][1])),
                          ],
                        ),
                      ),
                      // Text('망했어.')
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
