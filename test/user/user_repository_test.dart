import 'package:flutter_ddd_introduction/user/in_memory_user_repository.dart';
import 'package:flutter_ddd_introduction/user/program.dart';
import 'package:flutter_ddd_introduction/user/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('作成したユーザがリポジトリに登録される', () {
    final userRepository = InMemoryUserRepository();
    final program = Program(userRepository);

    program.createUser('dice');
    final head = userRepository.store.values.first;

    expect(UserName('dice'), head.name);
  });
}
