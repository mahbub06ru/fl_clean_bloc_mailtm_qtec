import 'package:equatable/equatable.dart';

class AccountEntity extends Equatable {
  final String id;
  final String address;

  const AccountEntity({
    required this.id,
    required this.address
  });

  @override
  List<Object?> get props => [
    id,
    address
  ];
}
