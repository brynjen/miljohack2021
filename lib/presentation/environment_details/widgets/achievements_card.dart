import 'package:flutter/material.dart';
import 'package:miljohack/domain/environment_details/achievement.dart';
import 'package:miljohack/presentation/core/theme/app_theme.dart';
import 'package:miljohack/presentation/environment_details/widgets/achievement.dart';

class AchievementsCard extends StatelessWidget {
  const AchievementsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Dine achievements:', style: TS.of(context).header),
            const SizedBox(height: 10),
            AchievementGridItem(
              achievement: Achievement(
                img: 'innovator',
                title: 'Innovatør',
                description: 'Første i nabolaget til å bestille klimavennlig',
              ),
            ),
            AchievementGridItem(
              achievement: Achievement(
                img: 'ecofriendly',
                title: 'Økovennlig',
                description: 'Bestilt en pakke klimavennlig',
              ),
            ),
            AchievementGridItem(
              achievement: Achievement(
                img: 'working',
                title: 'Helped out',
                description:
                    'Kontribuerte til at kommunen nådde 50% nedgang i Co2',
              ),
            ),
            AchievementGridItem(
              achievement: Achievement(
                img: 'tweet',
                title: 'Delte nyheter',
                description:
                    'Delte informasjon om tjensten på sosiale nettverk',
              ),
            ),
            AchievementGridItem(
              achievement: Achievement(
                img: 'star',
                title: 'Stjerne',
                description: 'Bestilt 20 pakker klimavennlig',
              ),
            ),
            AchievementGridItem(
              achievement: Achievement(
                img: 'hog',
                title: 'Premievinner',
                description: 'Cashet inn på en premie',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
