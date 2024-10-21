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
