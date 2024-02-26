import 'package:equatable/equatable.dart';

class DomainEntityUser extends Equatable {
  final int? id;
  final String? username;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? image;
  final String? token;

  const DomainEntityUser({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    this.image,
    required this.token,
  });

  @override
  List<Object?> get props => [
    id,
    username,
    email,
    firstName,
    lastName,
    if (image != null) image,
    token,
  ];
}