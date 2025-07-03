import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/atoms/image/image.dart';

void main() {
  testWidgets('RImage: deve rederizar o widget corretamente', (tester) async {
    final image = NetworkImage('https://via.placeholder.com/150');
    final widget = RImage(
      image: image,
      size: const Size(100, 100),
      fit: BoxFit.cover,
      alignment: Alignment.center,
      repeat: ImageRepeat.repeat,
      centerSlice: const Rect.fromLTWH(0, 0, 100, 100),
      matchTextDirection: true,
      color: Colors.red,
      colorBlendMode: BlendMode.colorBurn,
      errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
      filterQuality: FilterQuality.high,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) => child,
      gaplessPlayback: true,
      excludeFromSemantics: true,
      isAntiAlias: true,
      loadingBuilder: (context, child, event) => child,
      opacity: const AlwaysStoppedAnimation(1),
      semanticLabel: 'teste',
    );

    await tester.pumpWidget(MaterialApp(home: widget));

    expect(find.byType(RImage), findsOneWidget);

    final imageWidget = tester.widget<RImage>(find.byType(RImage));

    expect(imageWidget.image, image);
    expect(imageWidget.size, const Size(100, 100));
    expect(imageWidget.fit, BoxFit.cover);
    expect(imageWidget.alignment, Alignment.center);
    expect(imageWidget.repeat, ImageRepeat.repeat);
    expect(imageWidget.centerSlice, const Rect.fromLTWH(0, 0, 100, 100));
    expect(imageWidget.matchTextDirection, true);
    expect(imageWidget.color, Colors.red);
    expect(imageWidget.colorBlendMode, BlendMode.colorBurn);
    expect(imageWidget.errorBuilder, isNotNull);
    expect(imageWidget.filterQuality, FilterQuality.high);
    expect(imageWidget.frameBuilder, isNotNull);
    expect(imageWidget.gaplessPlayback, true);
    expect(imageWidget.excludeFromSemantics, true);
    expect(imageWidget.isAntiAlias, true);
    expect(imageWidget.loadingBuilder, isNotNull);
    expect(imageWidget.opacity, const AlwaysStoppedAnimation(1.0));
    expect(imageWidget.semanticLabel, 'teste');
  });
}
