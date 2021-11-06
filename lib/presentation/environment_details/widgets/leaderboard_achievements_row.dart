import 'package:flutter/material.dart';
import 'package:miljohack/domain/environment_details/achievement.dart';

class LeaderBoardAchievementsRow extends StatelessWidget {
  const LeaderBoardAchievementsRow(
      {required this.achievement, required this.number, Key? key})
      : super(key: key);

  final Achievement achievement;
  final double number;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/${achievement.img}.png',
            width: 50,
            height: 50,
          ),
          const SizedBox(width: 20),
          Expanded(child: Text(achievement.title)),
          const SizedBox(width: 10),
          Text('$number %'),
        ],
      ),
    );
  }
}
