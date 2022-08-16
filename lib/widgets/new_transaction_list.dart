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
                // ignore: deprecated_member_use
                FlatButton(
                  onPressed: SubmitData,
                  textColor: Theme.of(context).primaryColor,
                  child: Text('Add Transaction'),
                )
              ])),
    );
  }
}
