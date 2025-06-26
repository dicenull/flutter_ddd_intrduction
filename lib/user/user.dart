void check(User left, User right) {
  if (left == right) {
    print('同じユーザです');
  } else {
    print('異なるユーザです');
  }
}

class User {
  final String id;
  UserName? name;

  User({required this.id, required UserName name}) {
    changeUserName(name);
  }

  void changeUserName(UserName name) {
    this.name = name;
  }

  @override
  operator ==(Object other) {
    if (other is User) {
      // idの比較で同一性を判断
      return id == other.id;
    }
    return false;
  }

  @override
  int get hashCode => id.hashCode;
}

class UserName {
  final String value;

  UserName(this.value) {
    if (value.length < 3) {
      throw Exception('ユーザ名は3文字以上です');
    }
  }
}
