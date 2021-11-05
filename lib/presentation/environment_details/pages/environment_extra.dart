import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miljohack/application/environment_details/leaderboard/leaderboard.dart';
import 'package:miljohack/domain/environment_details/area_score.dart';
import 'package:miljohack/generated/l10n.dart';
import 'package:miljohack/presentation/core/icons/miljo_hack_icons.dart';
import 'package:miljohack/presentation/core/theme/app_theme.dart';
import 'package:miljohack/presentation/environment_details/widgets/area_line.dart';

class EnvironmentExtra extends StatefulWidget {
  const EnvironmentExtra({Key? key}) : super(key: key);

  @override
  State<EnvironmentExtra> createState() => _EnvironmentExtraState();
}

class _EnvironmentExtraState extends State<EnvironmentExtra> {
  final LeaderboardBloc _bloc = LeaderboardBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(LoadLeaderboard());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).environment_stuff_title),
      ),
      body: BlocBuilder<LeaderboardBloc, LeaderboardState>(
          bloc: _bloc,
          builder: (_, state) {
            if (state is LoadingLeaderboard) {
              return const _LoadingLeaderboard();
            } else if (state is LoadedLeaderboard) {
              return _LoadedLeaderboard(areaScores: state.areaScores);
            } else if (state is FailedLoadingLeaderboard) {
              return const _FailedLoadingLeaderboard();
            } else {
              throw ArgumentError('Invalid state');
            }
          }),
    );
  }
}

class _LoadingLeaderboard extends StatelessWidget {
  const _LoadingLeaderboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _LoadedLeaderboard extends StatelessWidget {
  const _LoadedLeaderboard({required this.areaScores, Key? key})
      : super(key: key);
  final List<AreaScore> areaScores;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      MiljoHack.emo_wink2,
                      color: AppColors.red[600],
                    ),
                    const SizedBox(width: 20),
                    Text(
                      S.of(context).greet_user('David'),
                      style: TS.of(context).subtitle,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(S.of(context).thank_you, style: TS.of(context).body)
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: AreaLine(
                areaScore: areaScores.firstWhere((area) => area.marked)),
          ),
        ),
        const SizedBox(height: 10),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          child: ListView.builder(
            itemBuilder: (_, index) {
              final item = areaScores[index];
              return AreaLine(areaScore: item);
            },
            padding: const EdgeInsets.all(10),
          ),
        ),
      ],
    );
  }
}

class _FailedLoadingLeaderboard extends StatelessWidget {
  const _FailedLoadingLeaderboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Feilet lasting av leaderboard'),
    );
  }
}
