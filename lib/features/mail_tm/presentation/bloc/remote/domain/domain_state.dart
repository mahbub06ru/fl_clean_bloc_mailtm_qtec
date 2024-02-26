import 'package:equatable/equatable.dart';

import '../../../../../../core/errors/failures.dart';
import '../../../../domain/entities/domain.dart';

abstract class DomainState extends Equatable {
  final List<DomainEntity> domains;
  const DomainState({required this.domains});

  @override
  List<Object> get props => [];
}

class DomainInitial extends DomainState {
  const DomainInitial({required super.domains});
  @override
  List<Object> get props => [];
}

class DomainLoading extends DomainState {
  const DomainLoading({required super.domains});
  @override
  List<Object> get props => [];
}

class DomainLoaded extends DomainState {
  const DomainLoaded({required super.domains});
  @override
  List<Object> get props => [];
}

class DomainError extends DomainState {
  final Failure failure;
  const DomainError({required super.domains, required this.failure});
  @override
  List<Object> get props => [];
}


