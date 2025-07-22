import 'package:flutter_ddd_introduction/sns/user/user.dart';

abstract class IUserRepository {
  User? findById(UserId id);

  /// ユーザ名でユーザを検索する
  User? findByName(UserName userName);

  /// ユーザを保存する
  void save(User user);

  /// ユーザを削除する
  void delete(User user);

  List<User> find(List<UserId> members);
}
