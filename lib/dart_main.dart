import 'package:flutter_ddd_introduction/user.dart';

void main() {
  final leftUser = User(id: '1', name: 'Alice');
  final rightUser = User(id: '1', name: 'Bob');
  check(leftUser, rightUser); // 同じユーザです 名前が違ってもIDが同じなら同一のユーザ
}
