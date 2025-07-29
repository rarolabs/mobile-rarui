import 'package:flutter/material.dart';
import 'package:rarUI/components/atoms/label/label.dart';
import 'package:rarUI/components/molecules/list_tile/list_tile.dart';
import 'package:rarUI/components/molecules/title_subtitle/title_subtitle.dart';
import 'package:rarUI/components/templates/key_pix/models/list_tile_options_model.dart';

class RKeyPixTemplate extends StatelessWidget {
  const RKeyPixTemplate({
    super.key,
    required this.title,
    required this.description,
    this.itemsRegistrationStatus = "",
    this.styleTitle,
    this.styleDescription,
    this.styleTitleListTile,
    this.styleSubtitleListTile,
    this.itemsOptions = const [],
    this.itemsRegistered = const [],
    this.spaceBetweenTitleSubtitle = 4.0,
  });

  final String title;
  final String description;
  final String itemsRegistrationStatus;
  final TextStyle? styleTitle;
  final TextStyle? styleTitleListTile;
  final TextStyle? styleDescription;
  final TextStyle? styleSubtitleListTile;
  final List<ListTileOptionsModel> itemsRegistered;
  final List<ListTileOptionsModel> itemsOptions;
  final double spaceBetweenTitleSubtitle;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RTitleSubtitle(
            title: title,
            subTitle: description,
            titleStyle: styleTitle,
            subTitleStyle: styleDescription,
            spaceBetween: spaceBetweenTitleSubtitle,
          ),
          SizedBox(height: 24.0),
          if (itemsOptions.isNotEmpty)
            ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: itemsOptions.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) => RListTile(
                contentPadding: EdgeInsets.zero,
                title: RLabel(text: itemsOptions[index].title, style: styleTitleListTile),
                subtitle: RLabel(text: itemsOptions[index].subtitle, style: styleSubtitleListTile),
                leading: itemsOptions[index].leadingIcon,
                trailing: itemsOptions[index].trailingIcon,
                onTap: itemsOptions[index].onTap,
              ),
            ),
          if (itemsRegistrationStatus.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: RLabel(
                text: itemsRegistrationStatus,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          if (itemsRegistered.isNotEmpty)
            ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: itemsRegistered.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) => RListTile(
                contentPadding: EdgeInsets.zero,
                title: RLabel(text: itemsRegistered[index].title, style: styleTitleListTile),
                subtitle: RLabel(text: itemsRegistered[index].subtitle, style: styleSubtitleListTile),
                leading: itemsRegistered[index].leadingIcon,
                trailing: itemsRegistered[index].trailingIcon,
                onTap: itemsRegistered[index].onTap,
              ),
            ),
        ],
      ),
    );
  }
}
