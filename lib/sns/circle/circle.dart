import 'package:flutter_ddd_introduction/sns/circle/circle_id.dart';
import 'package:flutter_ddd_introduction/sns/circle/circle_name.dart';
import 'package:flutter_ddd_introduction/sns/user/user.dart';

class Circle {
  final CircleId id;
  final CircleName name;
  final User user;
  final List<UserId> _members;
  final DateTime createdAt;

  Circle({
    required this.id,
    required this.name,
    required this.user,
    List<UserId>? members,
  }) : _members = members ?? [],
       createdAt = DateTime.now();

  int get memberCount => _members.length + 1;

  User get owner => user;

  List<UserId> get members => _members;

  void join(User member) {
    _members.add(member.id);
  }
}
