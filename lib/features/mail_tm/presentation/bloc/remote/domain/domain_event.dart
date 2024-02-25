import 'package:equatable/equatable.dart';

abstract class DomainEvent extends Equatable {
  const DomainEvent();

  @override
  List<Object> get props => [];
}

class GetDomainsEvent extends DomainEvent {}