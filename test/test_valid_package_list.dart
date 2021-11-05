import 'package:bloc_test/bloc_test.dart';
import 'package:miljohack/application/main/package_list/package_list.dart';
import 'package:miljohack/domain/main/data/mail_package.dart';
import 'package:miljohack/infrastructure/network/api_client.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'test_valid_package_list.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  final mockedApiClient = MockApiClient();
  when(mockedApiClient.loadPackages()).thenAnswer((_) =>
      Future.value([fakeResponse('test', true), fakeResponse('test2', false)]));
  blocTest<PackageListBloc, PackageListState>(
    'Test api returns a valid list of packages',
    build: () => PackageListBloc(api: mockedApiClient),
    act: (bloc) {
      bloc.add(LoadPackages());
    },
    skip: 0,
    expect: () => [
      LoadedPackages(mailPackages: [
        fakeResponse('test', true),
        fakeResponse('test2', false)
      ])
    ],
  );
}

MailPackage fakeResponse(String shopName, bool optimized) => MailPackage(
    id: 1,
    climateOptimized: optimized,
    shopName: shopName,
    message: 'meh',
    deliveryDate: 'deliveryDate',
    deliveryTime: 'deliveryTime');
