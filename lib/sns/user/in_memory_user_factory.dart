import 'package:flutter_ddd_introduction/sns/user/user.dart';
import 'package:flutter_ddd_introduction/sns/user/user_factory.dart';

class InMemoryUserFactory extends IUserFactory {
  int _currentId = 0;

  @override
  User create(UserName name) {
    _currentId++;
    return User(UserId('$_currentId'), name);
  }
}
