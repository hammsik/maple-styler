import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SearchBox();
  }
}

class _SearchBox extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Hero(
        tag: 'myHero',
        child: FilledButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    DetailScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  // 페이드 인 애니메이션을 적용
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                opaque: false,
              ),
            );
          },
          style: FilledButton.styleFrom(
              minimumSize: Size.zero,
              fixedSize: const Size(20, 35),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              backgroundColor: const Color.fromARGB(255, 230, 222, 218),
              foregroundColor: Colors.black.withOpacity(0.3)),
          child: const Row(children: [
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.search_rounded,
              size: 25,
              color: Colors.black,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Text(
              '',
              textAlign: TextAlign.end,
            )),
            SizedBox(
              width: 20,
            ),
          ]),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.all(50),
        child: Column(
          children: [
            Hero(
              tag: 'myHero',
              child: Material(
                color: Colors.transparent,
                child: TextField(
                  // style:
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 230, 222, 218),
                    hoverColor: Colors.amber,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
