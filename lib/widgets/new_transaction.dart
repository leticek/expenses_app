import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function buttonHandler;

  NewTransaction({this.buttonHandler});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _pickedDate;

  void submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _pickedDate == null) {
      return;
    }

    this.widget.buttonHandler(
          tTitle: enteredTitle,
          tAmount: enteredAmount,
          tDate: _pickedDate,
        );

    Navigator.of(context).pop();
  }

  void myDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime(2023))
        .then((value) {
      setState(() {
        if (value == null) return;
        this._pickedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.only(
                top: 5,
                right: 5,
                left: 5,
                bottom: MediaQuery.of(context).viewInsets.bottom + 5),
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Title',
                  ),
                  controller: _titleController,
                  onSubmitted: (_) => submitData(),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Amount',
                  ),
                  controller: _amountController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onSubmitted: (_) => submitData(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(this._pickedDate == null
                          ? 'No date chosen!'
                          : 'Picked date: ${DateFormat.yMd().format(this._pickedDate)}'),
                    ),
                    FlatButton(
                      child: Text(
                        'Choose a date',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: this.myDatePicker,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(right: 5),
                  child: RaisedButton(
                    child: Text(
                      'Add Transaction',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: Theme.of(context).buttonColor,
                    onPressed: () => submitData(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
