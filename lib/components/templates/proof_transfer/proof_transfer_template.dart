import 'package:flutter/material.dart';
import 'package:rarUI/rarui.dart';

class RProofTransferTemplate extends StatelessWidget {
  final void Function()? onPressedIconClose;
  final void Function()? onPressedButton;
  final ImageProvider<Object>? imageLogo;
  final String? title;
  final String? titleButton;
  final String? subTitle;
  final String? titleFisrtBlock;
  final String? titleSecondBlock;
  final Map<String, String>? transferData;
  final Map<String, String>? firstBlockItens;
  final Map<String, String>? secondBlockItens;

  const RProofTransferTemplate({
    super.key,
    this.onPressedIconClose,
    this.onPressedButton,
    this.imageLogo,
    this.title,
    this.titleButton,
    this.subTitle,
    this.titleFisrtBlock,
    this.titleSecondBlock,
    this.transferData,
    this.firstBlockItens,
    this.secondBlockItens,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: onPressedIconClose,
              icon: Icon(Icons.close,
                  color: Theme.of(context).colorScheme.onSurface),
            ),
          ),
          if (imageLogo != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: RImage(
                image: imageLogo!,
                size: Size(80.0, 40.0),
                fit: BoxFit.fill,
              ),
            ),
          if (title != null && subTitle != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 52.0),
              child: RTitleSubtitle(
                title: title!,
                subTitle: subTitle!,
                centralized: true,
                titleStyle: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                subTitleStyle: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).colorScheme.onSurface),
              ),
            ),
          if (transferData != null && transferData!.isNotEmpty)
            ...transferData!.entries.map((e) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RLabel(
                        text: e.key,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      RLabel(
                          text: e.value,
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold))
                    ],
                  ),
                  RDivider(
                      color: Theme.of(context).colorScheme.onSurface,
                      thickness: 0.1),
                ],
              );
            }).toList(),
          if (titleFisrtBlock != null && titleFisrtBlock!.isNotEmpty)
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 28.0, bottom: 16.0),
                child: RLabel(
                    text: titleFisrtBlock!,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
              ),
            ),
          if (firstBlockItens != null && firstBlockItens!.isNotEmpty)
            ...firstBlockItens!.entries
                .map((e) =>
                    TitleSubtitleDividerWidget(title: e.key, subtitle: e.value))
                .toList(),
          if (titleSecondBlock != null && titleSecondBlock!.isNotEmpty)
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 28.0, bottom: 16.0),
                child: RLabel(
                    text: titleSecondBlock!,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
              ),
            ),
          if (secondBlockItens != null && secondBlockItens!.isNotEmpty)
            ...secondBlockItens!.entries
                .map((e) =>
                    TitleSubtitleDividerWidget(title: e.key, subtitle: e.value))
                .toList(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: RTextButton(
              child: RLabel(text: titleButton ?? ""),
              onPressed: onPressedButton,
              foregroundColor: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}

class TitleSubtitleDividerWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const TitleSubtitleDividerWidget(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RLabel(
            text: title,
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400)),
        RLabel(
            text: subtitle,
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)),
        SizedBox(height: 12.0),
        RDivider(
            color: Theme.of(context).colorScheme.onSurface, thickness: 0.1),
        SizedBox(height: 12.0),
      ],
    );
  }
}
