import 'package:flutter_ddd_introduction/user/user.dart';
import 'package:flutter_ddd_introduction/user/user_service.dart';

class Program {
  void createUser(String userName) {
    final user = User(name: UserName(userName), id: "id");

    var userService = UserService();
    if (userService.exists(user)) {
      throw Exception('$userNameはすでに存在します');
    }

    // SQLでユーザ情報を永続化
  }
}
