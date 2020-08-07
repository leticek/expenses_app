import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function buttonHandler;

  NewTransaction({this.buttonHandler});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: EdgeInsets.all(5),
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  hintText: 'Title',
                ),
                controller: titleController,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Amount',
                ),
                controller: amountController,
              ),
              Container(
                margin: EdgeInsets.only(right: 5),
                child: RaisedButton(
                  child: Text('Add Transaction'),
                  onPressed: () {
                    buttonHandler(
                        tTitle: titleController.text,
                        tAmount: double.parse(amountController.text));
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
