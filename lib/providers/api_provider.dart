import 'dart:async';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_provider.g.dart';

/// maplestory.io API 응답이 이 시간을 넘기면 지연으로 간주하고 TimeoutException을 던진다.
const Duration kCharacterImageTimeout = Duration(seconds: 10);

@Riverpod(keepAlive: true)
class Api extends _$Api {
  @override
  Dio build() {
    return Dio();
  }

  Future<List<Uint8List>> getCharacterImage(List<String> urls) async {
    final response = await Future.wait([
      state.get(urls[0], options: Options(responseType: ResponseType.bytes)),
      state.get(urls[1], options: Options(responseType: ResponseType.bytes)),
    ]).timeout(kCharacterImageTimeout);

    if (response.every((e) => e.statusCode == 200) == false) {
      throw Exception('이미지를 받아오는 도중 에러가 발생했습니다.');
    }

    // 각 응답의 바이트 데이터를 Uint8List로 변환하여 리스트로 반환
    return response.map((e) => Uint8List.fromList(e.data)).toList();
  }
}
