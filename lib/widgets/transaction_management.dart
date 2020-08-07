import 'package:flutter/material.dart';

import '../widgets/new_transaction.dart';
import '../widgets/transaction_list.dart';
import '../models/transaction.dart';

class TransactionManagement extends StatefulWidget {
  @override
  _TransactionManagementState createState() => _TransactionManagementState();
}

class _TransactionManagementState extends State<TransactionManagement> {
  final List<Transaction> transactionList = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      price: 75,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'New Shirt',
      price: 25,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'New Jeans',
      price: 55,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'New Jacket',
      price: 85,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'New Jacket',
      price: 85,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'New Jacket',
      price: 85,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'New Jacket',
      price: 85,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'New Jacket',
      price: 85,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'New Jacket',
      price: 85,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'New Jacket',
      price: 85,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'New Jacket',
      price: 85,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'New Jacket',
      price: 85,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'New Jacket',
      price: 85,
      date: DateTime.now(),
    ),
  ];

  void _addTransaction({String tTitle, double tAmount}) {
    final Transaction t = Transaction(
      id: DateTime.now().toString(),
      title: tTitle,
      price: tAmount,
      date: DateTime.now(),
    );

    setState(() {
      transactionList.add(t);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(
          buttonHandler: this._addTransaction,
        ),
        TransactionList(
          transactionList: this.transactionList,
        ),
      ],
    );
  }
}
