import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:miljohack/application/main/package_list/package_list.dart';
import 'package:miljohack/domain/main/data/mail_package.dart';
import 'package:miljohack/infrastructure/network/api_client.dart';

class PackageListBloc extends Bloc<PackageListEvent, PackageListState> {
  PackageListBloc({ApiClient? api})
      : _api = api ?? GetIt.instance.get<ApiClient>(),
        super(LoadingPackages(mailPackages: const []));

  final ApiClient _api;
  final List<MailPackage> currentPackages = [];
  @override
  Stream<PackageListState> mapEventToState(event) async* {
    if (event is HackLoadedPackages) {
      currentPackages.clear();
      currentPackages.addAll(event.mailPackages);
      if (currentPackages.isNotEmpty) {
        yield LoadedPackages(mailPackages: currentPackages);
      } else {
        yield NoPackages();
      }
    }
  }
}
