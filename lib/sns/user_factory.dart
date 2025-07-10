import 'package:flutter_ddd_introduction/sns/user.dart';

abstract class IUserFactory {
  User create(UserName name);
}
