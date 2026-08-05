import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:maple_closet/models/item.dart';
import 'package:maple_closet/page/tools/my_item_list.dart';

/// 한/두손무기 세부 분류(예: 한손검/단검/...) 필터가 붙은 아이템 리스트.
///
/// 세부 분류는 하드코딩 enum이 아니라 로드된 [itemList]의 [Item.weaponCategory]에서
/// 동적으로 유도한다. 따라서 DB에 새 무기 종류가 추가돼도 코드 수정 없이 노출된다.
class WeaponItemList extends HookWidget {
  final List<Item> itemList;

  const WeaponItemList({
    super.key,
    required this.itemList,
  });

  @override
  Widget build(BuildContext context) {
    // 세부 무기 분류 목록 (중복 제거 + 정렬).
    // 정렬 규칙(카테고리별 최소 itemid 기준):
    //  - 한손무기: 표준무기(한손검~스태프, id 130만~138만)를 먼저, 특수무기(id 12만대)를 뒤로
    //  - 두손무기: 차크람(1404)을 항상 맨 뒤로
    final categories = useMemoized(
      () {
        final Map<String, int> minId = {};
        for (final item in itemList) {
          final category = item.weaponCategory;
          if (category == null) continue;
          final id = int.tryParse(item.id) ?? 0;
          minId[category] =
              minId.containsKey(category) && minId[category]! < id
                  ? minId[category]!
                  : id;
        }
        int groupOf(String c) {
          if (c == 'Chakram') return 2; // 두손무기 맨 뒤
          return minId[c]! < 1300000 ? 1 : 0; // 한손 특수무기는 표준무기 뒤
        }

        final result = minId.keys.toList();
        result.sort((a, b) {
          final ga = groupOf(a), gb = groupOf(b);
          if (ga != gb) return ga.compareTo(gb);
          return minId[a]!.compareTo(minId[b]!);
        });
        return result;
      },
      [itemList],
    );

    final selectedCategory =
        useState<String?>(categories.isEmpty ? null : categories.first);

    // itemList(=서브카테고리)가 바뀌면 첫 분류로 리셋
    useEffect(() {
      selectedCategory.value = categories.isEmpty ? null : categories.first;
      return null;
    }, [categories]);

    final filteredList = selectedCategory.value == null
        ? itemList
        : itemList
            .where((item) => item.weaponCategory == selectedCategory.value)
            .toList();

    return Column(
      children: [
        // 세부 분류 선택 칩 (가로 스크롤)
        SizedBox(
          height: 32,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: categories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 6),
            itemBuilder: (context, index) {
              final category = categories[index];
              final bool isActive = category == selectedCategory.value;
              return GestureDetector(
                onTap: () => selectedCategory.value = category,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: isActive
                        ? const Color.fromARGB(255, 181, 103, 103)
                        : const Color.fromARGB(255, 218, 210, 206),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    _weaponCategoryName(category),
                    style: TextStyle(fontFamily: 'Maplestory', 
                      color: isActive ? Colors.white : Colors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ItemList(
            key: ValueKey(selectedCategory.value),
            itemList: filteredList,
          ),
        ),
      ],
    );
  }
}

/// DB의 영문 세부 무기 분류명 -> KMS 한글명.
/// 매핑이 없으면 원본(영문)을 그대로 반환하므로, DB에 새 분류가 추가돼도 깨지지 않는다.
String _weaponCategoryName(String dbCategory) {
  return _weaponCategoryKoNames[dbCategory] ?? dbCategory;
}

const Map<String, String> _weaponCategoryKoNames = {
  // 한손무기
  'One-Handed Sword': '한손검',
  'One-Handed Axe': '한손도끼',
  'One-Handed Blunt Weapon': '한손둔기',
  'Dagger': '단검',
  'Katara': '블레이드',
  'Cane': '케인',
  'Wand': '완드',
  'Staff': '스태프',
  'Shining Rod': '샤이닝로드',
  'Bladecaster': '튜너',
  'Breath Shooter': '브레스 슈터',
  'Soul Shooter': '소울슈터',
  'Desperado': '데스페라도',
  'Whip Blade': '에너지소드',
  'Psy-limiter': 'ESP리미터',
  'Chain': '체인',
  'Gauntlet': '매직 건틀렛',
  'Ritual Fan': '부채',
  // 두손무기
  'Two-Handed Sword': '두손검',
  'Two-Handed Axe': '두손도끼',
  'Two-Handed Blunt': '두손둔기',
  'Spear': '창',
  'Pole Arm': '폴암',
  'Bow': '활',
  'Crossbow': '석궁',
  'Claw': '아대',
  'Knuckle': '너클',
  'Gun': '건',
  'Dual Bowgun': '듀얼 보우건',
  'Hand Cannon': '핸드캐논',
  'Ancient Bow': '에인션트 보우',
  'Arm Cannon': '건틀렛 리볼버',
  'Lazuli': '라즐리',
  'Lapis': '라피스',
  'Chakram': '차크람',
};
