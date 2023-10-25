import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

// ignore: constant_identifier_names
const MAPLE_CUBE_RESULT_BASE_URL = 'https://maplestory.io/api/KMST/1157/item';

class APIPractice {
  static Future<List<List<dynamic>>> getSomething(
      String categoryFilter, String subCategoryFilter) async {
    final Response response = await Dio().get(
      MAPLE_CUBE_RESULT_BASE_URL,
      queryParameters: {
        'overallCategoryFilter': 'Equip',
        'categoryFilter': categoryFilter,
        'subCategoryFilter': subCategoryFilter,
      },
    );

    List<List<dynamic>> myList = List<List<String>>.from(response.data
        .map((data) => [data['id'].toString(), data['name'].toString()]));
    myList = List.from(myList.reversed);

    return myList;
  }
}
