import 'package:flutter/material.dart';

class SelectedItem extends StatefulWidget {
  final String itemId;
  final String itemName;

  const SelectedItem({super.key, required this.itemId, required this.itemName});

  @override
  State<StatefulWidget> createState() {
    return _SelectedItem();
  }
}

class _SelectedItem extends State<SelectedItem> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        height: 40,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 230, 222, 218),
          borderRadius: BorderRadius.circular(8),
        ),
        child: widget.itemId == 'null' ||
                widget.itemId == '1040036' ||
                widget.itemId == '1060026'
            ? const Text('아이템을 선택해주세요')
            : Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Image.network(
                    'https://maplestory.io/api/KMST/1157/item/${widget.itemId}/icon',
                    width: 25,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.image_not_supported_outlined);
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Text(widget.itemName,
                          style: const TextStyle(fontSize: 9))),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Icon(Icons.favorite_outline_rounded),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Icon(Icons.close_rounded),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
      ),
    );
  }
}
