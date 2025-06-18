import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';

import '../../../rarui.dart';
import '../../../shared_widget/dashed_border.dart';
import '../../atoms/label/label_specs.dart';
import 'bottom_sheet_specs.dart';

part 'bottom_sheet_search/bottom_sheet_search_radio.dart';
part 'bottom_sheet_search/bottom_sheet_search_radio_title_first.dart';
part 'bottom_sheet_search/bottom_sheet_search_text.dart';

class QBottomSheet extends BottomSheetSpecs {
  /// Style configuration for [QBottomSheet]
  final BottomSheetSet style;

  /// Bottom sheet default
  const QBottomSheet({
    super.key,
    required this.style,
    required super.behaviour,
    required super.title,
    required super.content,
    super.titleAlign,
    required super.primaryButton,
    super.secondaryButton,
  }) : super(styles: style);

  /// Bottom sheet somente com um ícone do conteúdo
  QBottomSheet.icon({
    super.key,
    required super.behaviour,
    required super.title,
    super.titleAlign = TextAlign.center,
    required String svgPath,
    required String textPrimaryButton,
    required VoidCallback onPressedPrimaryButton,
    String? textSecondaryButton,
    VoidCallback? onPressedSecondaryButton,
  })  : style = BottomSheetSet.standard,
        super(
          styles: BottomSheetSet.standard,
          content: [Center(child: QIcon.size130Gray5(behaviour: behaviour, svgPath: svgPath))],
          primaryButton: QButton.primaryBase(
            behaviour: behaviour,
            onPressed: onPressedPrimaryButton,
            text: textPrimaryButton,
          ),
          secondaryButton: textSecondaryButton == null || onPressedSecondaryButton == null
              ? null
              : QButton.secondaryBase(
                  behaviour: behaviour,
                  onPressed: onPressedSecondaryButton,
                  text: textSecondaryButton,
                ),
        );

  /// Bottomsheet com imagem ao centro
  QBottomSheet.image({
    super.key,
    required super.behaviour,
    required super.title,
    super.titleAlign = TextAlign.center,
    required String svgPath,
    required String textPrimaryButton,
    required VoidCallback onPressedPrimaryButton,
    String? textSecondaryButton,
    VoidCallback? onPressedSecondaryButton,
  })  : style = BottomSheetSet.standard,
        super(
          styles: BottomSheetSet.standard,
          content: [Center(child: QImage.standard(behaviour: behaviour, path: svgPath))],
          primaryButton: QButton.primaryBase(
            behaviour: behaviour,
            onPressed: onPressedPrimaryButton,
            text: textPrimaryButton,
          ),
          secondaryButton: textSecondaryButton == null || onPressedSecondaryButton == null
              ? null
              : QButton.secondaryBase(
                  behaviour: behaviour,
                  onPressed: onPressedSecondaryButton,
                  text: textSecondaryButton,
                ),
        );

  /// Bottom sheet com QLabel no conteúdo
  QBottomSheet.text({
    super.key,
    required super.behaviour,
    required super.title,
    super.titleAlign,
    required String text,
    required String textPrimaryButton,
    required VoidCallback onPressedPrimaryButton,
    String? textSecondaryButton,
    VoidCallback? onPressedSecondaryButton,
  })  : style = BottomSheetSet.standard,
        super(
          styles: BottomSheetSet.standard,
          content: [QLabel.captionRoboto14Gray5Regular(behaviour: behaviour, text: text, textAlign: TextAlign.start)],
          primaryButton: QButton.primaryBase(
            behaviour: behaviour,
            onPressed: onPressedPrimaryButton,
            text: textPrimaryButton,
          ),
          secondaryButton: textSecondaryButton == null || onPressedSecondaryButton == null
              ? null
              : QButton.secondaryBase(
                  behaviour: behaviour,
                  onPressed: onPressedSecondaryButton,
                  text: textSecondaryButton,
                ),
        );

