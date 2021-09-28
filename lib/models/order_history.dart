import 'package:wurkfux/models/order_status.dart';

class OrderHistory {
  final int id;
  final String orderTitle;
  final String orderSub;
  final OrderStatus orderStatus;
  final String price;

  const OrderHistory(
      {required this.id,
      required this.orderTitle,
      required this.orderSub,
      required this.orderStatus,
      required this.price});
}
