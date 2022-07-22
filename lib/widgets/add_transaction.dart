import 'package:flutter/material.dart';

import 'package:personal_expenses/widgets/input_card.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({Key? key}) : super(key: key);

  @override
  State<AddTransaction> createState() => AddTransactionState();
}

class AddTransactionState extends State<AddTransaction> {
  static String addTransButton = 'Add transaction';

  static String amountLabel = 'Transaction amount';
  final TextEditingController amountController = TextEditingController();

  static String descriptionLabel = 'Transaction description';
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        InputCard(amountLabel, amountController),
        InputCard(descriptionLabel, descriptionController),
        Container(
          margin: const EdgeInsets.all(5),
          child: ElevatedButton(
            child: Text(addTransButton),
            onPressed: () {
              print(amountController.text);
            },
          ),
        ),
      ],
    );
  }
}
