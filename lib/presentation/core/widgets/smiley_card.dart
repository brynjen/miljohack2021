import 'package:flutter/material.dart';
import 'package:miljohack/generated/l10n.dart';
import 'package:miljohack/presentation/core/icons/miljo_hack_icons.dart';
import 'package:miljohack/presentation/core/theme/app_theme.dart';

class SmileyCard extends StatelessWidget {
  const SmileyCard({required this.text, Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(
                  MiljoHack.emo_wink2,
                  color: AppColors.red[600],
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Text(
                    S.of(context).greet_user('David'),
                    style: TS.of(context).header,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(text, style: TS.of(context).body)
          ],
        ),
      ),
    );
  }
}
