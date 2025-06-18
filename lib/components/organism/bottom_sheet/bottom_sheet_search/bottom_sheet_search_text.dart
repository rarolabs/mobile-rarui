part of '../bottom_sheet.dart';

class _SearchWithTextBottomSheet extends StatefulWidget {
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
  final List<String> options;

  /// Callback quando seleciona uma opção
  final void Function(int) onSelect;

  const _SearchWithTextBottomSheet({
    required this.behaviour,
    required this.title,
    required this.titleStyle,
    required this.subtitle,
    required this.subtitleStyle,
    this.hint,
    this.label,
    required this.options,
    required this.onSelect,
  });

  @override
  State<_SearchWithTextBottomSheet> createState() => _SearchWithTextBottomSheetState();
}

class _SearchWithTextBottomSheetState extends State<_SearchWithTextBottomSheet> {
  List<String> _filteredOptions = [];

  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _filteredOptions = widget.options;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * .9,
        minHeight: MediaQuery.sizeOf(context).height * .9,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: QSizes.x16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Exibe os textos somente se o teclado não estiver aberto
            Padding(
              padding: const EdgeInsets.only(top: QSizes.x16),
              child: QLabel(style: widget.titleStyle, behaviour: widget.behaviour, text: widget.title),
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
            Padding(
              padding: const EdgeInsets.only(bottom: QSizes.x8),
              child: QTextformfield.search(
                controller: _controller,
                behaviour: widget.behaviour,
                fieldState: TextFieldStates.regular,
                hint: widget.hint,
                label: widget.label,
                onChanged: (text) {
                  if (text.trim().isEmpty) {
                    _filteredOptions = widget.options;
                  } else {
                    _filteredOptions = widget.options
                        .where(
                          (o) =>
                              removeDiacritics(o).toLowerCase().contains(removeDiacritics(text).trim().toLowerCase()),
                        )
                        .toList();
                  }
                },
              ),
            ),
            Flexible(
              child: ListenableBuilder(
                listenable: _controller,
                builder: (_, __) => ListView.builder(
                  padding: const EdgeInsets.only(bottom: QSizes.x64),
                  itemCount: _filteredOptions.length,
                  itemBuilder: (context, index) {
                    final item = _filteredOptions[index];
                    return QListTile.titleCaption14Gray4SubtitleRoboto14Gray5(
                      behaviour: Behaviour.regular,
                      title: item,
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();

                        final int index = widget.options.indexOf(item);

                        widget.onSelect.call(index);
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
