import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function buttonHandler;

  NewTransaction({this.buttonHandler});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    this.widget.buttonHandler(
          tTitle: enteredTitle,
          tAmount: enteredAmount,
        );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          margin: EdgeInsets.all(5),
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                controller: titleController,
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Amount',
                ),
                controller: amountController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => submitData(),
              ),
              Container(
                margin: EdgeInsets.only(right: 5),
                child: FlatButton(
                  child: Text(
                    'Add Transaction',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () => submitData(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
