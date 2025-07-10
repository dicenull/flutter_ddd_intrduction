import 'dart:io';

import 'package:flutter_ddd_introduction/sns/user_application_service.dart';
import 'package:flutter_ddd_introduction/sns/user_factory.dart';
import 'package:flutter_ddd_introduction/sns/user_repository.dart';
import 'package:flutter_ddd_introduction/sns/user_service.dart';
import 'package:riverpod/riverpod.dart';

final userRepositoryPod = Provider<IUserRepository>(
  (ref) => throw UnimplementedError(),
);

final userFactoryPod = Provider.autoDispose<IUserFactory>((ref) {
  throw UnimplementedError();
});

final userServicePod = Provider.autoDispose<UserService>((ref) {
  return UserService(ref.watch(userRepositoryPod));
});

final userApplicationServicePod = Provider.autoDispose<UserApplicationService>((
  ref,
) {
  final repo = ref.watch(userRepositoryPod);
  final service = ref.watch(userServicePod);
  final factory = ref.watch(userFactoryPod);

  return UserApplicationService(repo, service, factory);
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

      final appService = ref.read(userApplicationServicePod);
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
