import 'package:equatable/equatable.dart';

abstract class DomainEvent extends Equatable {
  const DomainEvent();
}
class GetDomains extends DomainEvent {
  const GetDomains();

  @override
  List<Object> get props => [];
}
