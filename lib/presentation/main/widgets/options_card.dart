import 'package:flutter/material.dart';
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
                text: 'Endre navn',
                iconData: MiljoHack.pencil_squared,
                onClick: () {}),
            CircleOption(
                text: 'Del pakke',
                iconData: MiljoHack.share_square,
                onClick: () {}),
            CircleOption(
                text: 'Flytt til sendt',
                iconData: MiljoHack.exchange,
                onClick: () {}),
            CircleOption(
                text: 'Slett', iconData: MiljoHack.trashcan, onClick: () {}),
          ],
        ),
      ),
    );
  }
}
