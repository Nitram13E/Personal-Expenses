import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/widgets/no_transactions.dart';
import 'package:personal_expenses/widgets/transaction_charts.dart';
import 'package:personal_expenses/widgets/transaction_list.dart';

class DashboardPage extends StatefulWidget {
  final Function deleteTransaction;

  final List<Transaction> transactions;
  const DashboardPage({Key? key, required this.deleteTransaction, required this.transactions}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    if (!widget.transactions.isNotEmpty) return const NoTransactions();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TransactionCharts(transactions: widget.transactions),
        TransactionList(transactions: widget.transactions, deleteTransaction: widget.deleteTransaction)
      ],
    );
  }
}
