import 'package:flutter/material.dart';

import './models/transaction.dart';
import './widgets/transaction_management.dart';

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
  final List<Transaction> transactionList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Expenses App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Card(
                child: Text('GRAPH'),
              ),
              color: Colors.red,
            ),
            TransactionManagement(),
          ],
        ),
      ),
    );
  }
}
