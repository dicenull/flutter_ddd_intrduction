import 'package:flutter_ddd_introduction/sns/unit_of_work.dart';

class User with Entity {
  late UserId _id;
  late UserName _name;
  final bool isPremium;

  UserId get id => _id;
  UserName get name => _name;

  User(UserId id, UserName name, {this.isPremium = false}) {
    // (name == null)はコンパイルエラーになるので省略
    _id = id;
    _name = name;
    markNew();
  }

  User.rename(UserId id, UserName name, {this.isPremium = false}) {
    // (id == null)はコンパイルエラーになるので省略
    _id = id;
    _name = name;
  }

  void changeName(UserName name) {
    _name = name;
    markDirty();
  }
}

class UserId {
  final String value;

  UserId(this.value) {
    if (value.isEmpty) {
      throw Exception('ユーザIDは空にできません');
    }
  }

  @override
  operator ==(Object other) {
    if (other is UserId) {
      return value == other.value;
    }
    return false;
  }

  @override
  int get hashCode => value.hashCode;
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

  @override
  operator ==(Object other) {
    if (other is UserName) {
      return value == other.value;
    }
    return false;
  }

  @override
  int get hashCode => value.hashCode;
}
