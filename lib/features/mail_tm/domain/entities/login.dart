import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final String token;
  final String id;

  const LoginEntity({
    required this.token,
    required this.id,
  });

  @override
  List<Object?> get props => [token, id];
}
