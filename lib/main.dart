import 'package:flutter/material.dart';

import './models/transaction.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyExpensesHome(),
    );
  }
}

class MyExpensesHome extends StatefulWidget {
  @override
  _MyExpensesHomeState createState() => _MyExpensesHomeState();
}

class _MyExpensesHomeState extends State<MyExpensesHome> {
  final List<Transaction> _transactionList = [
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
  ];

  void _addTransaction({String tTitle, double tAmount}) {
    final t = Transaction(
      id: DateTime.now().toString(),
      title: tTitle,
      price: tAmount,
      date: DateTime.now(),
    );

    setState(() {
      _transactionList.add(t);
    });
  }

  void startNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(
            buttonHandler: this._addTransaction,
          ),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Expenses App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => startNewTransaction(context),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => startNewTransaction(context),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Card(
                child: Text('GRAPH'),
              ),
              color: Colors.red,
            ),
            TransactionList(
              transactionList: this._transactionList,
            ),
          ],
        ),
      ),
    );
  }
}
