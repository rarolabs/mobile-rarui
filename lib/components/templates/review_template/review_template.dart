import 'package:flutter/material.dart';
import 'package:rarUI/components/molecules/bottom_sheet/bottom_sheet.dart';
import 'package:rarUI/rarui.dart';

class RReviewTemplate extends StatefulWidget {
  const RReviewTemplate({
    super.key,
    required this.appBarTitle,
    required this.bodyTitle,
    required this.valueLabel,
    required this.valueText,
    required this.checkboxText,
    required this.details,
    required this.primaryButtonText,
    this.onPrimaryButtonPressed,
  });
  final String appBarTitle;
  final String bodyTitle;
  final String valueLabel;
  final String valueText;
  final String checkboxText;
  final Map<String, String> details;
  final String primaryButtonText;
  final Function(bool checkboxValue)? onPrimaryButtonPressed;

  @override
  State<RReviewTemplate> createState() => _RReviewTemplateState();
}

class _RReviewTemplateState extends State<RReviewTemplate> {
  final _bodyPadding = EdgeInsets.symmetric(horizontal: 16);

  late final ValueNotifier<bool> _checkboxValue;

  late final TextEditingController _descriptionController;
  static const _descriptionMaxLength = 140;

  @override
  void initState() {
    super.initState();
    _checkboxValue = ValueNotifier<bool>(false);
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _checkboxValue.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBarTitle),
        backgroundColor: theme.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: _bodyPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32),
              Text(
                widget.bodyTitle,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: 16),
              Text(widget.valueLabel, style: theme.textTheme.bodyMedium),
              Text(
                widget.valueText,
                style: theme.textTheme.headlineLarge?.copyWith(
                  color: theme.primaryColor,
                ),
              ),
              SizedBox(height: 24),
              ListView.separated(
                itemCount: widget.details.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => RDivider(),
                itemBuilder: (context, index) {
                  final detail = widget.details.entries.elementAt(index);

                  return RListTile(
                    title: Text(detail.key),
                    subtitle: Text(detail.value),
                    contentPadding: EdgeInsets.zero,
                    horizontalTitleGap: 0,
                  );
                },
              ),
              SizedBox(height: 8),
              ValueListenableBuilder<bool>(
                  valueListenable: _checkboxValue,
                  builder: (_, checkboxValue, __) {
                    return RCheckbox(
                      onChanged: (value) =>
                          _checkboxValue.value = value ?? false,
                      label: widget.checkboxText,
                    );
                  }),
              SizedBox(height: 24),
              ListenableBuilder(
                  listenable: _descriptionController,
                  builder: (_, __) {
                    return RTextButton(
                      text: _descriptionController.text.trim().isEmpty
                          ? 'Escrever uma mensagem'
                          : _descriptionController.text,
                      icon: Icons.message,
                      expanded: true,
                      onPressed: () => _openDescriptionBottomSheet(context),
                    );
                  }),
              SizedBox(height: 28),
              RElevatedButton(
                text: widget.primaryButtonText,
                expanded: true,
                onPressed: () =>
                    widget.onPrimaryButtonPressed?.call(_checkboxValue.value),
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
              ),
              SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _openDescriptionBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => ListenableBuilder(
        listenable: _descriptionController,
        builder: (_, __) => RBottomSheet(
          title: 'Insira uma mensagem',
          content: RTextFormField(
            controller: _descriptionController,
            maxLength: _descriptionMaxLength,
          ),
          titlePrimaryButton: 'Concluir',
          onPrimaryButtonPressed: _descriptionController.text.trim().isEmpty
              ? null
              : () => Navigator.pop(context),
        ),
      ),
    );
  }
}
