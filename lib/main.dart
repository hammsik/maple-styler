import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:maple_closet/page/maple_styler.dart';
import 'package:upgrader/upgrader.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // deleteDatabase('user.db');
  runApp(const ProviderScope(child: MapleStyler()));
}

class MapleStyler extends StatelessWidget {
  const MapleStyler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UpgradeAlert(
        showIgnore: false,
        upgrader: Upgrader(
          // debugDisplayAlways: true,
          durationUntilAlertAgain: const Duration(days: 1),
          messages: MyUpgraderMessages(),
        ),
        child: const MapleStylerHome(),
      ),
    );
  }
}

// upgrader 메시지 커스터마이징을 위한 클래스
class MyUpgraderMessages extends UpgraderMessages {
  @override
  String get title {
    return '📢 업데이트 알림';
  }

  @override
  String get body {
    return '{{appName}}의 새로운 업데이트 버전이 출시됐습니다!\n\n현재 버전: {{currentInstalledVersion}}\n최신 버전: {{currentAppStoreVersion}}';
  }

  @override
  String get prompt {
    return '[업데이트]를 누르면 스토어로 이동합니다😊';
  }

  @override
  String get buttonTitleLater => '다음에 할게요';

  @override
  String get buttonTitleUpdate => '업데이트';
}
