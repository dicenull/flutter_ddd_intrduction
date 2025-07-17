import 'package:flutter_ddd_introduction/sns/circle/circle_id.dart';
import 'package:flutter_ddd_introduction/sns/circle/circle_name.dart';
import 'package:flutter_ddd_introduction/sns/user/user.dart';

class Circle {
  final CircleId id;
  final CircleName name;
  final User user;
  final List<User> members;

  Circle({
    required this.id,
    required this.name,
    required this.user,
    List<User>? members,
  }) : members = members ?? [];
}
