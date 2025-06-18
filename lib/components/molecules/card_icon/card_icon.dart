import 'package:flutter/material.dart';

import '../../../utils/interfaces/behaviour.dart';
import '../../atoms/atoms.dart';
import 'card_icon_specs.dart';

class QCardIcon extends CardIconSpecs {
  /// Style configurtion for [QCardIcon]
  final CardIconStyleSet style;

  QCardIcon.captionRoboto14size80x68({
    super.key,
    required super.behaviour,
    required super.svgPath,
    required String text,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = CardIconStyleSet.size80x68,
        super(
          styles: CardIconStyleSet.size80x68,
          labelButton: QLabel.captionRoboto14Gray5Regular(
            behaviour: behaviour.isProcessing ? Behaviour.disabled : behaviour,
            text: text,
            maxLines: 1,
            textOverflow: TextOverflow.ellipsis,
          ),
        );
  QCardIcon.captionRoboto14size80x68Error({
    super.key,
    required super.behaviour,
    required super.svgPath,
    required String text,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = CardIconStyleSet.size80x68Error,
        super(
          styles: CardIconStyleSet.size80x68Error,
          labelButton: QLabel.captionRoboto14ErrorRegular(
            behaviour: behaviour.isProcessing ? Behaviour.disabled : behaviour,
            text: text,
            maxLines: 1,
            textOverflow: TextOverflow.ellipsis,
          ),
        );

  QCardIcon.paragraphRoboto16size100x80({
    super.key,
    required super.behaviour,
    required super.svgPath,
    required String text,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = CardIconStyleSet.size100x80,
        super(
          styles: CardIconStyleSet.size100x80,
          labelButton: QLabel.paragraphRoboto16Gray5Regular(
            behaviour: behaviour.isProcessing ? Behaviour.disabled : behaviour,
            text: text,
            maxLines: 1,
            textOverflow: TextOverflow.ellipsis,
          ),
        );

  QCardIcon.captionRoboto14size100x80({
    super.key,
    required super.behaviour,
    required super.svgPath,
    required String text,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = CardIconStyleSet.size100x80,
        super(
          styles: CardIconStyleSet.size100x80,
          labelButton: QLabel.captionRoboto14Gray5Regular(
            behaviour: behaviour.isProcessing ? Behaviour.disabled : behaviour,
            text: text,
            maxLines: 2,
            textAlign: TextAlign.center,
            textOverflow: TextOverflow.ellipsis,
          ),
        );

  QCardIcon.paragraphRoboto16size108x88({
    super.key,
    required super.behaviour,
    required super.svgPath,
    required String text,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = CardIconStyleSet.size108x88,
        super(
          styles: CardIconStyleSet.size108x88,
          labelButton: QLabel.paragraphRoboto16Gray5Regular(
            behaviour: behaviour.isProcessing ? Behaviour.disabled : behaviour,
            text: text,
            maxLines: 2,
            textAlign: TextAlign.center,
            textOverflow: TextOverflow.ellipsis,
          ),
        );

  QCardIcon.paragraphRoboto16SizeExpansive({
    super.key,
    required super.behaviour,
    required super.svgPath,
    required String text,
    required int maxLinesLabelButton,
    super.onPressed,
    super.labelSemantics,
    super.hintSemantics,
  })  : style = CardIconStyleSet.sizeExpansive,
        super(
          styles: CardIconStyleSet.sizeExpansive,
          labelButton: QLabel.paragraphRoboto16Gray5Regular(
            behaviour: behaviour.isProcessing ? Behaviour.disabled : behaviour,
            text: text,
            maxLines: maxLinesLabelButton,
            textOverflow: TextOverflow.ellipsis,
          ),
        );
}
