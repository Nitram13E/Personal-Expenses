import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/widgets/add_transaction.dart';
import 'package:uuid/uuid.dart';

import 'pages/dashboard_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final String appName = 'Personal Expenses';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        colorSchemeSeed: Colors.lightBlue,
        brightness: Brightness.dark,
        useMaterial3: true,
        fontFamily: 'OpenSans',
      ),
      home: MyHomePage(appName: appName),
      debugShowCheckedModeBanner: false,
      scrollBehavior: CustomScrollBehavior(),
    );
  }
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class MyHomePage extends StatefulWidget {
  final String appName;
  const MyHomePage({Key? key, required this.appName}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = <Transaction>[];

  void _addNewTransaction({required String title, required double amount, required DateTime date}) {
    setState(() {
      _transactions.add(Transaction(
        title: title,
        amount: amount,
        date: date,
      ));
    });
  }

  void _deleteTransaction(UniqueKey transactionId) {
    setState(() {
      _transactions.removeWhere((transaction) => transaction.id == transactionId);
    });
  }

  void showAddTransactionPanel(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (a) {
          return AddTransaction(addTransaction: _addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appName),
      ),
      body: DashboardPage(
        deleteTransaction: _deleteTransaction,
        transactions: _transactions,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAddTransactionPanel(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
