import 'package:flutter_ddd_introduction/user/user.dart';

class UserService {
  bool exists(User user) {
    // TODO: 重複確認を実装
    return user.hashCode % 2 == 0;
  }
}
