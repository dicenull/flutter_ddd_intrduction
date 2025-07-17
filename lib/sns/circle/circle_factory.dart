import 'package:flutter_ddd_introduction/sns/circle/circle.dart';
import 'package:flutter_ddd_introduction/sns/circle/circle_name.dart';
import 'package:flutter_ddd_introduction/sns/user/user.dart';

abstract class ICircleFactory {
  Circle create(CircleName name, User owner);
}
