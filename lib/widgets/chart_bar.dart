import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String lable;
  final double spendingAmount;
  final double spendingPercentOfTotal;

  ChartBar(this.lable, this.spendingAmount, this.spendingPercentOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FittedBox(child: Text('\$${spendingAmount.toStringAsFixed(0)}')),
        const SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 20,
          child: Stack(
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 64, 60, 60),
                          width: 1.0),
                      color: Color.fromARGB(255, 138, 136, 136),
                      borderRadius: BorderRadius.circular(20))),
              FractionallySizedBox(
                heightFactor: spendingPercentOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(lable),
      ],
    );
  }
}
