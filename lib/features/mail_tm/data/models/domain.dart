
import 'dart:convert';

import '../../domain/entities/domain.dart';


class DomainModel extends DomainEntity {
  const DomainModel({
    required String id,
    required String domain,
  }) : super(
    id: id,
    domain: domain,
  );

  factory DomainModel.fromJson(Map<String, dynamic> json) {
    return DomainModel(
      id: json['id'],
      domain: json['domain'],
    );
  }
}
