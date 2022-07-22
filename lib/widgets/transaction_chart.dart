import 'package:flutter/material.dart';

class TransactionChart extends StatefulWidget {
  const TransactionChart({Key? key}) : super(key: key);

  @override
  State<TransactionChart> createState() => _TransactionChartState();
}

class _TransactionChartState extends State<TransactionChart> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.indigo,
      child: Container(
          margin: const EdgeInsets.all(50), child: const Text('chart')),
    );
  }
}
