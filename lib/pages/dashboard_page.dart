import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/widgets/no_transactions.dart';
import 'package:personal_expenses/widgets/transaction_chart.dart';
import 'package:personal_expenses/widgets/transaction_list.dart';

class DashboardPage extends StatefulWidget {
  final Function addNewTransaction;
  final List<Transaction> transactions;
  const DashboardPage(
      {Key? key, required this.addNewTransaction, required this.transactions})
      : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      TransactionChart(transactions: widget.transactions),
      widget.transactions.isNotEmpty
          ? TransactionList(transactions: widget.transactions)
          : const NoTransactions(),
    ]);
  }
}
