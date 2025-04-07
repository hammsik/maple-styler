import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:maple_closet/page/character/layout_map_buttons.dart';
import 'package:maple_closet/page/character/layout_character_board.dart';
import 'package:maple_closet/page/tools/layout_coordinating_tool.dart';
import 'package:maple_closet/page/header/layout_custom_app_bar.dart';

class MapleStylerHome extends ConsumerWidget {
  const MapleStylerHome({super.key});

  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DateTime? currentBackPressTime;

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

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent),
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp, // 세로 방향 고정
      DeviceOrientation.portraitDown, // 세로 방향 고정 (거꾸로)
    ]);

    print('main page has been build');

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: onWillPop,
      child: Scaffold(
        // key: _scaffoldKey,
        backgroundColor: const Color(0xff2B3A55),
        // 키보드가 올라올 때 화면이 줄어드는 것을 방지
        resizeToAvoidBottomInset: false,
        // endDrawer: const Drawer(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const MyCustomAppBar(
                    // clickEvent: () =>
                    //     _scaffoldKey.currentState!.openEndDrawer()
                    ),
                const SizedBox(height: 20),
                const BackgroundButtons(),
                const SizedBox(height: 10),
                CharacterBoard(
                  height: MediaQuery.of(context).size.height * 0.22,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1),
                    color: const Color.fromARGB(255, 181, 103, 103),
                  ),
                  height: 2,
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 14),
                ),
                const Expanded(child: CoordinatingTools()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
