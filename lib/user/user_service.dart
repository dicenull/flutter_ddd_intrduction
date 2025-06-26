import 'package:flutter_ddd_introduction/user/user.dart';
import 'package:flutter_ddd_introduction/user/user_repository.dart';

class UserService {
  final IUserRepository _userRepository;

  UserService(this._userRepository);

  bool exists(User user) {
    // ユーザの重複を問い合わせる
    return _userRepository.find(user.name) != null;
  }
}
