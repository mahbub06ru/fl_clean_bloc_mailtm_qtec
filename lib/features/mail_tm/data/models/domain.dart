
import '../../domain/entities/domain.dart';

class DomainModel extends DomainEntity {
  const DomainModel({
    required String id,
    required String domain,
    required bool isActive,
    required bool isPrivate,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : super(
    id: id,
    domain: domain,
    isActive: isActive,
    isPrivate: isPrivate,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );

  factory DomainModel.fromJson(Map<String, dynamic> json) {
    final member = json['hydra:member'][0];

    return DomainModel(
      id: member['id'],
      domain: member['domain'],
      isActive: member['isActive'],
      isPrivate: member['isPrivate'],
      createdAt: DateTime.parse(member['createdAt']),
      updatedAt: DateTime.parse(member['updatedAt']),
    );
  }
}
