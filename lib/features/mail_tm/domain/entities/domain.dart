import 'package:equatable/equatable.dart';

class DomainEntity extends Equatable {
  final String id;
  final String domain;
  final bool isActive;
  final bool isPrivate;
  final DateTime createdAt;
  final DateTime updatedAt;

  const DomainEntity({
    required this.id,
    required this.domain,
    required this.isActive,
    required this.isPrivate,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [id, domain, isActive, isPrivate, createdAt, updatedAt];
}
