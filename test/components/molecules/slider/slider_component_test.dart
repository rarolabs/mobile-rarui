import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarUI/components/atoms/label/label_specs.dart';
import 'package:rarUI/components/molecules/slider/slider_component.dart';
import 'package:rarUI/components/molecules/slider/slider_specs.dart';
import 'package:rarUI/rarui.dart';
import 'package:rarUI/shared_widget/loading_widget.dart';
import 'package:rarUI/utils/enums/coin_type.dart';

void main() {
  testWidgets('Mostrar os parametros corretos no componente e movimentando o slider', (tester) async {
    // Mock dos valores usados no widget
    const double minValue = 0;
    const double initialCurrentValue = 5;
    const double maxValue = 10;
    const int divisions = 10;
    double currentValue = initialCurrentValue;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SliderComponent(
            behaviour: Behaviour.regular,
            styles: SliderSet.primary.build(),
            labelStyle: LabelStyleSet.captionRoboto12Gray5Regular,
            minValue: minValue,
            coinType: CoinType.real,
            currentValue: currentValue,
            maxValue: maxValue,
            onChanged: (value) => currentValue = value,
            divisions: divisions,
          ),
        ),
      ),
    );

    // Verificar se os labels mínimos e máximos estão presentes com os valores corretos
    expect(find.byType(QLabel), findsExactly(2));

    // Verificar se o slider está presente
    expect(find.byType(Slider), findsOneWidget);

    // Simular movimentação do slider
    final slider = find.byType(Slider);
    await tester.drag(slider, const Offset(100, 0)); // Move o slider para frente
    await tester.pump();

    // Verifica se o valor do slider foi alterado
    expect(currentValue != initialCurrentValue, isTrue);
  });

  testWidgets('Exibir componente slider disabled', (tester) async {
    // Mock dos valores usados no widget
    const double minValue = 0;
    const double initialCurrentValue = 5;
    const double maxValue = 10;
    const int divisions = 10;
    double currentValue = initialCurrentValue;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SliderComponent(
            behaviour: Behaviour.disabled,
            styles: SliderSet.primary.build(),
            labelStyle: LabelStyleSet.captionRoboto12Gray5Regular,
            minValue: minValue,
            coinType: CoinType.real,
            currentValue: currentValue,
            maxValue: maxValue,
            onChanged: (value) => currentValue = value,
            divisions: divisions,
          ),
        ),
      ),
    );

    // Verificar se os labels mínimos e máximos estão presentes com os valores corretos
    expect(find.byType(QLabel), findsExactly(2));

    // Verificar se o slider está presente
    expect(find.byType(Slider), findsOneWidget);

    // Simular movimentação do slider
    final slider = find.byType(Slider);
    await tester.drag(slider, const Offset(100, 0)); // Move o slider para frente
    await tester.pump();

    // Verifica se o valor do slider não foi alterado
    expect(currentValue == initialCurrentValue, isTrue);
  });

  testWidgets('Exibir componente loading do slider', (tester) async {
    // Mock dos valores usados no widget
    const double minValue = 0;
    const double initialCurrentValue = 5;
    const double maxValue = 10;
    const int divisions = 10;
    double currentValue = initialCurrentValue;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SliderComponent(
            behaviour: Behaviour.loading,
            styles: SliderSet.primary.build(),
            labelStyle: LabelStyleSet.captionRoboto12Gray5Regular,
            minValue: minValue,
            coinType: CoinType.real,
            currentValue: currentValue,
            maxValue: maxValue,
            onChanged: (value) => currentValue = value,
            divisions: divisions,
          ),
        ),
      ),
    );

    // Verificar se os labels mínimos e máximos não estão presentes
    expect(find.byType(QLabel), findsNothing);

    // Verificar se o slider não está presente
    expect(find.byType(Slider), findsNothing);

    // Verificar se o loading está presente
    expect(find.byType(LoadingWidget), findsOneWidget);
  });
}
