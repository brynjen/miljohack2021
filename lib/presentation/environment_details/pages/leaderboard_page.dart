import 'package:easy_scroll_to_index/easy_scroll_to_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miljohack/application/environment_details/leaderboard/leaderboard.dart';
import 'package:miljohack/domain/environment_details/area_score.dart';
import 'package:miljohack/generated/l10n.dart';
import 'package:miljohack/presentation/core/icons/miljo_hack_icons.dart';
import 'package:miljohack/presentation/core/theme/app_theme.dart';
import 'package:miljohack/presentation/environment_details/widgets/area_line.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({Key? key}) : super(key: key);

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
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

class _LoadedLeaderboard extends StatefulWidget {
  const _LoadedLeaderboard({required this.areaScores, Key? key})
      : super(key: key);
  final List<AreaScore> areaScores;

  @override
  State<_LoadedLeaderboard> createState() => _LoadedLeaderboardState();
}

class _LoadedLeaderboardState extends State<_LoadedLeaderboard> {
  final controller = ScrollToIndexController();

  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(milliseconds: 500),
        () => controller.easyScrollToIndex(
            index: widget.areaScores.indexWhere((element) => element.marked)));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            child: Padding(
              padding: const EdgeInsets.all(10),
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
                          style: TS.of(context).subtitle,
                        ),
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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: AreaLine(
                  areaScore:
                      widget.areaScores.firstWhere((area) => area.marked)),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: EasyScrollToIndex(
                  itemCount: widget.areaScores.length,
                  controller: controller,
                  itemHeight: 14,
                  itemWidth: double.infinity,
                  itemBuilder: (_, index) =>
                      AreaLine(areaScore: widget.areaScores[index]),
                ),
              ),
            ),
          ),
        ],
      ),
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
