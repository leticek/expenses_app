import 'package:flutter/material.dart';

import './transaction.dart';

class TransactionWidget extends StatelessWidget {
  final Transaction transaction;

  TransactionWidget({this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      margin: EdgeInsets.all(3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: Text(
              this.transaction.amount.toString(),
              style: TextStyle(fontSize: 24),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                this.transaction.title,
                style: TextStyle(fontSize: 24),
              ),
              Text(
                this.transaction.date.toLocal().toString(),
                style: TextStyle(fontSize: 24),
              ),
            ],
          )
        ],
      ),
    );
  }
}
