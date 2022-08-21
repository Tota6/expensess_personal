// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class NewTransactionList extends StatefulWidget {
  final Function addtransation;

  NewTransactionList(this.addtransation);

  @override
  State<NewTransactionList> createState() => _NewTransactionListState();
}

class _NewTransactionListState extends State<NewTransactionList> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void SubmitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) return;
    widget.addtransation(
        titleController.text, double.parse(amountController.text));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: "Title"),
                  controller: titleController,
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Amount"),
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => SubmitData,
                ),
                Container(
                  height: 90,
                  child: Row(
                    children: <Widget>[
                      Text('No Date Choose'),
                      TextButton(
                        onPressed: () => {},
                        child: const Text(
                          "Choose Date",
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                        style: TextButton.styleFrom(
                          primary: Theme.of(context).primaryColor,
                        ),
                      )
                    ],
                  ),
                ),
                // ignore: deprecated_member_use
                ElevatedButton(
                  onPressed: SubmitData,
                  // textColor: Theme.of(context).primaryColor,
                  style: TextButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      textStyle: TextStyle(
                          color: Theme.of(context)
                              .buttonTheme
                              .colorScheme!
                              .secondary)),
                  child: Text('Add Transaction',
                      style: TextStyle(
                          color: Theme.of(context)
                              .buttonTheme
                              .colorScheme
                              ?.primary)),
                )
              ])),
    );
  }
}
