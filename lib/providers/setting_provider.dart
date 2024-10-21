import 'package:maple_closet/data/my_tools.dart';
import 'package:maple_closet/models/tool.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'setting_provider.g.dart';

enum ImageType {
  stand,
  standGif,
  walkGif,
}

@Riverpod(keepAlive: true)
class ImageSetting extends _$ImageSetting {
  @override
  ImageType build() {
    return ImageType.walkGif;
  }

  void changeImageType(ImageType type) {
    state = type;
  }
}

@Riverpod(keepAlive: true)
class ToolSetting extends _$ToolSetting {
  @override
  MyTool build() {
    return toolMap[ToolType.beauty]!;
  }

  void changeTool({required ToolType toolType}) {
    state = toolMap[toolType]!;
  }

  void changeCurrentSubCategory({required int index}) {
    state = state.copyWith(subCategoryIdx: index);
  }
}
