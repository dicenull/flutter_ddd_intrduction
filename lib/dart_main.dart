import 'package:flutter_ddd_introduction/user/user.dart';
import 'package:flutter_ddd_introduction/user/user_service.dart';

void main() {
  final userService = UserService();

  final userId = "id";
  final userName = UserName("dice");
  final user = User(id: userId, name: userName);

  // ドメインサービスに重複を問い合わせ
  final duplicateCheckResult = userService.exists(user);
  print(duplicateCheckResult);
}
