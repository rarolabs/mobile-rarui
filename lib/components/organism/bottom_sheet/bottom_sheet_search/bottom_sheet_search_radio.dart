part of '../bottom_sheet.dart';

class _SearchWithRadiosBottomSheet extends StatefulWidget {
  /// Status do behavior
  final Behaviour behaviour;

  /// Texto exibido no título
  final String title;

  /// Define o estilo do titulo do componente
  final LabelStyleSet titleStyle;

  /// Texto exibido no subtitulo
  final String subtitle;

  /// Define o estilo do titulo do componente
  final LabelStyleSet subtitleStyle;

  /// Texto exibido no hint do TextFormField
  final String? hint;

  /// Texto exibido no label do TextFormField
  final String? label;

  /// Opções do radio button
  final List<QRadionOptionsModel> options;

  /// Callback quando seleciona uma opção
  final void Function(int) onSelect;

  /// Indice selecionado
  final int? currentIndexOption;

  const _SearchWithRadiosBottomSheet({
    required this.behaviour,
    required this.title,
    required this.titleStyle,
    required this.subtitle,
    required this.subtitleStyle,
    this.hint,
    this.label,
    required this.options,
    required this.onSelect,
    this.currentIndexOption,
  });

  @override
  State<_SearchWithRadiosBottomSheet> createState() => _SearchWithRadiosBottomSheetState();
}

class _SearchWithRadiosBottomSheetState extends State<_SearchWithRadiosBottomSheet> {
  List<QRadionOptionsModel> _filteredOptions = [];
  int? _currentPosition;

  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _filteredOptions = widget.options;
    _currentPosition = widget.currentIndexOption;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * .9,
        minHeight: MediaQuery.sizeOf(context).height * .9,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: QSizes.x52,
              bottom: QSizes.x8,
            ),
            child: QTextformfield.search(
              controller: _controller,
              behaviour: widget.behaviour,
              fieldState: TextFieldStates.regular,
              hint: widget.hint,
              label: widget.label,
              onChanged: (text) {
                if (text.trim().isEmpty) {
                  _currentPosition = widget.currentIndexOption;
                  _filteredOptions = widget.options;
                } else {
                  _filteredOptions = widget.options
                      .where(
                        (o) => removeDiacritics(o.title)
                            .toLowerCase()
                            .contains(removeDiacritics(text).trim().toLowerCase()),
                      )
                      .toList();

                  if (widget.currentIndexOption != null) {
                    final int index =
                        _filteredOptions.indexWhere((option) => option == widget.options[widget.currentIndexOption!]);
                    if (index.isNegative) {
                      _currentPosition = null;
                    } else {
                      _currentPosition = index;
                    }
                  }
                }
              },
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: QSizes.x64, left: QSizes.x24, right: QSizes.x24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Exibe os textos somente se o teclado não estiver aberto
                  if (!isKeyboardOpen) ...[
                    Padding(
                      padding: const EdgeInsets.only(top: QSizes.x16),
                      child: QLabel(
                        style: widget.titleStyle,
                        behaviour: widget.behaviour,
                        text: widget.title,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: QSizes.x16, bottom: QSizes.x24),
                      child: QLabel(
                        style: widget.subtitleStyle,
                        behaviour: widget.behaviour,
                        text: widget.subtitle,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                  ListenableBuilder(
                    listenable: _controller,
                    builder: (_, __) => QRadioButton.standard(
                      onChanged: (value) {
                        if (isKeyboardOpen) FocusManager.instance.primaryFocus?.unfocus();

                        final int index = widget.options.indexWhere((option) => option == _filteredOptions[value]);

                        widget.onSelect.call(index);
                      },
                      behaviour: widget.behaviour,
                      options: _filteredOptions,
                      initialOption: _currentPosition,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
