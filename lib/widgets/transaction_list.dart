import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/widgets/transaction_card.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> transactions;
  const TransactionList({Key? key, required this.transactions})
      : super(key: key);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.transactions.length,
        itemBuilder: (context, index) => TransactionCard(
            widget.transactions[index].title,
            widget.transactions[index].amount,
            widget.transactions[index].date),
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
