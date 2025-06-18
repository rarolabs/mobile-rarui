part of '../bottom_sheet.dart';

class _BottomSheetSearchRadioTitleFirst extends StatefulWidget {
  /// Status do behavior
  final Behaviour behaviour;

  /// Texto exibido no título
  final String title;

  /// Define o estilo do titulo do componente
  final LabelStyleSet titleStyle;

  /// Texto exibido no hint do TextFormField
  final String? hint;

  /// Texto exibido no label do TextFormField
  final String? label;

  /// Opções do radio button
  final List<QRadionOptionsModel> options;

  /// Callback quando seleciona uma opção
  final void Function(int) onSelect;

  /// Indice selecionado, caso não seja informado, nao sera selecionado nenhum item
  final int? currentIndexOption;

  const _BottomSheetSearchRadioTitleFirst({
    required this.behaviour,
    required this.title,
    required this.titleStyle,
    required this.hint,
    required this.label,
    required this.options,
    required this.onSelect,
    required this.currentIndexOption,
  });

  @override
  State<_BottomSheetSearchRadioTitleFirst> createState() => _BottomSheetSearchRadioTitleFirstState();
}

class _BottomSheetSearchRadioTitleFirstState extends State<_BottomSheetSearchRadioTitleFirst> {
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
      child: Padding(
        padding: const EdgeInsets.only(
          top: QSizes.x52,
          bottom: QSizes.x28,
          left: QSizes.x16,
          right: QSizes.x16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(
              visible: !isKeyboardOpen,
              replacement: const SizedBox.shrink(),
              child: QLabel(
                style: widget.titleStyle,
                behaviour: widget.behaviour,
                text: widget.title,
              ),
            ),
            const SizedBox(height: QSizes.x28),
            QTextformfield.search(
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
            const SizedBox(height: QSizes.x28),
            Flexible(
              child: SingleChildScrollView(
                child: ListenableBuilder(
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
