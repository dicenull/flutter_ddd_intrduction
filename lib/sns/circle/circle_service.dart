import 'package:flutter_ddd_introduction/sns/circle/circle.dart';
import 'package:flutter_ddd_introduction/sns/circle/circle_repository.dart';

class CircleService {
  final ICircleRepository _circleRepository;
  CircleService(this._circleRepository);

  bool exists(Circle circle) {
    var duplicated = _circleRepository.findByName(circle.name);
    return duplicated != null;
  }
}
