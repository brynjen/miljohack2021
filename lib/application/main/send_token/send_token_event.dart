import 'package:equatable/equatable.dart';

class SendTokenEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SendToken extends SendTokenEvent {
  SendToken({required this.firebaseToken});

  final String firebaseToken;

  @override
  List<Object?> get props => [firebaseToken];
}
