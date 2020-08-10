import 'package:flutter/material.dart';

import './models/transaction.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: MyExpensesHome(),
    );
  }
}

class MyExpensesHome extends StatefulWidget {
  @override
  _MyExpensesHomeState createState() => _MyExpensesHomeState();
}

class _MyExpensesHomeState extends State<MyExpensesHome> {
  bool _showChart = true;

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

  List<Transaction> get _recentTransactions {
    return this._transactionList.where((element) {
      return element.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addTransaction({String tTitle, double tAmount, DateTime tDate}) {
    final t = Transaction(
      id: DateTime.now().toString(),
      title: tTitle,
      price: tAmount,
      date: tDate,
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

  void deleteTransaction(String id) {
    setState(() {
      this._transactionList.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final appBar = AppBar(
      title: Text('My Expenses App'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => startNewTransaction(context),
        )
      ],
    );
    final transList = Container(
      height: (MediaQuery.of(context).size.height -
              appBar.preferredSize.height -
              MediaQuery.of(context).padding.top) *
          0.7,
      child: TransactionList(
        transactionList: this._transactionList,
        delTransactionFn: this.deleteTransaction,
      ),
    );

    return Scaffold(
      appBar: appBar,
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
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Show Chart',
                    style: TextStyle(fontSize: 16),
                  ),
                  Switch(
                    value: this._showChart,
                    onChanged: (val) {
                      setState(() {
                        _showChart = val;
                      });
                    },
                  )
                ],
              ),
            if (!isLandscape)
              Container(
                  height: (MediaQuery.of(context).size.height -
                          appBar.preferredSize.height -
                          MediaQuery.of(context).padding.top) *
                      0.3,
                  child: Chart(transactions: this._recentTransactions)),
            if (!isLandscape) transList,
            if (isLandscape)
              _showChart
                  ? Container(
                      height: (MediaQuery.of(context).size.height -
                          appBar.preferredSize.height -
                          MediaQuery.of(context).padding.top),
                      child: Chart(transactions: this._recentTransactions))
                  : transList
          ],
        ),
      ),
    );
  }
}
