import 'package:miljohack/domain/main/data/mail_package.dart';

class PackageListState {}

/// User has no packages atm
class NoPackages extends PackageListState {}

class LoadingPackages extends PackageListState {
  LoadingPackages({required this.mailPackages});

  final List<MailPackage> mailPackages;
}

class LoadedPackages extends PackageListState {
  LoadedPackages({required this.mailPackages});

  final List<MailPackage> mailPackages;
}
