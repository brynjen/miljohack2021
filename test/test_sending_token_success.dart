import 'package:bloc_test/bloc_test.dart';
import 'package:miljohack/application/main/send_token/send_token.dart';
import 'package:miljohack/infrastructure/network/api_client.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'test_sending_token_fails.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  final mockedApiClient = MockApiClient();
  when(mockedApiClient.sendToken(token: anyNamed('token')))
      .thenAnswer((_) => Future.value(true));
  blocTest<SendtokenBloc, SendTokenState>(
    'Test send token returns success',
    build: () => SendtokenBloc(api: mockedApiClient),
    act: (bloc) {
      bloc.add(SendToken(firebaseToken: 'testToken'));
    },
    skip: 0,
    expect: () => [TokenSuccessfullyReceived()],
  );
}
