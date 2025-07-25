import 'package:flutter_ddd_introduction/sns/circle/circle.dart';
import 'package:flutter_ddd_introduction/sns/circle/circle_id.dart';
import 'package:flutter_ddd_introduction/sns/circle/circle_name.dart';
import 'package:flutter_ddd_introduction/sns/circle/specification_interface.dart';

abstract class ICircleRepository {
  void save(Circle circle);
  Circle? find(CircleId id);
  Circle? findByName(CircleName name);

  List<Circle> findBySpecification(ISpecification<Circle> specification);
  List<Circle> findAll();
}
