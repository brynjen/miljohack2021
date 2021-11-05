import 'package:equatable/equatable.dart';
import 'package:miljohack/domain/main/data/mail_package.dart';

class PackageListState extends Equatable {
  @override
  List<Object?> get props => [];
}

/// User has no packages atm
class NoPackages extends PackageListState {}

class LoadingPackages extends PackageListState {
  LoadingPackages({required this.mailPackages});

  final List<MailPackage> mailPackages;
  @override
  List<Object?> get props => mailPackages;
}

class LoadedPackages extends PackageListState {
  LoadedPackages({required this.mailPackages});

  final List<MailPackage> mailPackages;
  @override
  List<Object?> get props => mailPackages;
}

class FailedPackages extends PackageListState {}
