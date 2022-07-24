import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class TransactionChart extends StatefulWidget {
  final List<Transaction> transactions;
  const TransactionChart({Key? key, required this.transactions})
      : super(key: key);

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
