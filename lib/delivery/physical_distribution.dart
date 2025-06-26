// TODO: ドメインサービスの例。実装は省略
class PhysicalDistribution {
  Baggage ship(Baggage baggage) {
    throw Exception();
  }

  Baggage receive(Baggage baggage) {
    throw Exception();
  }

  // 物流拠点が配送方法を知っているという振る舞いは正しい?
  void transport(PhysicalDistribution to, Baggage baggage) {
    final shippedBaggage = to.ship(baggage);
    to.receive(shippedBaggage);
  }
}

class Baggage {}
