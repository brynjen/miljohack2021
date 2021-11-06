import 'package:flutter/material.dart';
import 'package:miljohack/presentation/core/theme/app_theme.dart';

class RewardRow extends StatelessWidget {
  const RewardRow(
      {required this.icon, required this.text, this.onClick, Key? key})
      : super(key: key);

  final IconData icon;
  final String text;
  final Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 10),
            Expanded(child: Text(text, style: TS.of(context).body)),
            Icon(
              Icons.arrow_right,
              color: context.isLight ? AppColors.black : AppColors.white,
            )
          ],
        ),
      ),
    );
  }
}
