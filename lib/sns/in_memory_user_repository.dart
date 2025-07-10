import 'package:collection/collection.dart';
import 'package:flutter_ddd_introduction/sns/user.dart';
import 'package:flutter_ddd_introduction/sns/user_repository.dart';

class InMemoryUserRepository extends IUserRepository {
  final Map<UserId, User> store = {};

  @override
  User? findByName(UserName? name) {
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
    return User(user.id, user.name);
  }

  @override
  void delete(User user) {
    // TODO: implement delete
  }

  @override
  User? findById(UserId id) {
    // TODO: implement findById
    throw UnimplementedError();
  }
}
