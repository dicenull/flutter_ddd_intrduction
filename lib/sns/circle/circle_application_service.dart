import 'package:flutter_ddd_introduction/sns/circle/circle_create_command.dart';
import 'package:flutter_ddd_introduction/sns/circle/circle_factory.dart';
import 'package:flutter_ddd_introduction/sns/circle/circle_id.dart';
import 'package:flutter_ddd_introduction/sns/circle/circle_is_full_specification.dart';
import 'package:flutter_ddd_introduction/sns/circle/circle_join_command.dart';
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

  void join(CircleJoinCommand command) {
    // 本当はトランザクションをとる
    final memberId = UserId(command.userId);

    final member = _userRepository.findById(memberId);
    if (member == null) {
      throw UserNotFoundException('${command.userId}というユーザーが見つかりません');
    }

    final id = CircleId(command.circleId);
    final circle = _circleRepository.find(id);
    if (circle == null) {
      throw CircleNotFoundException('${command.circleId}というサークルが見つかりません');
    }

    final circleIsFullSpecification = CircleIsFullSpecification(
      _userRepository,
    );

    if (circleIsFullSpecification.isSatisfiedBy(circle)) {
      throw CircleFullException('${circle.id}は満員です');
    }

    circle.join(member);
    _circleRepository.save(circle);
  }
}

class CircleNotFoundException implements Exception {
  final String message;

  CircleNotFoundException(this.message);
}

class CircleAlreadyExistsException implements Exception {
  final String message;

  CircleAlreadyExistsException(this.message);
}

class CircleFullException implements Exception {
  final String message;

  CircleFullException(this.message);
}
