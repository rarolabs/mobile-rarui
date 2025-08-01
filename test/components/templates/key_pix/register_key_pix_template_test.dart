import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/atoms/text_field/text_form_field.dart';
import 'package:rarUI/components/molecules/list_tile/list_tile.dart';
import 'package:rarUI/components/templates/key_pix/register_key_pix_template.dart';
import 'package:rarUI/utils/enums/key_pix_type.dart';

void main() {
  testWidgets(
    'Deve validar template com o KeyPixType.email',
    (WidgetTester tester) async {
      final TextEditingController _controller = TextEditingController();
      final GlobalKey<dynamic> _formKey = GlobalKey();
      // Dados de teste
      const titulo = 'Cadastrar chave Email';
      const descricao = 'Digite o Email que será cadastrado a chave Pix.';
      const textButton = 'Continuar';
      const textHint = 'Digite aqui o email';
      const labelTitle = 'Email';
      const validationText = 'Email inválido.';
      final onPressed = () {
        if (_formKey.currentState!.validate()) {
          Text('Continuar Email ${_controller.value.text}');
        }
      };

      // Monta o widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RRegisterKeyPixTemplate(
              title: titulo,
              description: descricao,
              labelTitle: labelTitle,
              textHint: textHint,
              textButton: textButton,
              formKey: _formKey,
              controller: _controller,
              onPressed: onPressed,
              keyPix: KeyPixType.email,
              validationText: validationText,
            ),
          ),
        ),
      );

      // Verificações visuais
      expect(find.text('Cadastrar chave Email'), findsOneWidget);
      expect(find.text('Digite o Email que será cadastrado a chave Pix.'),
          findsOneWidget);
      expect(find.text('Continuar'), findsOneWidget);
      expect(find.text('Digite aqui o email'), findsOneWidget);

      // Pressiona botão Continuar e recebe erro de validação
      await tester.tap(find.text('Continuar'));
      await tester.pumpAndSettle();
      expect(find.text('Email inválido.'), findsOneWidget);

      final Finder inputField = find.byType(RTextFormField);
      await tester.enterText(inputField, 'e@e');
      await tester.tap(find.text('Continuar'));
      await tester.pumpAndSettle();
      expect(find.text('Email inválido.'), findsOneWidget);

      // Pressiona botão Continuar e passa na validação
      await tester.enterText(inputField, 'e@e.com');
      await tester.tap(find.text('Continuar'));
      await tester.pumpAndSettle();
      expect(find.text('Email inválido.'), findsNothing);
    },
  );

  testWidgets(
    'Deve validar template com o KeyPixType.phone',
    (WidgetTester tester) async {
      final TextEditingController _controller = TextEditingController();
      final GlobalKey<dynamic> _formKey = GlobalKey();
      // Dados de teste
      const titulo = 'Cadastrar chave Telefone';
      const descricao = 'Digite o Telefone que será cadastrado a chave Pix.';
      const textButton = 'Continuar';
      const textHint = 'Digite aqui o telefone';
      const labelTitle = 'Telefone';
      const validationText = 'Telefone inválido.';
      final onPressed = () {
        if (_formKey.currentState!.validate()) {
          Text('Continuar Telefone ${_controller.value.text}');
        }
      };

      // Monta o widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RRegisterKeyPixTemplate(
              title: titulo,
              description: descricao,
              labelTitle: labelTitle,
              textHint: textHint,
              textButton: textButton,
              formKey: _formKey,
              controller: _controller,
              onPressed: onPressed,
              keyPix: KeyPixType.phone,
              validationText: validationText,
            ),
          ),
        ),
      );

      // Verificações visuais
      expect(find.text('Cadastrar chave Telefone'), findsOneWidget);
      expect(find.text('Digite o Telefone que será cadastrado a chave Pix.'),
          findsOneWidget);
      expect(find.text('Continuar'), findsOneWidget);
      expect(find.text('Digite aqui o telefone'), findsOneWidget);

      // Pressiona botão Continuar e recebe erro de validação
      await tester.tap(find.text('Continuar'));
      await tester.pumpAndSettle();
      expect(find.text('Telefone inválido.'), findsOneWidget);

      final Finder inputField = find.byType(RTextFormField);
      await tester.enterText(inputField, '00000000001');
      await tester.tap(find.text('Continuar'));
      await tester.pumpAndSettle();
      expect(find.text('Telefone inválido.'), findsOneWidget);

      // Pressiona botão Continuar e passa na validação
      await tester.enterText(inputField, '88988888888');
      await tester.tap(find.text('Continuar'));
      await tester.pumpAndSettle();
      expect(find.text('Telefone inválido.'), findsNothing);
    },
  );

  testWidgets(
    'Deve validar template com o KeyPixType.cpf',
    (WidgetTester tester) async {
      final TextEditingController _controller = TextEditingController();
      final GlobalKey<dynamic> _formKey = GlobalKey();
      // Dados de teste
      const titulo = 'Cadastrar chave CPF';
      const descricao = 'Digite o CPF que será cadastrado a chave Pix.';
      const textButton = 'Continuar';
      const textHint = 'Digite aqui o cpf';
      const labelTitle = 'CPF';
      const validationText = 'CPF inválido.';
      final onPressed = () {
        if (_formKey.currentState!.validate()) {
          Text('Continuar Cpf ${_controller.value.text}');
        }
      };

      // Monta o widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RRegisterKeyPixTemplate(
              title: titulo,
              description: descricao,
              labelTitle: labelTitle,
              textHint: textHint,
              textButton: textButton,
              formKey: _formKey,
              controller: _controller,
              onPressed: onPressed,
              keyPix: KeyPixType.cpf,
              validationText: validationText,
            ),
          ),
        ),
      );

      // Verificações visuais
      expect(find.text('Cadastrar chave CPF'), findsOneWidget);
      expect(find.text('Digite o CPF que será cadastrado a chave Pix.'),
          findsOneWidget);
      expect(find.text('Continuar'), findsOneWidget);
      expect(find.text('Digite aqui o cpf'), findsOneWidget);

      // Pressiona botão Continuar e recebe erro de validação
      await tester.tap(find.text('Continuar'));
      await tester.pumpAndSettle();
      expect(find.text('CPF inválido.'), findsOneWidget);

      final Finder inputField = find.byType(RTextFormField);
      await tester.enterText(inputField, '00000000001');
      await tester.tap(find.text('Continuar'));
      await tester.pumpAndSettle();
      expect(find.text('CPF inválido.'), findsOneWidget);

      // Pressiona botão Continuar e passa na validação
      await tester.enterText(inputField, '74141325015');
      await tester.tap(find.text('Continuar'));
      await tester.pumpAndSettle();
      expect(find.text('CPF inválido.'), findsNothing);
    },
  );

  testWidgets(
    'Deve validar template com o KeyPixType.cnpj',
    (WidgetTester tester) async {
      final TextEditingController _controller = TextEditingController();
      final GlobalKey<dynamic> _formKey = GlobalKey();
      // Dados de teste
      const titulo = 'Cadastrar chave CNPJ';
      const descricao = 'Digite o CNPJ que será cadastrado a chave Pix.';
      const textButton = 'Continuar';
      const textHint = 'Digite aqui o cnpj';
      const labelTitle = 'CNPJ';
      const validationText = 'CNPJ inválido.';
      final onPressed = () {
        if (_formKey.currentState!.validate()) {
          Text('Continuar Cnpj ${_controller.value.text}');
        }
      };

      // Monta o widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RRegisterKeyPixTemplate(
              title: titulo,
              description: descricao,
              labelTitle: labelTitle,
              textHint: textHint,
              textButton: textButton,
              formKey: _formKey,
              controller: _controller,
              onPressed: onPressed,
              keyPix: KeyPixType.cnpj,
              validationText: validationText,
            ),
          ),
        ),
      );

      // Verificações visuais
      expect(find.text('Cadastrar chave CNPJ'), findsOneWidget);
      expect(find.text('Digite o CNPJ que será cadastrado a chave Pix.'),
          findsOneWidget);
      expect(find.text('Continuar'), findsOneWidget);
      expect(find.text('Digite aqui o cnpj'), findsOneWidget);

      // Pressiona botão Continuar e recebe erro de validação
      await tester.tap(find.text('Continuar'));
      await tester.pumpAndSettle();
      expect(find.text('CNPJ inválido.'), findsOneWidget);

      final Finder inputField = find.byType(RTextFormField);
      await tester.enterText(inputField, '00000000001');
      await tester.tap(find.text('Continuar'));
      await tester.pumpAndSettle();
      expect(find.text('CNPJ inválido.'), findsOneWidget);

      // Pressiona botão Continuar e passa na validação
      await tester.enterText(inputField, '39248406000123');
      await tester.tap(find.text('Continuar'));
      await tester.pumpAndSettle();
      expect(find.text('CNPJ inválido.'), findsNothing);
    },
  );

  testWidgets(
    'Deve validar template com o KeyPixType.cnpj',
    (WidgetTester tester) async {
      final TextEditingController _controller = TextEditingController();
      final GlobalKey<dynamic> _formKey = GlobalKey();
      // Dados de teste
      const titulo = 'Cadastrar chave CNPJ';
      const descricao = 'Digite o CNPJ que será cadastrado a chave Pix.';
      const textButton = 'Continuar';
      const textHint = 'Digite aqui o cnpj';
      const labelTitle = 'CNPJ';
      const validationText = 'CNPJ inválido.';
      final onPressed = () {
        if (_formKey.currentState!.validate()) {
          Text('Continuar Cpf ${_controller.value.text}');
        }
      };

      // Monta o widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RRegisterKeyPixTemplate(
              title: titulo,
              description: descricao,
              labelTitle: labelTitle,
              textHint: textHint,
              textButton: textButton,
              formKey: _formKey,
              controller: _controller,
              onPressed: onPressed,
              keyPix: KeyPixType.cnpj,
              validationText: validationText,
            ),
          ),
        ),
      );

      // Verificações visuais
      expect(find.text('Cadastrar chave CNPJ'), findsOneWidget);
      expect(find.text('Digite o CNPJ que será cadastrado a chave Pix.'),
          findsOneWidget);
      expect(find.text('Continuar'), findsOneWidget);
      expect(find.text('Digite aqui o cnpj'), findsOneWidget);

      // Pressiona botão Continuar e recebe erro de validação
      await tester.tap(find.text('Continuar'));
      await tester.pumpAndSettle();
      expect(find.text('CNPJ inválido.'), findsOneWidget);

      final Finder inputField = find.byType(RTextFormField);
      await tester.enterText(inputField, '00000000001');
      await tester.tap(find.text('Continuar'));
      await tester.pumpAndSettle();
      expect(find.text('CNPJ inválido.'), findsOneWidget);

      // Pressiona botão Continuar e passa na validação
      await tester.enterText(inputField, '39248406000123');
      await tester.tap(find.text('Continuar'));
      await tester.pumpAndSettle();
      expect(find.text('CNPJ inválido.'), findsNothing);
    },
  );

  testWidgets(
    'Deve validar template com o KeyPixType.random',
    (WidgetTester tester) async {
      final TextEditingController _controller = TextEditingController();
      final GlobalKey<dynamic> _formKey = GlobalKey();
      // Dados de teste
      const labelTitle = 'Chave aleatória';
      const titulo = 'Cadastrar chave aleatória';
      const descricao =
          'Clique em continuar para gerar uma chave aleatória para transferências e recebimentos Pix.';
      const textButton = 'Continuar';
      final onPressed = () {
        Text('Continuar chave aleatória.');
      };

      // Monta o widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RRegisterKeyPixTemplate(
              title: titulo,
              description: descricao,
              labelTitle: labelTitle,
              listTileIcon: Icon(Icons.shuffle),
              textButton: textButton,
              formKey: _formKey,
              controller: _controller,
              onPressed: onPressed,
              keyPix: KeyPixType.random,
            ),
          ),
        ),
      );

      // Verificações visuais
      expect(find.text('Chave aleatória'), findsOneWidget);
      expect(find.text('Cadastrar chave aleatória'), findsOneWidget);
      expect(find.widgetWithIcon(RListTile, Icons.shuffle), findsOneWidget);
      expect(find.text('Continuar'), findsOneWidget);
      expect(
          find.text(
              'Clique em continuar para gerar uma chave aleatória para transferências e recebimentos Pix.'),
          findsOneWidget);

      // Pressiona botão Continuar e passa na validação
      await tester.tap(find.text('Continuar'));
      await tester.pumpAndSettle();
    },
  );
}
