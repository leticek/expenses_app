import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import '../models/transaction.dart';
import '../widgets/transaction_widget.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;
  final Function delTransactionFn;

  TransactionList({@required this.transactionList, this.delTransactionFn});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 445,
        child: transactionList.isEmpty
            ? Column(
                children: <Widget>[
                  Text(
                    'No recent transactions!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Image.asset('assets/images/waiting.png',
                        fit: BoxFit.cover),
                    height: 400,
                  ),
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return TransactionWidget(
                    transaction: transactionList.elementAt(index),
                    delTransaction: delTransactionFn,
                  );
                },
                itemCount: transactionList.length,
              ));
  }
}
