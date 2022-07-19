import 'package:uuid/uuid.dart';

class Transaction {
  final Uuid id = const Uuid();
  final String title;
  final double amount;
  final DateTime date;

  Transaction({required this.title, required this.amount, required this.date});
}
