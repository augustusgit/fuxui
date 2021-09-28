enum OrderStatus { COMPLETED, PENDING, REJECTED }

extension OrderStatusExtension on OrderStatus {
  String get name {
    switch (this) {
      case OrderStatus.COMPLETED:
        return 'COMPLETED';
      case OrderStatus.REJECTED:
        return 'REJECTED';
      default:
        return 'PENDING';
    }
  }
}
