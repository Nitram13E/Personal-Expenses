import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class TransactionCard extends StatelessWidget {
  final String title;
  final double amount;
  final DateTime date;

  const TransactionCard(this.title, this.amount, this.date, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          margin: const EdgeInsets.all(10),
          child: Row(
            children: [
              const Icon(Icons.monetization_on_rounded),
              Container(
                margin: const EdgeInsets.all(10),
                child: Text(
                  amount.toString(),
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
                  title,
                ),
                Text(
                  date.toString().substring(0, 16),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
