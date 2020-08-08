import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String dayLabel;
  final double amount;
  final double prctAmount;

  ChartBar({
    this.dayLabel,
    this.amount,
    this.prctAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          child: Text('$amount Kč'),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.8,
                    color: Theme.of(context).accentColor,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              FractionallySizedBox(
                heightFactor: this.prctAmount,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text('$dayLabel'),
      ],
    );
  }
}
