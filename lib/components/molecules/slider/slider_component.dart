import 'package:flutter/material.dart';

import '../../../shared_widget/loading_widget.dart';
import '../../../theme/sizes.dart';
import '../../../theme/tokens.dart';
import '../../../utils/enums/coin_type.dart';
import '../../../utils/extensions/num_extension.dart';
import '../../../utils/interfaces/behaviour.dart';
import '../../../utils/interfaces/style.dart';
import '../../../utils/mixin/component.dart';
import '../../atoms/atoms.dart';
import '../../atoms/label/label_specs.dart';
import 'slider_custom_thumb.dart';
import 'slider_style.dart';

class SliderComponent extends StatelessWidget with Component<SliderStyle, SliderSharedStyle> {
  /// Comportamento do componente, initial [Behaviour.regular]
  final Behaviour behaviour;

  /// Estilo do componente
  final SliderStyles styles;

  /// Estilo do texto
  final LabelStyleSet labelStyle;

  /// Definir valor mínimo do controle deslizante
  /// Este campo não pode conter um valor maior que o campo [maxValue]
  final double minValue;

  /// Neste campo, você pode definir uma formatação específica a ser exibida no início do controle deslizante.
  final CoinType coinType;

  /// Definir a posição atual do controle deslizante
  final double currentValue;

  /// Definir valor máximo do controle deslizante
  /// Este campo não pode conter um valor menor que o campo [minValue]
  final double maxValue;

  /// Definir divisões específicas dentro do controle deslizante
  final int? divisions;

  /// Retorno de chamada que retorna as alterações feitas no controle deslizante
  final void Function(double) onChanged;

  /// Hint de semântica do componente
  final String? hintSemantics;

  /// Label de semântica do componente
  final String? labelSemantics;

  const SliderComponent({
    super.key,
    required this.behaviour,
    required this.styles,
    required this.labelStyle,
    this.minValue = 0,
    this.coinType = CoinType.real,
    required this.currentValue,
    required this.maxValue,
    required this.onChanged,
    this.divisions,
    this.hintSemantics,
    this.labelSemantics,
  })  : assert(minValue <= maxValue),
        assert(
          currentValue >= minValue && currentValue <= maxValue,
          'Value $currentValue is not between minimum $minValue and maximum $maxValue',
        );

  @override
  Widget build(BuildContext context) {
    final style = Style<SliderStyle, SliderSharedStyle>(
      shared: styles.shared,
      regular: styles.regular,
      disabled: styles.disabled,
    );
    return render(context, behaviour, style);
  }

  @override
  Widget whenLoading(
    SliderStyle style,
    SliderSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) =>
      LoadingWidget(style: otherStyle.loadingStyle);

  @override
  Widget whenDisabled(
    SliderStyle style,
    SliderSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) =>
      _QSliderWidget(
        childBehaviour: childBehaviour,
        coinType: coinType,
        currentValue: currentValue,
        onChanged: onChanged,
        minValue: minValue,
        maxValue: maxValue,
        divisions: divisions,
        hintSemantics: hintSemantics,
        labelSemantics: labelSemantics,
        style: style,
        labelStyle: labelStyle,
      );

  @override
  Widget whenRegular(
    SliderStyle style,
    SliderSharedStyle otherStyle,
    BuildContext context,
    Behaviour childBehaviour,
  ) =>
      _QSliderWidget(
        childBehaviour: childBehaviour,
        coinType: coinType,
        currentValue: currentValue,
        onChanged: onChanged,
        minValue: minValue,
        maxValue: maxValue,
        divisions: divisions,
        hintSemantics: hintSemantics,
        labelSemantics: labelSemantics,
        style: style,
        labelStyle: labelStyle,
      );

  @override
  Map<Behaviour, Behaviour>? get delegate => {
        Behaviour.error: Behaviour.regular,
        Behaviour.processing: Behaviour.regular,
      };
}

class _QSliderWidget extends StatefulWidget {
  const _QSliderWidget({
    required this.childBehaviour,
    required this.coinType,
    required this.currentValue,
    required this.onChanged,
    required this.minValue,
    required this.maxValue,
    required this.divisions,
    required this.style,
    required this.labelStyle,
    this.hintSemantics,
    this.labelSemantics,
  });

  final CoinType coinType;
  final double currentValue;
  final void Function(double) onChanged;
  final double minValue;
  final double maxValue;
  final int? divisions;
  final String? hintSemantics;
  final String? labelSemantics;
  final Behaviour childBehaviour;
  final SliderStyle style;
  final LabelStyleSet labelStyle;

  @override
  State<_QSliderWidget> createState() => _QSliderWidgetState();
}

class _QSliderWidgetState extends State<_QSliderWidget> {
  late double _valueSlider;

  @override
  void initState() {
    _valueSlider = widget.currentValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.labelSemantics,
      hint: widget.hintSemantics,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              QLabel(
                style: widget.labelStyle,
                behaviour: widget.childBehaviour,
                text: widget.minValue.formattedMoney(widget.coinType),
              ),
              QLabel(
                style: widget.labelStyle,
                behaviour: widget.childBehaviour,
                text: widget.maxValue.formattedMoney(widget.coinType),
              ),
            ],
          ),
          SizedBox(
            height: QSizes.x24,
            child: SliderTheme(
              data: SliderThemeData(
                overlayColor: Colors.transparent,
                activeTrackColor: widget.style.activedColor,
                thumbColor: QTheme.colors.gray1,
                disabledThumbColor: QTheme.colors.gray1,
                trackHeight: QSizes.x8,
                tickMarkShape: SliderTickMarkShape.noTickMark,
                thumbShape: !widget.childBehaviour.isRegular
                    ? const RoundSliderThumbShape(enabledThumbRadius: QSizes.x4, elevation: 0)
                    : SliderCustomThumb(
                        thumbSize: QSizes.x4,
                        indicatorColor: widget.style.indicatorColor,
                      ),
              ),
              child: StatefulBuilder(
                builder: (context, setState) => Slider(
                  value: _valueSlider,
                  onChanged: !widget.childBehaviour.isRegular
                      ? null
                      : (v) {
                          _valueSlider = v;
                          widget.onChanged.call(v);
                          setState(() {});
                        },
                  min: widget.minValue,
                  max: widget.maxValue,
                  divisions: widget.divisions,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
