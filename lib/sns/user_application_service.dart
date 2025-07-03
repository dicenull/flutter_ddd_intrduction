import 'package:flutter_ddd_introduction/sns/user.dart';
import 'package:flutter_ddd_introduction/sns/user_data.dart';
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

  UserData? get(String userId) {
    final targetId = UserId(userId);
    final user = _userRepository.findById(targetId);

    if (user == null) {
      return null;
    }

    final userData = UserData(user);
    return userData;
  }

  void update(String userId, String name) {
    final targetId = UserId(userId);
    final user = _userRepository.findById(targetId);

    if (user == null) {
      throw UserNotFoundException('ユーザが見つかりません: $userId');
    }

    final newUserName = UserName(name);
    user.changeName(newUserName);
    if (_userService.exists(user)) {
      throw CanNotRegisterException('ユーザ名 $name はすでに存在します');
    }

    _userRepository.save(user);
  }
}

class UserNotFoundException implements Exception {
  final String message;

  UserNotFoundException(this.message);
}

class CanNotRegisterException implements Exception {
  final String message;

  CanNotRegisterException(this.message);
}
