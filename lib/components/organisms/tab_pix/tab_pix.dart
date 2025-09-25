import 'package:flutter/material.dart';
import 'package:rarui/components/organisms/tab_pix/tab_pix_list_tile_entity.dart';
import 'package:rarui/rarui.dart';

class RTabPix extends StatefulWidget {
  const RTabPix({
    super.key,
    required this.firstTabText,
    required this.secondTabText,
    required this.firstTabListTileTitles,
    required this.secondTabListTileTitles,
    this.isTabScrollable = false,
    this.labelColor,
    this.tabIndicatorColor,
    this.tabUnselectedLabelColor,
  });

  final String firstTabText;
  final String secondTabText;
  final bool isTabScrollable;
  final Color? labelColor;
  final Color? tabIndicatorColor;
  final Color? tabUnselectedLabelColor;

  final List<TabPixListTileEntity> firstTabListTileTitles;
  final List<TabPixListTileEntity> secondTabListTileTitles;

  @override
  State<RTabPix> createState() => _RTabPixState();
}

class _RTabPixState extends State<RTabPix> {
  @override
  Widget build(BuildContext context) {
    return RPrimaryTabBar(
      indicatorColor:
          widget.tabIndicatorColor ?? Theme.of(context).colorScheme.primary,
      unselectedLabelColor: widget.tabUnselectedLabelColor,
      isScrollable: widget.isTabScrollable,
      labelColor: widget.labelColor,
      tabs: [
        RPrimaryTab(
          label: widget.firstTabText,
        ),
        RPrimaryTab(label: widget.secondTabText),
      ],
      tabsContent: [
        _buildContent(widget.firstTabListTileTitles),
        _buildContent(widget.secondTabListTileTitles),
      ],
    );
  }

  ListView _buildContent(List<TabPixListTileEntity> listTileEntities) {
    return ListView.separated(
      itemCount: listTileEntities.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const RDivider(height: 12),
      itemBuilder: (context, index) {
        final entity = listTileEntities[index];

        return RListTile(
          title: Text(entity.title),
          onTap: entity.onTap,
          trailing: Icon(
            Icons.keyboard_arrow_right_rounded,
            size: 24,
            color: Theme.of(context).colorScheme.primary,
          ),
        );
      },
    );
  }
}
