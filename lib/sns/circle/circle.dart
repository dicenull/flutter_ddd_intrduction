import 'package:flutter_ddd_introduction/sns/circle/circle_id.dart';
import 'package:flutter_ddd_introduction/sns/circle/circle_name.dart';
import 'package:flutter_ddd_introduction/sns/user/user.dart';

class Circle {
  final CircleId id;
  final CircleName name;
  final User user;
  final List<UserId> _members;

  Circle({
    required this.id,
    required this.name,
    required this.user,
    List<UserId>? members,
  }) : _members = members ?? [];

  bool get isFull => memberCount >= 30;

  int get memberCount => _members.length + 1;

  List<UserId> get members => _members;

  void join(User member) {
    if (isFull) {
      throw CircleFullException('サークルはオーナを含めて最大30人までしか参加できません');
    }

    _members.add(member.id);
  }
}

class CircleFullException implements Exception {
  final String message;

  CircleFullException(this.message);
}
