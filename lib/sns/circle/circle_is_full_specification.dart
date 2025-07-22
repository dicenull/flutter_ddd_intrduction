import 'package:flutter_ddd_introduction/sns/circle/circle.dart';
import 'package:flutter_ddd_introduction/sns/user/user_repository.dart';

class CircleIsFullSpecification {
  final IUserRepository _userRepository;
  CircleIsFullSpecification(this._userRepository);

  bool isSatisfiedBy(Circle circle) {
    final users = _userRepository.find(circle.members);

    final premiumUsersCount = users.where((user) => user.isPremium).length;
    final circleUpperLimit = premiumUsersCount < 10 ? 30 : 50;

    return circle.memberCount >= circleUpperLimit;
  }
}
