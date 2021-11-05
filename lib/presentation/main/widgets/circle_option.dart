import 'package:flutter/material.dart';
import 'package:miljohack/presentation/core/theme/app_theme.dart';

class CircleOption extends StatelessWidget {
  const CircleOption(
      {required this.iconData,
      required this.text,
      required this.onClick,
      Key? key})
      : super(key: key);
  final IconData iconData;
  final String text;
  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: SizedBox(
        width: 80,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.red[200],
              child: Icon(
                iconData,
                size: 16,
                color: AppColors.red[600],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              text,
              style: TS.body2,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
