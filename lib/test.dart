import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

// ignore: constant_identifier_names
const API_KEY =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJYLUFwcC1SYXRlLUxpbWl0IjoiNTAwOjEwIiwiYWNjb3VudF9pZCI6IjEyOTIxOTU4NzAiLCJhdXRoX2lkIjoiMiIsImV4cCI6MTcxMzYxMzE1NiwiaWF0IjoxNjk4MDYxMTU2LCJuYmYiOjE2OTgwNjExNTYsInNlcnZpY2VfaWQiOiI0MzAwMTEzOTciLCJ0b2tlbl90eXBlIjoiQWNjZXNzVG9rZW4ifQ.7pcpCzYJHwIq5QTOvmkktcmsISFUZTXPxPnL6pQvlQ0';
// ignore: constant_identifier_names
const MAPLE_CUBE_RESULT_BASE_URL =
    'https://maplestory.io/api/character/{"itemId":2000,"alpha":1,"region":"KMST","version":"1157"},{"itemId":12000,"alpha":1,"region":"KMST","version":"1157"},{"itemId":1060000,"region":"KMST","version":"1157"}/stand1/animated';

class CubeModel {
  final cubeType;
  final potentialblabla;

  CubeModel({required this.cubeType, required this.potentialblabla});
}

class APIPractice {
  static int count = 10;
  static String date = '2023-10-17';

  // static Future<List<CubeModel>> getSomething() async {
  //   final resp = await Dio().get(MAPLE_CUBE_RESULT_BASE_URL,
  //       queryParameters: {
  //         'count': APIPractice.count,
  //         'date': APIPractice.date,
  //       },
  //       options: Options(headers: {'authorization': 'API_KEY'}));
  //   final listWithData = resp.data['cube_histories'];

  //   return listWithData
  //       .map((item) => CubeModel(
  //           cubeType: item['cube_type'],
  //           potentialblabla: item['additional_potential_option_grade']))
  //       .toList;
  // }
  static Future<dynamic> getSomething() async {
    return await Dio().get(MAPLE_CUBE_RESULT_BASE_URL);
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
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Color(0xff333333)),
        child: Container(
          decoration: BoxDecoration(color: Color.fromARGB(255, 141, 125, 125)),
          child: Image.network(
            'https://maplestory.io/api/character/{"itemId":2000,"alpha":1,"region":"KMST","version":"1157"},{"itemId":12000,"alpha":1,"region":"KMST","version":"1157"},{"itemId":1060000,"region":"KMST","version":"1157"}/stand1/animated',
            height: 300,
          ),
        ), // 이미지를 가져오는 비동기 작업
      ),
    );
  }
}
