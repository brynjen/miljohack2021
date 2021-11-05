import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:miljohack/application/main/send_token/send_token.dart';
import 'package:miljohack/infrastructure/network/api_client.dart';

class SendtokenBloc extends Bloc<SendTokenEvent, SendTokenState> {
  SendtokenBloc({
    ApiClient? api,
  })  : _api = api ?? GetIt.instance.get<ApiClient>(),
        super(TokenNotSent());

  final ApiClient _api;

  @override
  Stream<SendTokenState> mapEventToState(event) async* {
    if (event is SendToken) {
      try {
        final didReceive = await _api.sendToken(token: event.firebaseToken);
        if (didReceive) {
          yield TokenSuccessfullyReceived();
        } else {
          yield FailedToSendToken();
        }
      } catch (e) {
        yield FailedToSendToken();
      }
    }
  }
}
