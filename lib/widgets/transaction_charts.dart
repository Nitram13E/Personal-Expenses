import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/widgets/chart.dart';

import 'package:intl/intl.dart';

class TransactionCharts extends StatefulWidget {
  final List<Transaction> transactions;
  const TransactionCharts({Key? key, required this.transactions}) : super(key: key);

  @override
  State<TransactionCharts> createState() => _TransactionChartsState();
}

class _TransactionChartsState extends State<TransactionCharts> {
  /*

  Map<String, DailyTransactions> get _monthTransactions {
    final Map<String, DailyTransactions> dailyTransactions = {};
    DateTime actualMonth = DateTime.now().subtract(const Duration(days: 30));

    for (final Transaction transaction in widget.transactions) {
      if (transaction.date.isAfter(actualMonth)) {
        final date = transaction.date.toString().substring(0, 10);

        if (dailyTransactions.containsKey(date)) {
          dailyTransactions[date]!.finalAmount = dailyTransactions[date]!.finalAmount + transaction.amount;
        } else {
          dailyTransactions[date] = DailyTransactions(finalAmount: transaction.amount);
          _daysOfTheMonth.add(date);
        }

        dailyTransactions[date]!.addTransaction(transaction: transaction);
      }
    }

    return dailyTransactions;
  }
  */

  List<String> get _daysOfTheMonth {
    return _monthTransactions.keys.toList();
  }

  Map<String, double> get _monthTransactions {
    final Map<String, double> dailyAmounts = {};
    DateTime actualMonth = DateTime.now().subtract(const Duration(days: 30));

    for (final Transaction transaction in widget.transactions) {
      if (transaction.date.isAfter(actualMonth)) {
        final date = transaction.date.toString().substring(0, 10);

        if (dailyAmounts.containsKey(date)) {
          dailyAmounts[date] = dailyAmounts[date]! + transaction.amount;
        } else {
          dailyAmounts[date] = transaction.amount;
        }
      }
    }
    return dailyAmounts;
  }

  double get _monthTotalAmount {
    double totalAmount = 0;

    for (Transaction t in widget.transactions) {
      totalAmount += t.amount;
    }

    return totalAmount;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _daysOfTheMonth.length,
        itemBuilder: (context, index) => Card(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  DateFormat.MMMEd().format(DateTime.parse(_daysOfTheMonth[index])),
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                Chart(monthAmount: _monthTotalAmount, dayAmount: _monthTransactions[_daysOfTheMonth[index]]!),
                Text('\$${_monthTransactions[_daysOfTheMonth[index]]!}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
