import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/molecules/button/button.dart';
import 'package:rarUI/components/templates/documents_photo_page/documents_photo_component.dart';
import 'package:rarUI/components/templates/documents_photo_page/documents_photo_style_set.dart';
import 'package:rarUI/theme/sizes.dart';
import 'package:rarUI/theme/theme_data.dart';
import 'package:rarUI/utils/interfaces/behaviour.dart';

void main() {
  group('Deve testar o template DOCUMENTS PHOTO', () {
    testWidgets('Deve testar o template DOCUMENTS PHOTO', (tester) async {
      bool clickedCamera = false;
      bool clickedBackButton = false;
      bool clickedCancelButton = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DocumentsPhotoComponent(
              behaviour: Behaviour.regular,
              styles: DocumentsPhotoStyleSet.regular,
              appBarTitle: 'Documentos',
              headerLabel: 'Documentos',
              cancelButtonLabel: 'Cancelar',
              svgCameraPath: QTheme.svgs.camera,
              body: const SizedBox(
                height: QSizes.x20,
                width: QSizes.x20,
              ),
              onPressedCamera: () {
                clickedCamera = true;
              },
              onPressedBackButton: () {
                clickedBackButton = true;
              },
              onPressedCancelButton: () {
                clickedCancelButton = true;
              },
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(DocumentsPhotoComponent), findsOne);
      expect(find.text('Documentos'), findsNWidgets(2));
      expect(find.text('Cancelar'), findsOne);

      await tester.tap(find.byType(IconButton));
      await tester.pumpAndSettle();
      expect(clickedBackButton, isTrue);

      await tester.tap(find.byType(Container).last);
      await tester.pumpAndSettle();
      expect(clickedCamera, isTrue);

      await tester.tap(find.byType(QButton));
      await tester.pumpAndSettle();
      expect(clickedCancelButton, isTrue);
    });
  });
}
