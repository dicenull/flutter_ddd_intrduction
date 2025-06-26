import 'package:collection/collection.dart';
import 'package:flutter_ddd_introduction/user/user.dart';
import 'package:flutter_ddd_introduction/user/user_repository.dart';

class InMemoryUserRepository extends IUserRepository {
  final Map<String, User> store = {};

  @override
  User? find(UserName? name) {
    if (name == null) return null;
    final target = store.values.firstWhereOrNull((user) => user.name == name);
    if (target != null) {
      return _clone(target);
    } else {
      return null;
    }
  }

  @override
  void save(User user) {
    store[user.id] = _clone(user);
  }

  User _clone(User user) {
    return User(id: user.id, name: user.name!);
  }
}
