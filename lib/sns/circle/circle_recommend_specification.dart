import 'package:flutter_ddd_introduction/sns/circle/circle.dart';
import 'package:flutter_ddd_introduction/sns/circle/specification_interface.dart';

class CircleRecommendSpecification implements ISpecification<Circle> {
  final DateTime _executeDateTime;

  CircleRecommendSpecification(this._executeDateTime);

  @override
  bool isSatisfiedBy(Circle circle) {
    if (circle.memberCount < 10) {
      return false;
    }

    final oneMonthAgo = _executeDateTime.subtract(Duration(days: 30));
    return circle.createdAt.isAfter(oneMonthAgo);
  }
}
