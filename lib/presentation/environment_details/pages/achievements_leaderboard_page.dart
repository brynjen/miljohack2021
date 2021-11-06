import 'package:flutter/material.dart';
import 'package:miljohack/domain/environment_details/achievement.dart';
import 'package:miljohack/presentation/environment_details/widgets/leaderboard_achievements_row.dart';

class AchievementsLeaderboardPage extends StatelessWidget {
  const AchievementsLeaderboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Globalt achievements'),
      ),
      body: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              LeaderBoardAchievementsRow(
                  achievement: Achievement(
                    img: 'hog',
                    title: 'Premievinner',
                    description: 'Cashet inn på en premie',
                  ),
                  number: 60),
              LeaderBoardAchievementsRow(
                achievement: Achievement(
                  img: 'ecofriendly',
                  title: 'Økovennlig',
                  description: 'Bestilt en pakke klimavennlig',
                ),
                number: 20,
              ),
              LeaderBoardAchievementsRow(
                achievement: Achievement(
                  img: 'working',
                  title: 'Helped out',
                  description:
                      'Kontribuerte til at kommunen nådde 50% nedgang i Co2',
                ),
                number: 10.5,
              ),
              LeaderBoardAchievementsRow(
                achievement: Achievement(
                  img: 'tweet',
                  title: 'Delte nyheter',
                  description:
                      'Delte informasjon om tjensten på sosiale nettverk',
                ),
                number: 10,
              ),
              LeaderBoardAchievementsRow(
                achievement: Achievement(
                  img: 'innovator',
                  title: 'Innovatør',
                  description: 'Første i nabolaget til å bestille klimavennlig',
                ),
                number: 2,
              ),
              LeaderBoardAchievementsRow(
                achievement: Achievement(
                  img: 'star',
                  title: 'Stjerne',
                  description: 'Bestilt 20 pakker klimavennlig',
                ),
                number: 0.5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
