import 'package:flutter_ddd_introduction/sns/circle/circle_create_command.dart';
import 'package:flutter_ddd_introduction/sns/circle/circle_factory.dart';
import 'package:flutter_ddd_introduction/sns/circle/circle_name.dart';
import 'package:flutter_ddd_introduction/sns/circle/circle_repository.dart';
import 'package:flutter_ddd_introduction/sns/circle/circle_service.dart';
import 'package:flutter_ddd_introduction/sns/user/user.dart';
import 'package:flutter_ddd_introduction/sns/user/user_application_service.dart';
import 'package:flutter_ddd_introduction/sns/user/user_repository.dart';

class CircleApplicationService {
  final ICircleFactory _circleFactory;
  final ICircleRepository _circleRepository;
  final CircleService _circleService;
  final IUserRepository _userRepository;

  CircleApplicationService(
    this._circleFactory,
    this._circleRepository,
    this._circleService,
    this._userRepository,
  );

  void create(CircleCreateCommand command) {
    // 本当はトランザクションをとる

    final ownerId = UserId(command.userId);

    final owner = _userRepository.findById(ownerId);

    if (owner == null) {
      throw UserNotFoundException('${command.userId}がオーナーのサークルが見つかりません');
    }

    final name = CircleName(command.name);
    final circle = _circleFactory.create(name, owner);
    if (_circleService.exists(circle)) {
      throw CircleAlreadyExistsException('${command.name}という名前のサークルは既に存在します');
    }

    _circleRepository.save(circle);
  }
}

class CircleAlreadyExistsException implements Exception {
  final String message;

  CircleAlreadyExistsException(this.message);
}
