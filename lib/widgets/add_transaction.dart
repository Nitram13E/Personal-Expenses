import 'package:flutter/material.dart';

import 'package:personal_expenses/widgets/input_card.dart';

class AddTransaction extends StatefulWidget {
  final Function addTransaction;

  const AddTransaction({Key? key, required this.addTransaction})
      : super(key: key);

  @override
  State<AddTransaction> createState() => AddTransactionState();
}

class AddTransactionState extends State<AddTransaction> {
  static String addTransButton = 'Add transaction';
  static String amountLabel = 'Transaction amount';
  static String titleLabel = 'Transaction description';

  final TextEditingController amountController = TextEditingController();
  final TextEditingController titleController = TextEditingController();

  void addNewTransaction() {
    widget.addTransaction(
      title: titleController.text,
      amount: double.parse(amountController.text),
    );
    amountController.clear();
    titleController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        InputCard(
          label: titleLabel,
          controller: titleController,
          textType: TextInputType.number,
        ),
        InputCard(
          label: amountLabel,
          controller: amountController,
          textType: TextInputType.text,
        ),
        Container(
          margin: const EdgeInsets.all(5),
          child: ElevatedButton(
            onPressed: addNewTransaction,
            child: Text(addTransButton),
          ),
        ),
      ],
    );
  }
}