  /// Bottom sheet com uma lista de radiobuttons no conteúdo
  QBottomSheet.radio({
    super.key,
    required super.behaviour,
    super.title,
    String? subtitle,
    required List<QRadionOptionsModel> options,
    required void Function(int) onChanged,
    int? currentIndexOption,
    double? spacingRadios,
  })  : style = BottomSheetSet.radio,
        super(
          styles: BottomSheetSet.radio,
          content: [
            Column(
              spacing: spacingRadios ?? QSizes.x8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (subtitle != null) ...[
                  QLabel.captionRoboto14Gray5Regular(
                    behaviour: behaviour,
                    text: subtitle,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: QSizes.x16),
                ],
                QRadioButton.standard(
                  onChanged: onChanged,
                  behaviour: behaviour,
                  options: options,
                  initialOption: currentIndexOption,
                ),
              ],
            ),
          ],
        );

  /// Bottom sheet com os componentes de delete
  QBottomSheet.delete({
    super.key,
    required super.behaviour,
    required super.title,
    required String description,
    required String textPrimaryButton,
    required VoidCallback onPressedPrimaryButton,
    required String textSecondaryButton,
    required VoidCallback onPressedSecondaryButton,
  })  : style = BottomSheetSet.delete,
        super(
          styles: BottomSheetSet.delete,
          content: [
            QLabel.captionRoboto14Gray5Regular(behaviour: behaviour, text: description, textAlign: TextAlign.left),
          ],
          primaryButton: QButton.primaryRed(
            behaviour: behaviour,
            onPressed: onPressedPrimaryButton,
            text: textPrimaryButton,
          ),
          secondaryButton: QButton.secondaryBase(
            behaviour: behaviour,
            onPressed: onPressedSecondaryButton,
            text: textSecondaryButton,
          ),
        );

  /// Bottom sheet com os componentes de manage
  QBottomSheet.manage({
    super.key,
    required super.behaviour,
    required super.title,
    required String description,
    required String textPrimaryButton,
    required VoidCallback onPressedPrimaryButton,
    required String textSecondaryButton,
    required VoidCallback onPressedSecondaryButton,
  })  : style = BottomSheetSet.delete,
        super(
          styles: BottomSheetSet.delete,
          content: [
            QLabel.captionRoboto14Gray5Regular(behaviour: behaviour, text: description, textAlign: TextAlign.left),
          ],
          primaryButton: QButton.primaryLight(
            behaviour: behaviour,
            onPressed: onPressedPrimaryButton,
            text: textPrimaryButton,
          ),
          secondaryButton: QButton.secondaryBase(
            behaviour: behaviour,
            onPressed: onPressedSecondaryButton,
            text: textSecondaryButton,
          ),
        );

  /// Bottom sheet com os componentes de calendário
  QBottomSheet.calendar({
    super.key,
    required super.behaviour,
    Locale? locale,
    DateTime? firstDate,
    DateTime? currentDate,
    DateTime? lastDate,
    String? hintSemantics,
    String? labelSemantics,
    void Function(DateTime?)? onSelectedDate,
  })  : style = BottomSheetSet.calendar,
        super(
          styles: BottomSheetSet.calendar,
          content: [
            QCalendar.standard(
              behaviour: behaviour,
              locale: locale,
              firstDate: firstDate,
              currentDate: currentDate,
              lastDate: lastDate,
              onSelectedDate: onSelectedDate,
              hintSemantics: hintSemantics,
              labelSemantics: labelSemantics,
            ),
          ],
        );

  /// Bottom sheet com os componentes de calendário
  QBottomSheet.calendarDisabledWeekends({
    super.key,
    required super.behaviour,
    Locale? locale,
    DateTime? firstDate,
    DateTime? currentDate,
    DateTime? lastDate,
    DateTime? lastDateCanBeSelected,
    String? hintSemantics,
    String? labelSemantics,
    void Function(DateTime?)? onSelectedDate,
  })  : style = BottomSheetSet.calendar,
        super(
          styles: BottomSheetSet.calendar,
          content: [
            QCalendar.standardDisabledWeekends(
              behaviour: behaviour,
              locale: locale,
              firstDate: firstDate,
              currentDate: currentDate,
              lastDate: lastDate,
              onSelectedDate: onSelectedDate,
              lastDateCanBeSelected: lastDateCanBeSelected,
              hintSemantics: hintSemantics,
              labelSemantics: labelSemantics,
            ),
          ],
        );

  /// Bottom sheet com os componentes de pesquisa com radio options
  QBottomSheet.searchWithRadios({
    super.key,
    required super.behaviour,
    required String title,
    required String subtitle,
    required String hint,
    required String label,
    required List<QRadionOptionsModel> options,
    required void Function(int) onSelect,
    int? currentIndexOption,
  })  : style = BottomSheetSet.search,
        super(
          styles: BottomSheetSet.search,
          content: [
            _SearchWithRadiosBottomSheet(
              behaviour: behaviour,
              titleStyle: LabelStyleSet.h5Lato20Gray5Bold,
              title: title,
              subtitle: subtitle,
              subtitleStyle: LabelStyleSet.captionRoboto14Gray5Regular,
              hint: hint,
              label: label,
              options: options,
              onSelect: onSelect,
              currentIndexOption: currentIndexOption,
            ),
          ],
        );

  /// Bottom sheet com os componentes de pesquisa com radio options
  /// Porem esse nao tem [subtitle] e o [title] é exibido no topo
  QBottomSheet.searchWithRadiosTitleFirst({
    super.key,
    required super.behaviour,
    required String title,
    required String hint,
    required String label,
    required List<QRadionOptionsModel> options,
    required void Function(int) onSelect,
    int? currentIndexOption,
  })  : style = BottomSheetSet.search,
        super(
          styles: BottomSheetSet.search,
          content: [
            _BottomSheetSearchRadioTitleFirst(
              behaviour: behaviour,
              titleStyle: LabelStyleSet.h5Lato20Gray5Bold,
              title: title,
              hint: hint,
              label: label,
              options: options,
              onSelect: onSelect,
              currentIndexOption: currentIndexOption,
            ),
          ],
        );

  /// Bottom sheet com os componentes de pesquisa com listtile options
  QBottomSheet.searchWithText({
    super.key,
    required super.behaviour,
    required String title,
    required String subtitle,
    required String hint,
    required String label,
    required List<String> options,
    required void Function(int) onSelect,
  })  : style = BottomSheetSet.search,
        super(
          styles: BottomSheetSet.search,
          content: [
            _SearchWithTextBottomSheet(
              behaviour: behaviour,
              titleStyle: LabelStyleSet.h5Lato20Gray5Bold,
              title: title,
              subtitle: subtitle,
              subtitleStyle: LabelStyleSet.captionRoboto14Gray5Regular,
              hint: hint,
              label: label,
              options: options,
              onSelect: onSelect,
            ),
          ],
        );

  /// Bottom sheet com os campo de edição de texto
  QBottomSheet.textField({
    super.key,
    required super.behaviour,
    required String title,
    required String buttonText,
    TextEditingController? textFormFieldController,
    String? textFormFieldLabel,
    String? textFormFieldHint,
    int? textFormFieldMaxLength,
    String? textFormFieldInitialValue,
    void Function(String value)? textFormFieldOnChanged,
    VoidCallback? primaryButtonOnPressed,
    FocusNode? focusNode,
  })  : style = BottomSheetSet.calendar,
        super(
          styles: BottomSheetSet.calendar,
          content: [
            QLabel.h5Lato20Gray5Bold(
              behaviour: behaviour,
              text: title,
            ),
            const SizedBox(height: QSizes.x28),
            QTextformfield.standard(
              behaviour: behaviour,
              controller: textFormFieldController,
              label: textFormFieldLabel,
              hint: textFormFieldHint,
              maxLength: textFormFieldMaxLength,
              initialValue: textFormFieldInitialValue,
              onChanged: textFormFieldOnChanged,
              fieldState: TextFieldStates.regular,
              focusNode: focusNode,
            ),
          ],
          primaryButton: QButton.primaryBase(
            behaviour: behaviour,
            onPressed: primaryButtonOnPressed,
            text: buttonText,
          ),
        );

  /// Bottom sheet com uma lista de listtile no conteúdo
  QBottomSheet.listTileOptions({
    super.key,
    required super.behaviour,
    String? title,
    String? subtitle,
    CrossAxisAlignment? titleAlignment,
    required List<QListTile> options,
  })  : style = BottomSheetSet.listTile,
        super(
          styles: BottomSheetSet.listTile,
          content: [
            Column(
              crossAxisAlignment: titleAlignment ?? CrossAxisAlignment.start,
              children: [
                if (title?.isNotEmpty ?? false)
                  QLabel.h5Lato20Gray5Bold(
                    behaviour: behaviour,
                    text: title,
                  ),
                if (title?.isNotEmpty ?? false) const SizedBox(height: QSizes.x8),
                if (subtitle?.isNotEmpty ?? false)
                  QLabel.captionRoboto14Gray5Regular(
                    behaviour: behaviour,
                    text: subtitle,
                  ),
                if (subtitle?.isNotEmpty ?? false) const SizedBox(height: QSizes.x16),
                ...options,
              ],
            ),
          ],
        );

  /// Bottom sheet com uma lista de listtile no conteúdo titulo h5
  QBottomSheet.listTileOptionsh5Title({
    super.key,
    required super.behaviour,
    String? title,
    String? subtitle,
    required List<QListTile> options,
  })  : style = BottomSheetSet.listTile,
        super(
          styles: BottomSheetSet.listTile,
          content: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title?.isNotEmpty ?? false)
                  QLabel.h5Lato20Gray5Bold(
                    behaviour: behaviour,
                    text: title,
                  ),
                if (title?.isNotEmpty ?? false) const SizedBox(height: QSizes.x8),
                if (subtitle?.isNotEmpty ?? false)
                  QLabel.captionRoboto14Gray4Regular(
                    behaviour: behaviour,
                    text: subtitle,
                  ),
                if (subtitle?.isNotEmpty ?? false) const SizedBox(height: QSizes.x16),
                ...options,
              ],
            ),
          ],
        );

  /// Exibe o bottom sheet padrão
  ///
  /// Este deve ser o bottom sheet padrão para todos os casos
  /// Caso não tenha algum bottom sheet contempla,
  /// será necessário criar um construtor para o novo cenário
  static Future<T?> show<T>(
    BuildContext context, {
    required Widget widget,
    bool isDismissible = true,
    bool enableDrag = true,
    double? maxHeight,
  }) =>
      showModalBottomSheet<T?>(
        context: context,
        isScrollControlled: true,
        showDragHandle: false,
        enableDrag: enableDrag,
        builder: (context) => widget,
        isDismissible: isDismissible,
        constraints: BoxConstraints(
          maxHeight: maxHeight ?? MediaQuery.sizeOf(context).height * .9,
          // minWidth: double.maxFinite,
        ),
      );

  /// Exibe o bottom sheet error
  static Future<T?> error<T>(
    BuildContext context, {
    required String title,
    String? description,
    required String textButton,
    required VoidCallback onPressedButton,
    bool connectionError = false,
  }) async {
    late final Widget widget;
    if (connectionError) {
      widget = QBottomSheet.icon(
        behaviour: Behaviour.regular,
        title: title,
        svgPath: QTheme.svgs.permiScanWifi,
        textPrimaryButton: textButton,
        onPressedPrimaryButton: onPressedButton,
      );
    } else {
      widget = QBottomSheet.text(
        behaviour: Behaviour.regular,
        title: title,
        text: description ?? '',
        textPrimaryButton: textButton,
        onPressedPrimaryButton: onPressedButton,
      );
    }
    return QBottomSheet.show(context, widget: widget);
  }

  /// Bottom sheet com os componentes de delete
  QBottomSheet.titleDescriptionPrimaryBaseSecondaryBase({
    super.key,
    required super.behaviour,
    required super.title,
    required String description,
    required String textPrimaryButton,
    required VoidCallback onPressedPrimaryButton,
    required String textSecondaryButton,
    required VoidCallback onPressedSecondaryButton,
  })  : style = BottomSheetSet.delete,
        super(
          styles: BottomSheetSet.delete,
          content: [
            QLabel.captionRoboto14Gray5Regular(behaviour: behaviour, text: description, textAlign: TextAlign.left),
          ],
          primaryButton: QButton.primaryBase(
            behaviour: behaviour,
            onPressed: onPressedPrimaryButton,
            text: textPrimaryButton,
          ),
          secondaryButton: QButton.secondaryBase(
            behaviour: behaviour,
            onPressed: onPressedSecondaryButton,
            text: textSecondaryButton,
          ),
        );

  /// Bottom sheet com cupom
  QBottomSheet.coupon({
    super.key,
    required super.behaviour,
    required super.title,
    String? subtitle,
    required String coupon,
    super.titleAlign = TextAlign.start,
    required String textPrimaryButton,
    required VoidCallback onPressedPrimaryButton,
    String? textSecondaryButton,
    VoidCallback? onPressedSecondaryButton,
  })  : style = BottomSheetSet.coupon,
        super(
          styles: BottomSheetSet.coupon,
          content: [
            if (subtitle != null) ...[
              QLabel.captionRoboto14Gray5Regular(
                behaviour: behaviour,
                text: subtitle,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: QSizes.x16),
            ],
            Padding(
              padding: const EdgeInsets.only(top: QSizes.x12),
              child: Container(
                height: QSizes.x48,
                decoration: BoxDecoration(
                  color: QTheme.colors.gray1,
                  border: DashedBorder.fromBorderSide(
                    dashLength: QSizes.x4,
                    side: BorderSide(color: QTheme.colors.gray2),
                  ),
                ),
                child: Center(
                  child: QLabel.paragraphRoboto16Gray4Bold(
                    behaviour: behaviour,
                    text: coupon,
                  ),
                ),
              ),
            ),
          ],
          primaryButton: QButton.primaryBase(
            behaviour: behaviour,
            onPressed: onPressedPrimaryButton,
            text: textPrimaryButton,
          ),
          secondaryButton: textSecondaryButton == null || onPressedSecondaryButton == null
              ? null
              : QButton.secondaryBase(
                  behaviour: behaviour,
                  onPressed: onPressedSecondaryButton,
                  text: textSecondaryButton,
                ),
        );
}
