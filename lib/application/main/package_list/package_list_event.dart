import 'package:equatable/equatable.dart';
import 'package:miljohack/domain/main/data/mail_package.dart';

class PackageListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadPackages extends PackageListEvent {}

class HackLoadedPackages extends PackageListEvent {
  HackLoadedPackages({required this.mailPackages});
  final List<MailPackage> mailPackages;
  @override
  List<Object?> get props => mailPackages;
}
