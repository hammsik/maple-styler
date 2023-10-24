import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

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
  static Future<List<List<dynamic>>> getSomething() async {
    final Response response = await Dio().get(
      MAPLE_CUBE_RESULT_BASE_URL,
      queryParameters: {
        'overallCategoryFilter': 'Equip',
        'categoryFilter': 'Armor',
        'subCategoryFilter': 'Hat',
      },
    );
    // print('ㅁㄴㅇㄹ');
    // print(response.data);
    // print(response.data[0].runtimeType);

    // for (Map<String, dynamic> m in response.data) {
    //   print('${m['id']} / ${m['name']}');
    // }
    List<List<dynamic>> myList = List<List<String>>.from(response.data
        .map((data) => [data['id'].toString(), data['name'].toString()]));
    myList.shuffle();
    // print(dataList);
    // final List<Map<String, String>> listWithData2 =
    //     List<Map<String, String>>.from(listWithData);
    // print('과연 listWithData의 타입은?');
    // print(listWithData2.runtimeType);
    // print(ilist[0]['asd']);
    // print('ㄴㅇㄹ');
    // print(listWithData.runtimeType);
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
