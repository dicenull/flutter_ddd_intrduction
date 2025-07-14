// DTO
import 'package:flutter_ddd_introduction/sns/user/user.dart';

class UserData {
  final String id;
  final String name;

  UserData(User user) : id = user.id.value, name = user.name.value;
}
