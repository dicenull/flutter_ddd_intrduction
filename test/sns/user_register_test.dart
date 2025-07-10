import 'package:flutter_ddd_introduction/sns/in_memory_user_factory.dart';
import 'package:flutter_ddd_introduction/sns/in_memory_user_repository.dart';
import 'package:flutter_ddd_introduction/sns/program.dart';
import 'package:flutter_ddd_introduction/sns/user.dart';
import 'package:flutter_test/flutter_test.dart';

import 'create_container.dart';

void main() {
  group('ユーザ登録', () {
    buildSut() {
      final container = createContainer(
        overrides: [
          userRepositoryPod.overrideWithValue(InMemoryUserRepository()),
          userFactoryPod.overrideWithValue(InMemoryUserFactory()),
        ],
      );

      final userRepository = container.read(userRepositoryPod);
      final userApplicationService = container.read(userApplicationServicePod);
      final userFactory = container.read(userFactoryPod);

      container.listen(userApplicationServicePod, (_, __) {});

      return (userRepository, userApplicationService, userFactory);
    }

    test('ユーザが最小の文字列で登録できる', () {
      final (userRepository, userApplicationService, _) = buildSut();

      userApplicationService.register("123");

      // assert
      final user = userRepository.findByName(UserName("123"));
      expect(user, isNotNull);
    });

    test('ユーザが最大の文字列で登録できる', () {
      final (userRepository, userApplicationService, _) = buildSut();

      userApplicationService.register("12345678901234567890");

      // assert
      final user = userRepository.findByName(UserName("12345678901234567890"));
      expect(user, isNotNull);
    });

    test('ユーザ名は最小の文字列未満で登録できない', () {
      final (_, userApplicationService, _) = buildSut();

      bool exceptionOccurred = false;
      try {
        userApplicationService.register("12");
      } catch (e) {
        exceptionOccurred = true;
      }
      expect(exceptionOccurred, isTrue);
    });

    test('ユーザ名は最大の文字列を超えて登録できない', () {
      final (_, userApplicationService, _) = buildSut();

      bool exceptionOccurred = false;
      try {
        userApplicationService.register("123456789012345678901");
      } catch (e) {
        exceptionOccurred = true;
      }
      expect(exceptionOccurred, isTrue);
    });

    test('重複したユーザ名で登録できない', () {
      final (userRepository, userApplicationService, userFactory) = buildSut();

      userRepository.save(userFactory.create(UserName("test-user")));

      bool exceptionOccurred = false;
      try {
        userApplicationService.register("test-user");
      } catch (e) {
        exceptionOccurred = true;
      }
      expect(exceptionOccurred, isTrue);
    });
  });
}
