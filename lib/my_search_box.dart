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
      child: FilledButton(
        onPressed: () => _buildSearchingBox(context),
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
    );
  }

  Future<void> _buildSearchingBox(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
          children: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Disable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Enable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
