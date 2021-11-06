import 'package:flutter/material.dart';
import 'package:miljohack/domain/environment_details/achievement.dart';
import 'package:miljohack/presentation/core/theme/app_theme.dart';
import 'package:miljohack/presentation/environment_details/widgets/achievement_description_dialog.dart';

class AchievementGridItem extends StatelessWidget {
  const AchievementGridItem({required this.achievement, Key? key})
      : super(key: key);

  final Achievement achievement;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (_) =>
                  AchievementDescriptionDialog(achievement: achievement));
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/${achievement.img}.png',
                width: 50,
                height: 50,
              ),
              const SizedBox(height: 10),
              Text(achievement.title, style: TS.of(context).body)
            ],
          ),
        ),
      ),
    );
  }
}
