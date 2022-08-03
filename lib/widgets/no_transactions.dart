import 'package:flutter/material.dart';

class NoTransactions extends StatelessWidget {
  const NoTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 250,
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
            child: Image.asset(
              'assets/images/no-transaction.png',
              fit: BoxFit.fitHeight,
            ),
          ),
          const Text('No transactions registered.', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
