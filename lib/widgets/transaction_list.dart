import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/widgets/transaction_card.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({Key? key}) : super(key: key);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final List<Transaction> _transactions = [
    Transaction(title: 'Market', amount: 1800, date: DateTime.now()),
    Transaction(title: 'Bus', amount: 18, date: DateTime.now()),
    Transaction(
        title:
            'Large text Large text Large text Large text Large text Large text Large text Large text Large text Large text Large text Large text Large text Large text Large text Large text',
        amount: 10000,
        date: DateTime.now()),
  ];

  void _addNewTransaction(String title, double amount) {
    _transactions.add(Transaction(
      title: title,
      amount: amount,
      date: DateTime.now(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: _transactions.length,
        itemBuilder: (context, index) => TransactionCard(
            _transactions[index].title,
            _transactions[index].amount,
            _transactions[index].date),
      ),
    );
    /* return Column(
      children: _transactions
          .map(
              (trans) => TransactionCard(trans.title, trans.amount, trans.date))
          .toList(),
    ); */
  }
}