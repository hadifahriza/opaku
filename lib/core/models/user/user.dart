import 'package:equatable/equatable.dart';

class User extends Equatable{
  const User ({
    required this.id,
    this.name,
    this.email,
    this.phone,
    this.createAt,
    this.lastLogin
  });

  final String id;
  final String? name;
  final String? email;
  final String? phone;
  final String? createAt;
  final String? lastLogin;

  static const empty = User(id: '');
  bool get isEmpty => this == User.empty;
  bool get isNotEmpty => this != User.empty;

  @override
  List<Object?> get props => [id, email, name];
}