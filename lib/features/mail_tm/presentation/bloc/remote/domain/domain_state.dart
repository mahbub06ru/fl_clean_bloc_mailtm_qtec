import 'package:equatable/equatable.dart';

import '../../../../domain/entities/domain.dart';

abstract class DomainState extends Equatable {
  const DomainState();

  @override
  List<Object> get props => [];
}

class DomainInitial extends DomainState {}

class DomainLoading extends DomainState {}

class DomainLoaded extends DomainState {
  final List<DomainEntity> domains;

  const DomainLoaded({required this.domains});

  @override
  List<Object> get props => [domains];
}

class DomainError extends DomainState {
  final String message;

  const DomainError({required this.message});

  @override
  List<Object> get props => [message];
}