import 'package:uuid/uuid.dart';

class User {
  late UserId _id;
  late UserName _name;

  UserId get id => _id;
  UserName get name => _name;

  User(UserName name) {
    // (name == null)はコンパイルエラーになるので省略
    _id = UserId(Uuid().v4());
    _name = name;
  }

  User.rename(UserId id, UserName name) {
    // (id == null)はコンパイルエラーになるので省略
    _id = id;
    _name = name;
  }

  void changeName(UserName name) {
    name = name;
  }
}

class UserId {
  final String value;

  UserId(this.value) {
    if (value.isEmpty) {
      throw Exception('ユーザIDは空にできません');
    }
  }
}

class UserName {
  final String value;

  UserName(this.value) {
    if (value.length < 3) {
      throw Exception('ユーザ名は3文字以上です');
    }
    if (value.length > 20) {
      throw Exception('ユーザ名は20文字以下です');
    }
  }
}
