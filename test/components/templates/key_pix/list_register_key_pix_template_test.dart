import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/templates/key_pix/list_register_key_pix_template.dart';
import 'package:rarUI/components/templates/key_pix/models/list_tile_options_model.dart';

void main() {
  testWidgets(
    'Deve exibir título, descrição, ícones, itens cadastrados e acionar onTap',
    (WidgetTester tester) async {
      // Flags para verificar se o onTap foi chamado
      bool onTapCadastrarEmail = false;
      bool onTapCadastrarCpf = false;

      // Dados de teste
      const titulo = 'Cadastrar chave';
      const descricao =
          'Cadastre suas chaves para realizar transferências pelo Pix.';

      final iconeEmail = const Icon(Icons.email, key: Key('icone_email'));
      final iconeCpf =
          const Icon(Icons.last_page_outlined, key: Key('icone_cpf'));

      final itensOpcoes = [
        ListTileOptionsModel(
          title: 'E-mail',
          leadingIcon: iconeEmail,
          trailingIcon: const Icon(Icons.arrow_forward_ios,
              key: Key('icone_trailing_email')),
          onTap: () => onTapCadastrarEmail = true,
        ),
        ListTileOptionsModel(
          title: 'Cpf',
          leadingIcon: iconeCpf,
          trailingIcon: const Icon(Icons.arrow_forward_ios,
              key: Key('icone_trailing_cpf')),
          onTap: () => onTapCadastrarCpf = true,
        ),
      ];

      // Monta o widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RListRegisterKeyPixTemplate(
              title: titulo,
              description: descricao,
              itemsOptions: itensOpcoes,
            ),
          ),
        ),
      );

      // Verificações visuais
      expect(find.text(titulo), findsOneWidget);
      expect(find.text(descricao), findsOneWidget);
      expect(find.text('Cadastrar chave'), findsOneWidget);
      expect(
          find.text(
              'Cadastre suas chaves para realizar transferências pelo Pix.'),
          findsOneWidget);
      expect(find.text('E-mail'), findsOneWidget);
      expect(find.text('Cpf'), findsOneWidget);

      // Verifica ícones
      expect(find.byKey(Key('icone_email')), findsOneWidget);
      expect(find.byKey(Key('icone_trailing_email')), findsOneWidget);
      expect(find.byKey(Key('icone_cpf')), findsOneWidget);
      expect(find.byKey(Key('icone_trailing_cpf')), findsOneWidget);

      // Toca nas opções e nos cadastrados
      await tester.tap(find.text('Cpf'));
      await tester.tap(find.text('E-mail'));
      await tester.pumpAndSettle();

      // Verifica se onTap foi chamado
      expect(onTapCadastrarEmail, isTrue);
      expect(onTapCadastrarCpf, isTrue);
    },
  );
}
