import 'package:flutter/cupertino.dart';

class Transaction {
  final UniqueKey id = UniqueKey();
  final String title;
  final double amount;
  final DateTime date;

  Transaction({required this.title, required this.amount, required this.date});
}
