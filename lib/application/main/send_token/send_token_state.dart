import 'package:equatable/equatable.dart';

class SendTokenState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TokenNotSent extends SendTokenState {}

class SendingTokenState extends SendTokenState {}

class TokenSuccessfullyReceived extends SendTokenState {}

class FailedToSendToken extends SendTokenState {}
