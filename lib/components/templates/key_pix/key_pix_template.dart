import 'package:flutter/material.dart';
import 'package:rarUI/components/atoms/label/label.dart';
import 'package:rarUI/components/molecules/list_tile/list_tile.dart';
import 'package:rarUI/components/molecules/title_subtitle/title_subtitle.dart';
import 'package:rarUI/components/templates/key_pix/models/key_pix_model.dart';

class RKeyPixTemplate extends StatelessWidget {
  const RKeyPixTemplate({
    super.key,
    required this.title,
    required this.description,
    this.styleTitle,
    this.styleDescription,
    this.styleTitleListTile,
    this.styleSubtitleListTile,
    this.centerTitle = true,
    this.pixKeyOptions = const [],
    this.registeredPixKeys = const [],
    this.spaceBetweenTitleSubtitle = 4.0,
  }) : assert(registeredPixKeys.length <= 5, 'Você só pode cadastrar até 5 chaves Pix');

  final String title;
  final String description;
  final TextStyle? styleTitle;
  final TextStyle? styleTitleListTile;
  final TextStyle? styleDescription;
  final TextStyle? styleSubtitleListTile;
  final bool centerTitle;
  final List<Widget> pixKeyOptions;
  final List<KeyPixModel> registeredPixKeys;
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
          ...pixKeyOptions,
          if (registeredPixKeys.isNotEmpty && registeredPixKeys.length <= 5)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: RLabel(
                text: "${registeredPixKeys.length} de 5 chaves cadastradas",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: registeredPixKeys.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) => RListTile(
              contentPadding: EdgeInsets.zero,
              title: RLabel(text: registeredPixKeys[index].keyType, style: styleTitleListTile),
              subtitle: RLabel(text: registeredPixKeys[index].keyValue, style: styleSubtitleListTile),
              leading: registeredPixKeys[index].keyIcon,
              trailing: const Icon(Icons.more_vert),
            ),
          ),
        ],
      ),
    );
  }
}
