import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/templates/key_pix/key_pix_template.dart';
import 'package:rarUI/components/templates/key_pix/models/list_tile_options_model.dart';

void main() {
  testWidgets(
    'Deve exibir título, descrição, status, ícones, itens cadastrados, opções e acionar onTap',
    (WidgetTester tester) async {
      // Flags para verificar se o onTap foi chamado
      bool onTapOpcoesChamado = false;
      bool onTapCadastradoChamado = false;

      // Dados de teste
      const titulo = 'Minhas chaves Pix';
      const descricao = 'Gerencie suas chaves de forma simples';
      const status = 'status';

      final iconeOpcao = const Icon(Icons.add, key: Key('icone_opcao'));
      final iconeCadastrado = const Icon(Icons.email, key: Key('icone_cadastrado'));

      final itensOpcoes = [
        ListTileOptionsModel(
          title: 'Cadastrar chave',
          subtitle: 'Cadastre uma nova chave Pix',
          leadingIcon: iconeOpcao,
          trailingIcon: const Icon(Icons.arrow_forward_ios, key: Key('icone_trailing_opcao')),
          onTap: () => onTapOpcoesChamado = true,
        ),
      ];

      final itensCadastrados = [
        ListTileOptionsModel(
          title: 'E-mail',
          subtitle: 'exemplo@email.com',
          leadingIcon: iconeCadastrado,
          trailingIcon: const Icon(Icons.more_vert, key: Key('icone_trailing_cadastrado')),
          onTap: () => onTapCadastradoChamado = true,
        ),
      ];

      // Monta o widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RKeyPixTemplate(
              title: titulo,
              description: descricao,
              itemsRegistrationStatus: status,
              itemsOptions: itensOpcoes,
              itemsRegistered: itensCadastrados,
            ),
          ),
        ),
      );

      // Verificações visuais
      expect(find.text(titulo), findsOneWidget);
      expect(find.text(descricao), findsOneWidget);
      expect(find.text('Cadastrar chave'), findsOneWidget);
      expect(find.text('Cadastre uma nova chave Pix'), findsOneWidget);
      expect(find.text('1 de 5 chaves cadastradas'), findsOneWidget);
      expect(find.text('E-mail'), findsOneWidget);
      expect(find.text('exemplo@email.com'), findsOneWidget);

      // Verifica ícones
      expect(find.byKey(Key('icone_opcao')), findsOneWidget);
      expect(find.byKey(Key('icone_trailing_opcao')), findsOneWidget);
      expect(find.byKey(Key('icone_cadastrado')), findsOneWidget);
      expect(find.byKey(Key('icone_trailing_cadastrado')), findsOneWidget);

      // Toca nas opções e nos cadastrados
      await tester.tap(find.text('Cadastrar chave'));
      await tester.tap(find.text('E-mail'));
      await tester.pumpAndSettle();

      // Verifica se onTap foi chamado
      expect(onTapOpcoesChamado, isTrue);
      expect(onTapCadastradoChamado, isTrue);
    },
  );
}
