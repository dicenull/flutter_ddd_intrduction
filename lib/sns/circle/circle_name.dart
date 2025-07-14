class CircleName {
  final String value;

  CircleName(this.value) {
    if (value.length < 3) {
      throw Exception('サークル名は3文字以上です');
    }
    if (value.length > 20) {
      throw Exception('サークル名は20文字以下です');
    }
  }

  @override
  operator ==(Object other) {
    if (other is CircleName) {
      return value == other.value;
    }
    return false;
  }

  @override
  int get hashCode => value.hashCode;
}
