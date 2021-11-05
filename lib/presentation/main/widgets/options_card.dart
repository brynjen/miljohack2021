import 'package:flutter/material.dart';
import 'package:miljohack/generated/l10n.dart';
import 'package:miljohack/presentation/core/icons/miljo_hack_icons.dart';
import 'package:miljohack/presentation/main/widgets/circle_option.dart';

class OptionsCard extends StatelessWidget {
  const OptionsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleOption(
                text: S.of(context).change_name,
                iconData: MiljoHack.pencil_squared,
                onClick: () {}),
            CircleOption(
                text: S.of(context).share_package,
                iconData: MiljoHack.share_square,
                onClick: () {}),
            CircleOption(
                text: S.of(context).move_to_sent,
                iconData: MiljoHack.exchange,
                onClick: () {}),
            CircleOption(
                text: S.of(context).delete,
                iconData: MiljoHack.trashcan,
                onClick: () {}),
          ],
        ),
      ),
    );
  }
}
