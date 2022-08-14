import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transaction.dart';

class TransactionCard extends StatefulWidget {
  final Transaction transaction;
  final Function deleteTransaction;

  const TransactionCard({Key? key, required this.transaction, required this.deleteTransaction}) : super(key: key);

  @override
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: widget.transaction.id,
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        color: Colors.red,
        child: const Icon(Icons.delete),
      ),
      onDismissed: (direction) => setState(() => widget.deleteTransaction(widget.transaction.id)),
      child: Card(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Row(
              children: [
                const Icon(Icons.monetization_on_rounded),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Text(
                    widget.transaction.amount.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    overflow: TextOverflow.clip,
                    widget.transaction.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    //date.toString().substring(0, 16),
                    DateFormat.yMMMEd().format(widget.transaction.date),
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
