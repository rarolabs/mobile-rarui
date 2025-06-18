import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/molecules/card_icon_button/card_icon_button.dart';
import 'package:rarUI/utils/interfaces/behaviour.dart';

void main() {
  const expectedImage = AssetImage('assets/images/casas_bahia.jpg');
  const buttonText = 'Ativar Cashback';
  const title = 'Casas Bahia';
  const subtitle = '1,5% de volta';

  Widget buildComponent(Behaviour behaviour, {VoidCallback? onPressed}) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: QCardIconButton.withButton(
            behaviour: behaviour,
            title: title,
            subtitle: subtitle,
            buttonText: buttonText,
            image: expectedImage,
            onButtonPressed: onPressed ?? () {},
          ),
        ),
      ),
    );
  }

  testWidgets('QCardIconButton displays correct title and subtitle', (WidgetTester tester) async {
    await tester.pumpWidget(buildComponent(Behaviour.regular));

    expect(find.text(title), findsOneWidget);
    expect(find.text(subtitle), findsOneWidget);
    expect(find.text(buttonText), findsOneWidget);
  });
  testWidgets('QCardIconButton calls onPressed when button is tapped', (WidgetTester tester) async {
    bool pressed = false;

    await tester.pumpWidget(
      buildComponent(
        Behaviour.regular,
        onPressed: () {
          pressed = true;
        },
      ),
    );

    await tester.tap(find.text(buttonText));
    await tester.pump();

    expect(pressed, isTrue);
  });

  Finder imageFinder(ImageProvider<Object> expectedImage) => find.byWidgetPredicate(
        (Widget widget) {
          if (widget is Container) {
            final decoration = widget.decoration;

            if (decoration is BoxDecoration) {
              final image = decoration.image;

              if (image is DecorationImage) {
                final imageProvider = image.image;

                if (imageProvider is AssetImage) {
                  return imageProvider == expectedImage;
                }
              }
            }
          }

          return false;
        },
      );

  testWidgets('QCardIconButton displays correct image', (WidgetTester tester) async {
    await tester.pumpWidget(buildComponent(Behaviour.regular));

    expect(imageFinder(expectedImage), findsOneWidget);
  });

  testWidgets('QCardIconButton is disabled when behaviour is disabled', (WidgetTester tester) async {
    const bool pressed = false;

    await tester.pumpWidget(buildComponent(Behaviour.disabled));

    await tester.tap(find.text(buttonText));
    await tester.pump();

    expect(pressed, isFalse);
  });
}
