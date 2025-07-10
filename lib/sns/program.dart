import 'dart:io';

import 'package:flutter_ddd_introduction/sns/in_memory_user_repository.dart';
import 'package:flutter_ddd_introduction/sns/user_application_service.dart';
import 'package:flutter_ddd_introduction/sns/user_repository.dart';
import 'package:flutter_ddd_introduction/sns/user_service.dart';
import 'package:riverpod/riverpod.dart';

final userRepository = Provider<IUserRepository>((ref) {
  return InMemoryUserRepository();
});

final userService = Provider.autoDispose<UserService>((ref) {
  return UserService(ref.watch(userRepository));
});

final userApplicationService = Provider.autoDispose<UserApplicationService>((
  ref,
) {
  final repo = ref.watch(userRepository);
  final service = ref.watch(userService);
  return UserApplicationService(repo, service);
});

class Program {
  final Ref ref;
  Program(this.ref);

  void main() {
    startup();

    while (true) {
      print("Input user name:");
      print(">");
      final input = stdin.readLineSync();

      final appService = ref.read(userApplicationService);
      if (input == null || input.isEmpty) {
        print("User name cannot be empty.");
        continue;
      }
      appService.register(input);

      print('user name: $input registered successfully.');
      print('continue? (y/n)');
      final yesOrNo = stdin.readLineSync();
      if (yesOrNo == 'n') {
        break;
      }
    }
  }

  void startup() {}
}
