import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class FakeImageProvider extends ImageProvider<FakeImageProvider> {
  @override
  Future<FakeImageProvider> obtainKey(ImageConfiguration configuration) {
    return SynchronousFuture(this);
  }

  ImageStreamCompleter load(FakeImageProvider key, decode) {
    final image = ui.PictureRecorder().endRecording().toImage(1, 1);
    final completer = OneFrameImageStreamCompleter(
      image.then((img) => ImageInfo(image: img, scale: 1.0)),
    );
    return completer;
  }
}
