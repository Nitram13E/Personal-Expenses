import 'package:flutter/material.dart';

class InputCard extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType textType;
  const InputCard(
      {Key? key,
      required this.label,
      required this.controller,
      required this.textType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 5),
        child: TextField(
          keyboardType: textType,
          autocorrect: true,
          decoration: InputDecoration(
            labelText: label,
            icon: const Icon(Icons.monetization_on_rounded),
          ),
          textInputAction: TextInputAction.next,
          controller: controller,
        ),
      ),
    );
  }
}
