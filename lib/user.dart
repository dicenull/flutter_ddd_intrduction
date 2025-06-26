void check(User left, User right) {
  if (left == right) {
    print('同じユーザです');
  } else {
    print('異なるユーザです');
  }
}

class User {
  final String id;
  String? name;

  User({required this.id, required String name}) {
    changeUserName(name);
  }

  void changeUserName(String name) {
    if (name.length < 3) {
      throw Exception('ユーザ名は3文字以上です');
    }
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
