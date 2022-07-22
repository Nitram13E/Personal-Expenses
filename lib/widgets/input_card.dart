import 'package:flutter/material.dart';

class InputCard extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  const InputCard(this.label, this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 5),
        child: TextField(
          autocorrect: true,
          decoration: InputDecoration(
            labelText: label,
            icon: const Icon(Icons.monetization_on_rounded),
          ),
          controller: controller,
        ),
      ),
    );
  }
}
