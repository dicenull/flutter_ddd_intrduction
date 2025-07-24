import 'package:flutter_ddd_introduction/sns/circle/circle.dart';

class CircleRecommendSpecification {
  final DateTime _executeDateTime;

  CircleRecommendSpecification(this._executeDateTime);

  bool isSatisfiedBy(Circle circle) {
    if (circle.memberCount < 10) {
      return false;
    }

    final oneMonthAgo = _executeDateTime.subtract(Duration(days: 30));
    return circle.createdAt.isAfter(oneMonthAgo);
  }
}
