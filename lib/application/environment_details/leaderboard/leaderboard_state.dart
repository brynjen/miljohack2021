import 'package:equatable/equatable.dart';
import 'package:miljohack/domain/environment_details/area_score.dart';

class LeaderboardState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingLeaderboard extends LeaderboardState {}

class LoadedLeaderboard extends LeaderboardState {
  LoadedLeaderboard({required this.areaScores});

  final List<AreaScore> areaScores;

  @override
  List<Object?> get props => areaScores;
}

class FailedLoadingLeaderboard extends LeaderboardState {}
