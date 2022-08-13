import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  final Function setDate;

  const DatePicker({Key? key, required this.setDate}) : super(key: key);

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? date;

  void _selectDate() {
    showDatePicker(
      context: context,
      currentDate: DateTime.now(),
      firstDate: DateTime(1970),
      initialDate: DateTime.now(),
      lastDate: DateTime(2100),
    ).then((selectedDate) => setState(() => {widget.setDate(selectedDate!), date = selectedDate}));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          date == null
              ? const Text(
                  "No date selected.",
                  style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                )
              : Text(
                  date.toString().substring(0, 10),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
          IconButton(
            onPressed: _selectDate,
            icon: const Icon(Icons.date_range),
          )
        ]),
      ),
    );
  }
}
