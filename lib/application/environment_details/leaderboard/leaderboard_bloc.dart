import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:miljohack/application/environment_details/leaderboard/leaderboard.dart';
import 'package:miljohack/infrastructure/network/api_client.dart';

class LeaderboardBloc extends Bloc<LeaderboardEvent, LeaderboardState> {
  LeaderboardBloc({ApiClient? api})
      : _api = api ?? GetIt.instance.get<ApiClient>(),
        super(LoadingLeaderboard());

  final ApiClient _api;

  @override
  Stream<LeaderboardState> mapEventToState(event) async* {
    if (event is LoadLeaderboard) {
      try {
        final response = await _api.leaderboard();
        yield LoadedLeaderboard(areaScores: response);
      } catch (e) {
        yield FailedLoadingLeaderboard();
      }
    }
  }
}
