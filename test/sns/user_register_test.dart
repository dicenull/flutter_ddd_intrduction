import 'package:flutter_ddd_introduction/sns/in_memory_user_repository.dart';
import 'package:flutter_ddd_introduction/sns/program.dart';
import 'package:flutter_ddd_introduction/sns/user.dart';
import 'package:flutter_test/flutter_test.dart';

import 'create_container.dart';

void main() {
  group('ユーザ登録', () {
    test('ユーザが最小の文字列で登録できる', () {
      final container = createContainer(
        overrides: [
          userRepositoryPod.overrideWithValue(InMemoryUserRepository()),
        ],
      );

      final userRepository = container.read(userRepositoryPod);
      final userApplicationService = container.read(userApplicationServicePod);

      container.listen(userApplicationServicePod, (_, __) {});

      userApplicationService.register("123");

      // assert
      final user = userRepository.findByName(UserName("123"));
      expect(user, isNotNull);
    });
  });

  test('ユーザが最大の文字列で登録できる', () {
    final container = createContainer(
      overrides: [
        userRepositoryPod.overrideWithValue(InMemoryUserRepository()),
      ],
    );

    final userRepository = container.read(userRepositoryPod);
    final userApplicationService = container.read(userApplicationServicePod);

    container.listen(userApplicationServicePod, (_, __) {});

    userApplicationService.register("12345678901234567890");

    // assert
    final user = userRepository.findByName(UserName("12345678901234567890"));
    expect(user, isNotNull);
  });
}
