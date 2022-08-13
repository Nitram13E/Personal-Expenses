import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/date_picker.dart';

import 'package:personal_expenses/widgets/input_card.dart';

class AddTransaction extends StatefulWidget {
  final Function addTransaction;

  const AddTransaction({Key? key, required this.addTransaction}) : super(key: key);

  @override
  State<AddTransaction> createState() => AddTransactionState();
}

class AddTransactionState extends State<AddTransaction> {
  static String addTransButton = 'Add transaction';
  static String amountLabel = 'Transaction amount';
  static String titleLabel = 'Transaction description';

  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  DateTime? transactionDate;

  void setDate(DateTime date) {
    transactionDate = date;
  }

  void _addNewTransaction() {
    if (_titleController.text.isEmpty || _amountController.text.isEmpty || (transactionDate == null)) return;

    final String title = _titleController.text;
    final double amount;

    try {
      amount = double.parse(_amountController.text);
    } on FormatException catch (e) {
      return;
    }

    if (amount.isNegative) return;

    widget.addTransaction(
      title: title,
      amount: amount,
      date: transactionDate as DateTime,
    );

    _amountController.clear();
    _titleController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        InputCard(
          label: titleLabel,
          controller: _titleController,
          textType: TextInputType.number,
        ),
        InputCard(
          label: amountLabel,
          controller: _amountController,
          textType: TextInputType.text,
        ),
        DatePicker(setDate: setDate),
        Container(
          margin: const EdgeInsets.all(5),
          child: ElevatedButton(
            onPressed: _addNewTransaction,
            child: Text(addTransButton),
          ),
        ),
      ],
    );
  }
}
