import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

// ignore: constant_identifier_names
const MAPLE_CUBE_RESULT_BASE_URL = 'https://maplestory.io/api/KMST/1157/item';

class APIPractice {
  static Future<List<List<dynamic>>> getSomething() async {
    final Response response = await Dio().get(
      MAPLE_CUBE_RESULT_BASE_URL,
      queryParameters: {
        'overallCategoryFilter': 'Equip',
        'categoryFilter': 'Armor',
        'subCategoryFilter': 'Hat',
      },
    );

    List<List<dynamic>> myList = List<List<String>>.from(response.data
        .map((data) => [data['id'].toString(), data['name'].toString()]));
    myList.shuffle();

    return myList;
  }
}

class MyTest extends StatelessWidget {
  const MyTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(color: Color(0xff222222)),
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(color: Color.fromARGB(255, 116, 116, 116)),
        child: Container(
          decoration: BoxDecoration(color: Color.fromARGB(255, 141, 125, 125)),
          child: FutureBuilder<List<List<dynamic>>>(
            future: APIPractice.getSomething(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    ...snapshot.data!
                        .map((item) => Text(item[0] + ' ' + item[1]))
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
