import 'package:flutter_ddd_introduction/user/user.dart';

abstract class IUserRepository {
  void save(User user);
  bool find(User user);
}
