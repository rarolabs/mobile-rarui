import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/molecules/card_icon_label/card_icon_label.dart';
import 'package:rarUI/shared_widget/loading_widget.dart';
import 'package:rarUI/utils/interfaces/behaviour.dart';

void main() {
  group('Testes do QCardIconLabel.regular', () {
    const String testTitle = 'Confeitaria Júlia';
    const String testSubTitle = '000203-0';
    const Behaviour regular = Behaviour.regular;
    const Behaviour disabled = Behaviour.disabled;
    const Behaviour loading = Behaviour.loading;
    const Behaviour processing = Behaviour.processing;

    // Função para criar o widget de teste
    Widget createTestWidget({required Widget body}) {
      return MaterialApp(
        home: Scaffold(body: body),
      );
    }

    testWidgets('Deve renderizar o QCardIconLabel.regular no estado regular', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          body: QCardIconLabel.standard(
            behaviour: regular,
            title: testTitle,
            subtitle: testSubTitle,
          ),
        ),
      );

      // Verifica se o widget QCardIconLabel foi renderizado
      expect(find.byType(QCardIconLabel), findsOneWidget);

      // Verifica se o título e subtítulo estão presentes
      expect(find.text(testTitle), findsOneWidget);
      expect(find.text(testSubTitle), findsOneWidget);
    });

    testWidgets('Deve renderizar o ícone inicial no estado regular', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          body: QCardIconLabel.standard(
            behaviour: regular,
            title: testTitle,
            subtitle: testSubTitle,
          ),
        ),
      );

      // Verifica se o texto das iniciais é renderizado
      const initials = 'CJ'; // As iniciais de "Confeitaria Júlia"
      expect(find.text(initials), findsOneWidget);
    });

    testWidgets('Deve chamar a função onPressed quando clicado', (WidgetTester tester) async {
      bool wasPressed = false;

      await tester.pumpWidget(
        createTestWidget(
          body: QCardIconLabel.standard(
            behaviour: regular,
            title: testTitle,
            subtitle: testSubTitle,
            onPressed: () => wasPressed = true,
          ),
        ),
      );

      // Simula o toque no widget
      await tester.tap(find.byType(QCardIconLabel));
      await tester.pumpAndSettle();

      // Verifica se a função foi chamada
      expect(wasPressed, isTrue);
    });

    testWidgets('Deve renderizar o QCardIconLabel no estado disabled', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          body: QCardIconLabel.standard(
            behaviour: disabled,
            title: testTitle,
            subtitle: testSubTitle,
          ),
        ),
      );

      // Verifica se o widget QCardIconLabel foi renderizado
      expect(find.byType(QCardIconLabel), findsOneWidget);

      // Verifica se o título e subtítulo estão presentes
      expect(find.text(testTitle), findsOneWidget);
      expect(find.text(testSubTitle), findsOneWidget);
    });

    testWidgets('Não deve chamar a função onPressed quando clicado no estado disabled', (WidgetTester tester) async {
      bool wasPressed = false;

      await tester.pumpWidget(
        createTestWidget(
          body: QCardIconLabel.standard(
            behaviour: disabled,
            title: testTitle,
            subtitle: testSubTitle,
            onPressed: () => wasPressed = true,
          ),
        ),
      );

      // Simula o toque no widget
      await tester.tap(find.byType(QCardIconLabel));
      await tester.pumpAndSettle();

      // Verifica se a função foi chamada
      expect(wasPressed, isFalse);
    });

    testWidgets('Não deve chamar a função onPressed quando clicado no estado processing', (WidgetTester tester) async {
      bool wasPressed = false;

      await tester.pumpWidget(
        createTestWidget(
          body: QCardIconLabel.standard(
            behaviour: processing,
            title: testTitle,
            subtitle: testSubTitle,
            onPressed: () => wasPressed = true,
          ),
        ),
      );

      // Simula o toque no widget
      await tester.tap(find.byType(QCardIconLabel));
      await tester.pumpAndSettle();

      // Verifica se a função foi chamada
      expect(wasPressed, isFalse);
    });

    testWidgets('Deve renderizar o QCardIconLabel no estado loading', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          body: QCardIconLabel.standard(
            behaviour: loading,
            title: testTitle,
            subtitle: testSubTitle,
          ),
        ),
      );

      // Verifica se o widget LoadingWidget está presente
      expect(find.byType(LoadingWidget), findsOneWidget);
    });
  });

  group('Testes do QCardIconLabel.withImage', () {
    const String testTitle = 'Casas Bahia';
    const String testSubTitle = '1,5% de volta';
    const Behaviour regular = Behaviour.regular;
    const Behaviour disabled = Behaviour.disabled;
    const Behaviour loading = Behaviour.loading;
    const Behaviour processing = Behaviour.processing;
    const ImageProvider testImage = AssetImage('assets/images/casas_bahia.jpg');

    // Função para criar o widget de teste
    Widget createTestWidget({required Widget body}) {
      return MaterialApp(
        home: Scaffold(body: body),
      );
    }

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

    testWidgets('Deve renderizar o QCardIconLabel.withImage no estado regular', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          body: QCardIconLabel.withImage(
            behaviour: regular,
            title: testTitle,
            subtitle: testSubTitle,
            image: testImage,
          ),
        ),
      );

      // Verifica se o widget QCardIconLabel foi renderizado
      expect(find.byType(QCardIconLabel), findsOneWidget);

      // Verifica se o título e subtítulo estão presentes
      expect(find.text(testTitle), findsOneWidget);
      expect(find.text(testSubTitle), findsOneWidget);

      // Verifica se a imagem está presente
      expect(imageFinder(testImage), findsOneWidget);
    });

    testWidgets('Deve chamar a função onPressed quando clicado', (WidgetTester tester) async {
      bool wasPressed = false;

      await tester.pumpWidget(
        createTestWidget(
          body: QCardIconLabel.withImage(
            behaviour: regular,
            title: testTitle,
            subtitle: testSubTitle,
            image: testImage,
            onPressed: () => wasPressed = true,
          ),
        ),
      );

      // Simula o toque no widget
      await tester.tap(find.byType(QCardIconLabel));
      await tester.pumpAndSettle();

      // Verifica se a função foi chamada
      expect(wasPressed, isTrue);
    });

    testWidgets('Deve renderizar o QCardIconLabel.withImage no estado disabled', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          body: QCardIconLabel.withImage(
            behaviour: disabled,
            title: testTitle,
            subtitle: testSubTitle,
            image: testImage,
          ),
        ),
      );

      // Verifica se o widget QCardIconLabel foi renderizado
      expect(find.byType(QCardIconLabel), findsOneWidget);

      // Verifica se o título e subtítulo estão presentes
      expect(find.text(testTitle), findsOneWidget);
      expect(find.text(testSubTitle), findsOneWidget);

      // Verifica se a imagem está presente
      expect(imageFinder(testImage), findsOneWidget);
    });

    testWidgets('Não deve chamar a função onPressed quando clicado no estado disabled', (WidgetTester tester) async {
      bool wasPressed = false;

      await tester.pumpWidget(
        createTestWidget(
          body: QCardIconLabel.withImage(
            behaviour: disabled,
            title: testTitle,
            subtitle: testSubTitle,
            image: testImage,
            onPressed: () => wasPressed = true,
          ),
        ),
      );

      // Simula o toque no widget
      await tester.tap(find.byType(QCardIconLabel));
      await tester.pumpAndSettle();

      // Verifica se a função foi chamada
      expect(wasPressed, isFalse);
    });

    testWidgets('Não deve chamar a função onPressed quando clicado no estado processing', (WidgetTester tester) async {
      bool wasPressed = false;

      await tester.pumpWidget(
        createTestWidget(
          body: QCardIconLabel.withImage(
            behaviour: processing,
            title: testTitle,
            subtitle: testSubTitle,
            image: testImage,
            onPressed: () => wasPressed = true,
          ),
        ),
      );

      // Simula o toque no widget
      await tester.tap(find.byType(QCardIconLabel));
      await tester.pumpAndSettle();

      // Verifica se a função foi chamada
      expect(wasPressed, isFalse);
    });

    testWidgets('Deve renderizar o QCardIconLabel.withImage no estado loading', (WidgetTester tester) async {
      await tester.pumpWidget(
        createTestWidget(
          body: QCardIconLabel.withImage(
            behaviour: loading,
            title: testTitle,
            subtitle: testSubTitle,
            image: testImage,
          ),
        ),
      );

      // Verifica se o widget LoadingWidget está presente
      expect(find.byType(LoadingWidget), findsOneWidget);
    });
  });
}
