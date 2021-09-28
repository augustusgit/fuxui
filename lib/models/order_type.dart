import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderType {
  final String title;
  final int total;
  final Color color;

  const OrderType({
    required this.title,
    required this.total,
    required this.color,
  });
}
