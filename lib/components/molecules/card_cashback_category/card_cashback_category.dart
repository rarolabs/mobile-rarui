import 'package:flutter/material.dart';

import '../../../utils/interfaces/behaviour.dart';
import '../../atoms/atoms.dart';
import 'card_cashback_category_specs.dart';

class QCardCashbackCategory extends CardCashbackCategorySpecs {
  /// Style configurtion for [QCardIcon]
  final CardCashbackCategoryStyleSet style;

  QCardCashbackCategory.standard({
    super.key,
    required super.behaviour,
    required super.svgBase64,
    required String text,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = CardCashbackCategoryStyleSet.size72x72,
        super(
          styles: CardCashbackCategoryStyleSet.size72x72.build(),
          labelButton: QLabel.captionRoboto12Gray5Regular(
            behaviour: behaviour.isProcessing ? Behaviour.disabled : behaviour,
            text: text,
            maxLines: 1,
            textAlign: TextAlign.start,
            textOverflow: TextOverflow.ellipsis,
          ),
        );
}
