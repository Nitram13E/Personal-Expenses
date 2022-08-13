import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class TransactionCard extends StatefulWidget {
  final Uuid id;
  final String title;
  final double amount;
  final DateTime date;
  final Function deleteTransaction;

  const TransactionCard({Key? key, required this.id, required this.title, required this.amount, required this.date, required this.deleteTransaction})
      : super(key: key);

  @override
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.id.toString()),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        color: Colors.red,
        child: const Icon(Icons.delete),
      ),
      onDismissed: (direction) => setState(() => {
            widget.deleteTransaction(widget.id),
            SnackBar(
              content: const Text("Transaction deleted!"),
              action: SnackBarAction(
                label: "UNDO",
                onPressed: () {},
              ),
            )
          }),
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
                    widget.amount.toString(),
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
                    widget.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    //date.toString().substring(0, 16),
                    DateFormat.yMMMEd().format(widget.date),
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
