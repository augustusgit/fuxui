import 'package:wurkfux/models/order_status.dart';

class OrderHistory {
  final int id;
  final String orderTitle;
  final String orderSub;
  final OrderStatus orderStatus;
  final String price;
  final String imageUrl;

  const OrderHistory({
    required this.id,
    required this.orderTitle,
    required this.orderSub,
    required this.orderStatus,
    required this.price,
    required this.imageUrl,
  });
}

final completedHistories = [
  OrderHistory(
      id: 1,
      orderTitle: 'Graphics Design',
      orderSub: 'Neque porro quisquam est qui dolorem ipsum quia '
          'dolor sit amet, consectetur, adipisci velit...',
      orderStatus: OrderStatus.COMPLETED,
      price: '200',
      imageUrl: 'https://i.pinimg'
          '.com/736x/15/77/88/1577881389bcddb7850b40a11fe40b00.jpg'),
  OrderHistory(
      id: 2,
      orderTitle: 'Graphics Design',
      orderSub: 'Neque porro quisquam est qui dolorem ipsum quia '
          'dolor sit amet, consectetur, adipisci velit...',
      orderStatus: OrderStatus.COMPLETED,
      price: '1,000',
      imageUrl: 'https://i.pinimg'
          '.com/736x/15/77/88/1577881389bcddb7850b40a11fe40b00.jpg'),
  OrderHistory(
      id: 3,
      orderTitle: 'Graphics Design',
      orderSub: 'Neque porro quisquam est qui dolorem ipsum quia '
          'dolor sit amet, consectetur, adipisci velit...',
      orderStatus: OrderStatus.COMPLETED,
      price: '750',
      imageUrl: 'https://i.pinimg'
          '.com/736x/15/77/88/1577881389bcddb7850b40a11fe40b00.jpg'),
  OrderHistory(
      id: 4,
      orderTitle: 'Graphics Design',
      orderSub: 'Neque porro quisquam est qui dolorem ipsum quia '
          'dolor sit amet, consectetur, adipisci velit...',
      orderStatus: OrderStatus.COMPLETED,
      price: '400',
      imageUrl: 'https://i.pinimg'
          '.com/736x/15/77/88/1577881389bcddb7850b40a11fe40b00.jpg'),
];

final activeHistories = [
  OrderHistory(
      id: 1,
      orderTitle: 'Graphics Design',
      orderSub: 'Neque porro quisquam est qui dolorem ipsum quia '
          'dolor sit amet, consectetur, adipisci velit...',
      orderStatus: OrderStatus.ONGOING,
      price: '200',
      imageUrl: 'https://i.pinimg'
          '.com/736x/15/77/88/1577881389bcddb7850b40a11fe40b00.jpg'),
  OrderHistory(
      id: 2,
      orderTitle: 'Graphics Design',
      orderSub: 'Neque porro quisquam est qui dolorem ipsum quia '
          'dolor sit amet, consectetur, adipisci velit...',
      orderStatus: OrderStatus.ONGOING,
      price: '1,000',
      imageUrl: 'https://i.pinimg'
          '.com/736x/15/77/88/1577881389bcddb7850b40a11fe40b00.jpg'),
  OrderHistory(
      id: 3,
      orderTitle: 'Graphics Design',
      orderSub: 'Neque porro quisquam est qui dolorem ipsum quia '
          'dolor sit amet, consectetur, adipisci velit...',
      orderStatus: OrderStatus.ONGOING,
      price: '750',
      imageUrl: 'https://i.pinimg'
          '.com/736x/15/77/88/1577881389bcddb7850b40a11fe40b00.jpg'),
  OrderHistory(
      id: 4,
      orderTitle: 'Graphics Design',
      orderSub: 'Neque porro quisquam est qui dolorem ipsum quia '
          'dolor sit amet, consectetur, adipisci velit...',
      orderStatus: OrderStatus.ONGOING,
      price: '400',
      imageUrl: 'https://i.pinimg'
          '.com/736x/15/77/88/1577881389bcddb7850b40a11fe40b00.jpg'),
  OrderHistory(
      id: 5,
      orderTitle: 'Graphics Design',
      orderSub: 'Neque porro quisquam est qui dolorem ipsum quia '
          'dolor sit amet, consectetur, adipisci velit...',
      orderStatus: OrderStatus.ONGOING,
      price: '400',
      imageUrl: 'https://i.pinimg'
          '.com/736x/15/77/88/1577881389bcddb7850b40a11fe40b00.jpg'),
  OrderHistory(
      id: 6,
      orderTitle: 'Graphics Design',
      orderSub: 'Neque porro quisquam est qui dolorem ipsum quia '
          'dolor sit amet, consectetur, adipisci velit...',
      orderStatus: OrderStatus.ONGOING,
      price: '400',
      imageUrl: 'https://i.pinimg'
          '.com/736x/15/77/88/1577881389bcddb7850b40a11fe40b00.jpg'),
];

final cancelledHistories = [
  OrderHistory(
      id: 1,
      orderTitle: 'Graphics Design',
      orderSub: 'Neque porro quisquam est qui dolorem ipsum quia '
          'dolor sit amet, consectetur, adipisci velit...',
      orderStatus: OrderStatus.CANCELLED,
      price: '200',
      imageUrl: 'https://i.pinimg'
          '.com/736x/15/77/88/1577881389bcddb7850b40a11fe40b00.jpg'),
  OrderHistory(
      id: 2,
      orderTitle: 'Graphics Design',
      orderSub: 'Neque porro quisquam est qui dolorem ipsum quia '
          'dolor sit amet, consectetur, adipisci velit...',
      orderStatus: OrderStatus.CANCELLED,
      price: '1,000',
      imageUrl: 'https://i.pinimg'
          '.com/736x/15/77/88/1577881389bcddb7850b40a11fe40b00.jpg'),
];
