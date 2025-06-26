import 'package:flutter_ddd_introduction/delivery/physical_distribution.dart';

class TransportService {
  void transport(
    PhysicalDistribution from,
    PhysicalDistribution to,
    Baggage baggage,
  ) {
    final shippedBaggage = from.ship(baggage);
    to.receive(shippedBaggage);
  }
}
