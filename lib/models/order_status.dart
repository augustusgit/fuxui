enum OrderStatus { COMPLETED, ONGOING, CANCELLED }

extension OrderStatusExtension on OrderStatus {
  String get name {
    switch (this) {
      case OrderStatus.COMPLETED:
        return 'COMPLETED';
      case OrderStatus.CANCELLED:
        return 'CANCELLED';
      default:
        return 'ONGOING';
    }
  }
}
