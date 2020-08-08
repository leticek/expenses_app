import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionWidget extends StatelessWidget {
  final Transaction transaction;

  TransactionWidget({this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 3,
              ),
            ),
            padding: EdgeInsets.all(3),
            margin: EdgeInsets.fromLTRB(3, 3, 10, 3),
            child: Text(
              this.transaction.price.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  this.transaction.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  DateFormat('d.M.yyyy').format(this.transaction.date),
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
