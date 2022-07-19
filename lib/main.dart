import 'package:flutter/material.dart';
import 'package:personal_expenses/transaction.dart';
import 'package:personal_expenses/transactionCard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        colorSchemeSeed: Colors.lightBlue,
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<Transaction> transactions = [
    Transaction(title: 'Market', amount: 1800, date: DateTime.now()),
    Transaction(title: 'Bus', amount: 18, date: DateTime.now()),
    Transaction(
        title:
            'Large text Large text Large text Large text Large text Large text Large text Large text Large text Large text Large text Large text Large text Large text Large text Large text',
        amount: 18,
        date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter app"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            color: Colors.indigo,
            child: Container(
                margin: const EdgeInsets.all(50), child: const Text('chart')),
          ),
          Column(
            children: transactions
                .map((trans) =>
                    TransactionCard(trans.title, trans.amount, trans.date))
                .toList(),
          )
        ],
      ),
    );
  }
}
