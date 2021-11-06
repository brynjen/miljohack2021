import 'package:flutter/material.dart';
import 'package:miljohack/domain/environment_details/achievement.dart';
import 'package:miljohack/presentation/core/theme/app_theme.dart';

class AchievementDescriptionDialog extends StatelessWidget {
  const AchievementDescriptionDialog({required this.achievement, Key? key})
      : super(key: key);

  final Achievement achievement;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/${achievement.img}.png',
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),
            Text(achievement.title, style: TS.of(context).fatSubTitle),
            const SizedBox(height: 10),
            Text('Nådd 6. November, 2021', style: TS.of(context).body),
            const SizedBox(height: 10),
            Text(achievement.description, style: TS.of(context).body),
          ],
        ),
      ),
    );
  }
}
