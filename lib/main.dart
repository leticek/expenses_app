import 'package:expenses_app/transaction.dart';
import 'package:expenses_app/transaction_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyExpensesHome(),
    );
  }
}

class MyExpensesHome extends StatelessWidget {
  final List<Transaction> transactionList = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 75,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'New Shirt',
      amount: 25,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'New Jeans',
      amount: 55,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'New Jacket',
      amount: 85,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Expenses App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Card(
              child: Text('GRAPH'),
            ),
            color: Colors.red,
          ),
          Column(
            children: transactionList.map((ts) {
              return TransactionWidget(
                transaction: ts,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
