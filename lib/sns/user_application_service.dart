import 'package:flutter_ddd_introduction/sns/user.dart';
import 'package:flutter_ddd_introduction/sns/user_repository.dart';
import 'package:flutter_ddd_introduction/sns/user_service.dart';

class UserApplicationService {
  final IUserRepository _userRepository;
  final UserService _userService;

  UserApplicationService(this._userRepository, this._userService);

  void register(String name) {
    final user = User(UserName(name));

    if (_userService.exists(user)) {
      throw CanNotRegisterException('ユーザ名 $name はすでに存在します');
    }

    _userRepository.save(user);
  }
}

class CanNotRegisterException implements Exception {
  final String message;

  CanNotRegisterException(this.message);
}
