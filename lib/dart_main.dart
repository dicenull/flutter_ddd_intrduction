import 'package:flutter_ddd_introduction/user.dart';

void main() {
  final userId = "id";
  final userName = "dice";
  final user = User(id: userId, name: userName);

  // 1ユーザが自分で重複を確認するのは不自然
  final duplicateCheckResult = user.exists(user);
  print(duplicateCheckResult);
}
