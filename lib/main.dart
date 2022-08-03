import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:personal_expenses/widgets/add_transaction.dart';

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
  final List<Transaction> _transactions = <Transaction>[
    Transaction(title: 'Test 1', amount: 90, date: DateTime(2022, 7, 4)),
    Transaction(title: 'Test 2', amount: 190, date: DateTime(2022, 7, 4)),
    Transaction(title: 'Test 3', amount: 910, date: DateTime(2022, 7, 5)),
    Transaction(title: 'Test 4', amount: 900, date: DateTime(2022, 7, 5)),
    Transaction(title: 'Test 5', amount: 920, date: DateTime(2022, 7, 5)),
    Transaction(title: 'Test 6', amount: 5430, date: DateTime(2022, 7, 6)),
    Transaction(title: 'Test 7', amount: 5460, date: DateTime(2022, 7, 8)),
    Transaction(title: 'Test 8', amount: 7870, date: DateTime(2022, 7, 9)),
    Transaction(title: 'Test 9', amount: 120, date: DateTime(2022, 7, 10)),
  ];

  void _addNewTransaction({required String title, required double amount}) {
    setState(() {
      _transactions.add(Transaction(
        title: title,
        amount: amount,
        date: DateTime.now(),
      ));
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
        addNewTransaction: _addNewTransaction,
        transactions: _transactions,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAddTransactionPanel(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
