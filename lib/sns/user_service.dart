import 'package:flutter_ddd_introduction/sns/user.dart';
import 'package:flutter_ddd_introduction/sns/user_repository.dart';

class UserService {
  final IUserRepository _userRepository;

  UserService(this._userRepository);

  bool exists(User user) {
    final duplicateUser = _userRepository.findByName(user.name);

    return duplicateUser != null;
  }
}
