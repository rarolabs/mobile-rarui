import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/atoms/label/label_specs.dart';
import 'package:rarUI/rarui.dart';

void main() {
  testWidgets('Mostrar os componentes pertencentes ao bottom sheet de ícone', (tester) async {
    const String title = 'Ops! Você está sem conexão.';
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: QBottomSheet.icon(
            behaviour: Behaviour.regular,
            title: title,
            svgPath: QTheme.svgs.permiScanWifi,
            textPrimaryButton: 'Abrir configurações de Wi-Fi',
            onPressedPrimaryButton: () {},
          ),
        ),
      ),
    );

    // Verificar se o título está presente
    final titleFinder = find.text(title);
    expect(titleFinder, findsOneWidget);

    // Verificar se o ícone  está presente
    expect(find.byType(SvgPicture), findsOneWidget);

    // Verificar se o botão primária está presente e secondário não está presente
    expect(find.byType(QButton), findsOneWidget);
  });

  testWidgets('Mostrar os componentes pertencentes ao bottom sheet de labels', (tester) async {
    const String title = 'Dispositivo não cadastrado';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: QBottomSheet.text(
            behaviour: Behaviour.regular,
            title: title,
            text: 'Você precisa cadastrar o seu dispositivo antes de gerar um código OTP.',
            textPrimaryButton: 'Cadastrar dispositivo',
            onPressedPrimaryButton: () {},
          ),
        ),
      ),
    );

    // Verificar se o título está presente
    final titleFinder = find.text(title);
    expect(titleFinder, findsOneWidget);

    // Verificar se os QLabels estão presentes
    final textStyleFinder = find.byWidgetPredicate(
      (widget) => widget is QLabel && widget.style == LabelStyleSet.captionRoboto14Gray5Regular,
    );
    expect(textStyleFinder, findsOneWidget);

    // Verificar se os QButtons estão presentes
    expect(find.byType(QButton), findsOneWidget);
  });

  testWidgets('Mostrar os componentes pertencentes ao bottom sheet de radio', (tester) async {
    const String title = 'Estado Civil';
    const String subtitle = 'Selecione o Estado Civil apropriado para seu caso';
    int? currentPosition;
    final List<QRadionOptionsModel> options = [
      QRadionOptionsModel(title: 'Solteiro (a)'),
      QRadionOptionsModel(title: 'Casado (a)'),
      QRadionOptionsModel(title: 'Separado (a)'),
      QRadionOptionsModel(title: 'Divorciado (a)'),
      QRadionOptionsModel(title: 'Viúvo (a)'),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: QBottomSheet.radio(
            behaviour: Behaviour.regular,
            title: title,
            subtitle: subtitle,
            options: options,
            currentIndexOption: currentPosition,
            onChanged: (v) => currentPosition = v,
          ),
        ),
      ),
    );

    // Verificar se o título e subtítulo estão presentes
    final titleFinder = find.text(title);
    expect(titleFinder, findsOneWidget);
    final subtitleFinder = find.text(subtitle);
    expect(subtitleFinder, findsOneWidget);

    // Verificar se os radios buttons estão presentes
    final radioButtonsFinder = find.byType(Radio<int>);
    expect(radioButtonsFinder, findsExactly(options.length));

    await tester.tap(radioButtonsFinder.first);
    await tester.pumpAndSettle();
    expect(currentPosition != null, isTrue);
    expect(options[currentPosition!], options.first);

    // Verificar se os QButtons não estão presentes
    expect(find.byType(QButton), findsNothing);
  });

  testWidgets('Mostrar os componentes pertencentes ao bottom sheet de delete', (tester) async {
    const String title = 'Excluir chave';
    const String description =
        'Você deseja excluir essa chave?\n\nVocê não poderá mais pagar ou receber utilizando essa chave.';
    const String primaryButtonText = 'Excluir';
    const String secondaryButtonText = 'Cancelar';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: QBottomSheet.delete(
            behaviour: Behaviour.regular,
            title: title,
            description: description,
            textPrimaryButton: primaryButtonText,
            onPressedPrimaryButton: () {},
            textSecondaryButton: secondaryButtonText,
            onPressedSecondaryButton: () {},
          ),
        ),
      ),
    );

    // Verificar se o título e description estão presentes
    final titleFinder = find.text(title);
    expect(titleFinder, findsOneWidget);
    final descriptionFinder = find.text(description);
    expect(descriptionFinder, findsOneWidget);

    // Verificar se os QButtons estão presentes
    expect(find.byType(QButton), findsExactly(2));
  });

  testWidgets('Mostrar os componentes pertencentes ao bottom sheet de search', (tester) async {
    const String title = 'Natureza Jurídica';
    const String subtitle = 'Selecione a Natureza Jurídica de seu negócio';
    const String hint = 'Digite aqui o que você procura';
    const String label = 'Busca';

    final List<QRadionOptionsModel> initialOptions = [
      QRadionOptionsModel(title: 'Administrador'),
      QRadionOptionsModel(title: 'Conselho de Administração'),
      QRadionOptionsModel(title: 'Diretor'),
      QRadionOptionsModel(title: 'Presidente'),
      QRadionOptionsModel(title: 'Procurador'),
      QRadionOptionsModel(title: 'Secratário'),
      QRadionOptionsModel(title: 'Sociedade Consorciada'),
      QRadionOptionsModel(title: 'Sociedade Filiada'),
      QRadionOptionsModel(title: 'Sócio'),
    ];
    int? currentPosition;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: QBottomSheet.searchWithRadios(
            behaviour: Behaviour.regular,
            title: title,
            subtitle: subtitle,
            hint: hint,
            label: label,
            options: initialOptions,
            currentIndexOption: currentPosition,
            onSelect: (value) => currentPosition = value,
          ),
        ),
      ),
    );

    final titleFinder = find.text(title);
    expect(titleFinder, findsOneWidget);

    final subtitleFinder = find.text(subtitle);
    expect(subtitleFinder, findsOneWidget);

    final textfieldFinder = find.byType(QTextformfield);
    expect(textfieldFinder, findsOneWidget);

    final hintFinder = find.text(subtitle);
    expect(hintFinder, findsOneWidget);

    final labelFinder = find.text(subtitle);
    expect(labelFinder, findsOneWidget);

    expect(find.byType(Radio<int>), findsExactly(initialOptions.length));
  });

  testWidgets('Mostrar os componentes pertencentes ao bottom sheet de textfield', (tester) async {
    const String title = 'Insira uma mensagem';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: QBottomSheet.textField(
            behaviour: Behaviour.regular,
            title: title,
            textFormFieldHint: 'Digite a mensagem aqui',
            textFormFieldMaxLength: 140,
            buttonText: 'Concluir',
          ),
        ),
      ),
    );

    // Verificar se o título está presente
    expect(find.text(title), findsOneWidget);

    // Verificar se o Textformfield está presente
    expect(find.byType(QTextformfield), findsOneWidget);

    // Verificar se o QButtons esta presente
    expect(find.byType(QButton), findsOneWidget);
  });

  testWidgets('Mostrar os componentes pertencentes ao bottom sheet de listtile', (tester) async {
    const String title = 'Júlia Moreira';
    const String subtitle = 'Agência 0001 • Conta 12345678-9\nBanco 1234 • Terra Bank';
    bool wasClicked = false;

    final List<QListTile> options = [
      QListTile.standardTrailingSecondary0(
        title: 'Segurança',
        svgPathLeading: QTheme.svgs.security,
        svgPathTrailing: QTheme.svgs.arrowForward,
        behaviour: Behaviour.regular,
        onPressed: () => wasClicked = true,
      ),
      QListTile.standardTrailingSecondary0(
        title: 'Meus Limites',
        svgPathLeading: QTheme.svgs.adjust,
        svgPathTrailing: QTheme.svgs.arrowForward,
        behaviour: Behaviour.regular,
      ),
      QListTile.standardTrailingSecondary0(
        title: 'Notificações',
        svgPathLeading: QTheme.svgs.notifications,
        svgPathTrailing: QTheme.svgs.arrowForward,
        behaviour: Behaviour.regular,
      ),
      QListTile.standardTrailingSecondary0(
        title: 'Minha conta',
        svgPathLeading: QTheme.svgs.accountBox,
        svgPathTrailing: QTheme.svgs.arrowForward,
        behaviour: Behaviour.regular,
      ),
      QListTile.standardTrailingSecondary0(
        title: 'Políticas de privacidade',
        svgPathLeading: QTheme.svgs.article,
        svgPathTrailing: QTheme.svgs.arrowForward,
        behaviour: Behaviour.regular,
      ),
    ];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: QBottomSheet.listTileOptions(
            behaviour: Behaviour.regular,
            title: title,
            subtitle: subtitle,
            options: options,
          ),
        ),
      ),
    );

    // Verificar se o título e subtítulo estão presentes
    final titleFinder = find.text(title);
    expect(titleFinder, findsOneWidget);
    final subtitleFinder = find.text(subtitle);
    expect(subtitleFinder, findsOneWidget);

    // Verificar se os QListTile estão presentes
    final listTilesFinder = find.byType(QListTile);
    expect(listTilesFinder, findsExactly(options.length));

    // Verificar se está chamando corretamente a função do QListTile
    await tester.tap(listTilesFinder.first);
    await tester.pumpAndSettle();
    expect(wasClicked, isTrue);
  });
}
