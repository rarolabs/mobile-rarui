import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/atoms/icon/icon_component.dart';
import 'package:rarUI/components/atoms/icon/icon_specs.dart';
import 'package:rarUI/theme/theme_data.dart';
import 'package:rarUI/utils/interfaces/behaviour.dart';

void main() {
  group('QIcon', () {
    bool isOnPressed = false;

    testWidgets('Renderizou corretamente', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: IconComponent(
            behaviour: Behaviour.regular,
            styles: IconStyleSet.size24Gray5,
            svgPath: QTheme.svgs.visibility,
            onPressed: () {
              isOnPressed = true;
            },
          ),
        ),
      );

      // Verifica se o ícone foi renderizado com o estilo correto
      final svgPictureFinder = find.byType(SvgPicture);
      expect(svgPictureFinder, findsOneWidget);

      // Interação com o botão
      final backButton = find.byType(IconButton).first;
      await tester.tap(backButton);
      await tester.pump();
      expect(isOnPressed, isTrue);
    });
  });
}
