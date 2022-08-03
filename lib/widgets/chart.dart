import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  final double monthAmount;
  final double dayAmount;

  const Chart({Key? key, required this.dayAmount, required this.monthAmount}) : super(key: key);

  double get percentAmount {
    final double percent = (dayAmount / monthAmount);

    if ((percent + 0.05) < 1) return (percent + 0.05);

    return percent;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 3),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FractionallySizedBox(
                heightFactor: (percentAmount),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green, width: 5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
