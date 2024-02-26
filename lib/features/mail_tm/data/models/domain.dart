
import 'dart:convert';

import '../../domain/entities/domain.dart';

List<DomainModel> domainListFromRemoteJson(String str) =>
    List<DomainModel>.from(
        json.decode(str)['hydra:member'].map((x) => DomainModel.fromJson(x)));

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
