import 'package:equatable/equatable.dart';

class DomainEntity extends Equatable {
  final String id;
  final String domain;

  const DomainEntity({
    required this.id,
    required this.domain,

  });

  @override
  List<Object?> get props => [id, domain];
}
