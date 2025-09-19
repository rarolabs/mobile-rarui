import 'package:flutter/material.dart';
import 'package:rarUI/rarui.dart';

class RSearchModal<T extends Object> extends StatefulWidget {
  const RSearchModal({
    super.key,
    required this.title,
    required this.subtitle,
    this.searchHintText,
    this.searchLabel,
    required this.searchItems,
    required this.filterCondition,
    required this.onSelected,
  });

  final String title;
  final String subtitle;
  final String? searchHintText;
  final String? searchLabel;
  final List<RSearchModalItem<T>> searchItems;
  final bool Function(String value, RSearchModalItem<T>)? filterCondition;
  final ValueChanged<T> onSelected;

  @override
  State<RSearchModal> createState() => _RSearchModalState<T>();
}

class _RSearchModalState<T extends Object> extends State<RSearchModal<T>>
    with TickerProviderStateMixin {
  late final AnimationController bottomSheetController;
  late T? selectedValue;
  late List<RSearchModalItem<T>> items;
  @override
  void initState() {
    super.initState();
    bottomSheetController = BottomSheet.createAnimationController(this);
    items = widget.searchItems;
  }

  _filterItems(String value) {
    if (widget.filterCondition != null) {
      setState(() {
        items = widget.searchItems
            .where((item) => widget.filterCondition!(value, item))
            .toList();
      });
    }
  }

  @override
  void dispose() {
    bottomSheetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      animationController: bottomSheetController,
      showDragHandle: true,
      enableDrag: true,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          spacing: 24.0,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RTitleSubtitle(
              title: widget.title,
              subTitle: widget.subtitle,
              titleStyle: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
              ),
              subTitleStyle: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            RTextFormField(
              autofocus: false,
              decoration: InputDecoration(
                hintText: widget.searchHintText,
                hintStyle: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
                labelText: widget.searchLabel,
                labelStyle: TextStyle(fontWeight: FontWeight.w700),
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                _filterItems(value);
              },
            ),
            Expanded(
              child: ListView.separated(
                itemCount: items.length,
                itemBuilder: (context, index) => RListTile(
                  title: RLabel(
                    text: items[index].label,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onTap: () {
                    widget.onSelected(items[index].value);
                    Navigator.of(context).pop();
                  },
                ),
                separatorBuilder: (context, index) => RDivider(),
              ),
            ),
          ],
        ),
      ),
      onClosing: () {
        Navigator.of(context).pop();
      },
    );
  }
}

class RSearchModalItem<T> {
  RSearchModalItem({
    required this.value,
    required this.label,
  });

  final T value;
  final String label;
}
