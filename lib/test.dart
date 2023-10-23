import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

// ignore: constant_identifier_names
const API_KEY =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJYLUFwcC1SYXRlLUxpbWl0IjoiNTAwOjEwIiwiYWNjb3VudF9pZCI6IjEyOTIxOTU4NzAiLCJhdXRoX2lkIjoiMiIsImV4cCI6MTcxMzYxMzE1NiwiaWF0IjoxNjk4MDYxMTU2LCJuYmYiOjE2OTgwNjExNTYsInNlcnZpY2VfaWQiOiI0MzAwMTEzOTciLCJ0b2tlbl90eXBlIjoiQWNjZXNzVG9rZW4ifQ.7pcpCzYJHwIq5QTOvmkktcmsISFUZTXPxPnL6pQvlQ0';
// ignore: constant_identifier_names
const MAPLE_CUBE_RESULT_BASE_URL =
    'https://public.api.nexon.com/openapi/maplestory/v1/cube-use-results';

class CubeModel {
  final cubeType;
  final potentialblabla;

  CubeModel({required this.cubeType, required this.potentialblabla});
}

class APIPractice {
  static int count = 10;
  static String date = '2023-10-17';

  static Future<List<CubeModel>> getSomething() async {
    Dio().options.headers['authorization'] = 'Bearer $API_KEY';
    final resp = await Dio().get(MAPLE_CUBE_RESULT_BASE_URL, queryParameters: {
      'count': APIPractice.count,
      'date': APIPractice.date,
    });
    final listWithData = resp.data['cube_histories'];

    return listWithData
        .map((item) => CubeModel(
            cubeType: item['cube_type'],
            potentialblabla: item['additional_potential_option_grade']))
        .toList;
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
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(color: Color(0xff333333)),
        child: FutureBuilder(
          future: APIPractice.getSomething(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text(
                'error',
                style: TextStyle(color: Color(0xffffffff)),
              );
            }

            if (snapshot.hasData) {
              return CircularProgressIndicator();
            }

            return Column(
              children: [
                ...snapshot.data!.map(
                  (item) => Text(
                    item.cubeType + item.potentialblabla,
                    style: TextStyle(color: Color(0xffffffff)),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
