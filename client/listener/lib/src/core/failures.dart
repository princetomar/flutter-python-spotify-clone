import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  final String message;

  const Failure({required this.message});

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure({super.message = "INTERNAL SERVER ERROR"});
  @override
  List<Object?> get props => [message];
}
