import 'package:bloc_test/bloc_test.dart';
import 'package:miljohack/application/main/package_list/package_list.dart';
import 'package:miljohack/infrastructure/network/api_client.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'test_empty_package_list_bloc.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  final mockedApiClient = MockApiClient();
  when(mockedApiClient.loadPackages()).thenAnswer((_) => Future.value([]));
  blocTest<PackageListBloc, PackageListState>(
    'Test api returns an empty list of packages',
    build: () => PackageListBloc(api: mockedApiClient)..add(LoadPackages()),
    act: (bloc) {
      bloc.add(LoadPackages());
    },
    skip: 0,
    expect: () => [NoPackages()],
  );
}
