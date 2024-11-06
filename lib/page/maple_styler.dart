import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:maple_closet/models/character_history.dart';
import 'package:maple_closet/page/character/layout_character_info.dart';
import 'package:maple_closet/page/character/layout_map_buttons.dart';
import 'package:maple_closet/page/character/layout_character_board.dart';
import 'package:maple_closet/page/tools/layout_coordinating_tool.dart';
import 'package:maple_closet/page/header/layout_custom_app_bar.dart';
import 'package:maple_closet/models/skeleton_character.dart';
import 'package:maple_closet/providers/character_provider.dart';
import 'package:maple_closet/providers/setting_provider.dart';

class MapleStylerHome extends StatefulHookConsumerWidget {
  const MapleStylerHome({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MapleStylerHomeState();
}

class _MapleStylerHomeState extends ConsumerState<MapleStylerHome> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  DateTime? currentBackPressTime;
  BackgroundType? previousBackgroundSetting;
  History? previousCharacter;
  ActionType? previousActionType;

  // 안드로이드에서 뒤로가기 감지를 위한 함수
  void onWillPop(bool b, dynamic d) {
    DateTime currentTime = DateTime.now();
    if (currentBackPressTime == null ||
        currentTime.difference(currentBackPressTime!) >
            const Duration(seconds: 2)) {
      currentBackPressTime = currentTime;
      Fluttertoast.showToast(
          msg: "'뒤로' 버튼을 한번 더 누르시면 종료됩니다.",
          gravity: ToastGravity.BOTTOM,
          backgroundColor: const Color(0xff6E6E6E),
          fontSize: 18,
          toastLength: Toast.LENGTH_SHORT);
      return;
    }
    SystemNavigator.pop();
  }

  void openCharacterDetail(
      BuildContext context, MyCharacter dodo, MyCharacter dodo2) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            CharacterDetail(dodo: dodo, dodo2: dodo2),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        opaque: false,
      ),
    ).then(
      // 디테일 페이지에서 캐릭터 변경했을 시에 이미지 다시 불러오기를 위한 콜백
      (_) => setState(() {}),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('main page has been build');
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent),
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp, // 세로 방향 고정
      DeviceOrientation.portraitDown, // 세로 방향 고정 (거꾸로)
    ]);

    // ref.watch(characterProvider);
    // ref.watch(imageSettingProvider);
    // final currentBackgroundSetting = ref.watch(backgroundSettingProvider);

    // if (previousBackgroundSetting == null ||
    //     (previousBackgroundSetting == BackgroundType.basic &&
    //         currentBackgroundSetting != BackgroundType.basic) ||
    //     (previousBackgroundSetting != BackgroundType.basic &&
    //         currentBackgroundSetting == BackgroundType.basic) ||
    //     previousCharacter == null ||
    //     previousCharacter != ref.read(characterProvider) ||
    //     previousActionType == null ||
    //     previousActionType != ref.read(imageSettingProvider)) {
    //   _characterImage3 =
    //       ref.read(characterProvider.notifier).getCurrentCharacterImageByUint();
    //   previousCharacter = ref.read(characterProvider);
    //   previousActionType = ref.read(imageSettingProvider);
    //   previousBackgroundSetting = currentBackgroundSetting;
    // }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: onWillPop,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: const Color(0xff2B3A55),
        // 키보드가 올라올 때 화면이 줄어드는 것을 방지
        resizeToAvoidBottomInset: false,
        endDrawer: const Drawer(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 20),
                    MyCustomAppBar(
                        clickEvent: () =>
                            _scaffoldKey.currentState!.openEndDrawer()),
                    const SizedBox(height: 20),
                    const BackgroundButtons(),
                    const SizedBox(height: 10),
                    const CharacterBoard(
                      height: 190,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1),
                        color: const Color.fromARGB(255, 181, 103, 103),
                      ),
                      height: 2,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 14),
                    ),
                    const Expanded(child: CoordinatingTools()),
                  ],
                ),
                // if (ref.watch(backgroundSettingProvider) !=
                //     BackgroundType.basic)
                //   IgnorePointer(
                //     child: FutureBuilder(
                //       future: _characterImage3,
                //       builder: (context, snapshot) {
                //         if (snapshot.connectionState == ConnectionState.done) {
                //           return SizedBox(
                //             height: 430,
                //             child: Stack(
                //               fit: StackFit.expand,
                //               children: [
                //                 Image.memory(snapshot.data[0]),
                //                 Opacity(
                //                   opacity: 0.5,
                //                   child: Image.memory(snapshot.data[1]),
                //                 ),
                //               ],
                //             ),
                //           );
                //         } else {
                //           return Container(
                //             margin: const EdgeInsets.only(top: 198),
                //             child: Image.asset('assets/drummingBunny.gif'),
                //           ); // 로딩 중일 때 표시할 위젯
                //         }
                //       },
                //     ),
                //   ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
