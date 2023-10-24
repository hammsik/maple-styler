import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

// ignore: constant_identifier_names
const API_KEY =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJYLUFwcC1SYXRlLUxpbWl0IjoiNTAwOjEwIiwiYWNjb3VudF9pZCI6IjEyOTIxOTU4NzAiLCJhdXRoX2lkIjoiMiIsImV4cCI6MTcxMzYxMzE1NiwiaWF0IjoxNjk4MDYxMTU2LCJuYmYiOjE2OTgwNjExNTYsInNlcnZpY2VfaWQiOiI0MzAwMTEzOTciLCJ0b2tlbl90eXBlIjoiQWNjZXNzVG9rZW4ifQ.7pcpCzYJHwIq5QTOvmkktcmsISFUZTXPxPnL6pQvlQ0';
// ignore: constant_identifier_names
const MAPLE_CUBE_RESULT_BASE_URL = 'https://maplestory.io/api/KMST/1157/item';

class CubeModel {
  final cubeType;
  final potentialblabla;

  CubeModel({required this.cubeType, required this.potentialblabla});
}

class APIPractice {
  static Future<List<dynamic>> getSomething() async {
    final resp = await Dio().get(
      MAPLE_CUBE_RESULT_BASE_URL,
      queryParameters: {
        'overallCategoryFilter': 'Equip',
        'categoryFilter': 'Armor',
        'subCategoryFilter': 'Hat',
      },
    );
    print('ㅁㄴㅇㄹ');
    print(resp.data.runtimeType);
    final listWithData = resp.data
        .map((data) => {
              "id": data["id"],
              "name": data["name"],
            })
        .toList();

    print('ㄴㅇㄹ');
    print(listWithData.runtimeType);
    return listWithData;
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
          child: FutureBuilder<List<dynamic>>(
            future: APIPractice.getSomething(),
            builder: (context, snapshot) {
              print(snapshot.data);
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return ListView(
                  physics: BouncingScrollPhysics(),
                  children:
                      snapshot.data!.map((item) => Text(item['name'])).toList(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
