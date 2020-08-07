import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import '../models/transaction.dart';
import '../widgets/transaction_widget.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;

  TransactionList({@required this.transactionList});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 515,
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return TransactionWidget(
              transaction: transactionList.elementAt(index),
            );
          },
          itemCount: transactionList.length,
        ));
  }
}
