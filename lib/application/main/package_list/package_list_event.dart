import 'package:miljohack/domain/main/data/mail_package.dart';

class PackageListEvent {}

class LoadPackages extends PackageListEvent {}

class HackLoadedPackages extends PackageListEvent {
  HackLoadedPackages({required this.mailPackages});
  final List<MailPackage> mailPackages;
}

class UpdatedId extends PackageListEvent {
  UpdatedId({required this.id, required this.newValue});
  final int id;
  final bool newValue;
}
