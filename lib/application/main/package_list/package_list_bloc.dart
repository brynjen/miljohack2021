import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:miljohack/application/main/package_list/package_list.dart';
import 'package:miljohack/infrastructure/network/api_client.dart';

class PackageListBloc extends Bloc<PackageListEvent, PackageListState> {
  PackageListBloc({ApiClient? api})
      : _api = api ?? GetIt.instance.get<ApiClient>(),
        super(LoadingPackages());

  final ApiClient _api;
}
