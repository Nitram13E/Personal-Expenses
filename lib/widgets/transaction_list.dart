import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/widgets/transaction_card.dart';

class TransactionList extends StatefulWidget {
  final Function deleteTransaction;
  final List<Transaction> transactions;

  const TransactionList({Key? key, required this.transactions, required this.deleteTransaction}) : super(key: key);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: ListView.builder(
        itemCount: widget.transactions.length,
        itemBuilder: (context, index) => TransactionCard(
          id: widget.transactions[index].id,
          title: widget.transactions[index].title,
          amount: widget.transactions[index].amount,
          date: widget.transactions[index].date,
          deleteTransaction: widget.deleteTransaction,
        ),
      ),
    );
  }
}
