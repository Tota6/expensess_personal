import 'package:flutter/material.dart';

class NewTransactionList extends StatelessWidget {
  final Function addtransation;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransactionList(this.addtransation);

  void SubmitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) return;
    addtransation(titleController.text, double.parse(amountController.text));
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
                  decoration: InputDecoration(labelText: "Tiltle"),
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
                  textColor: Color.fromARGB(255, 243, 108, 59),
                  child: Text('Add Transaction'),
                )
              ])),
    );
  }
}
