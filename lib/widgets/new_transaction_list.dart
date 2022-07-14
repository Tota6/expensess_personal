import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class NewTransactionList extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

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
                  // onChanged: (val) {
                  //   titleInput = val;
                  // },
                  controller: titleController,
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Amount"),
                  // onChanged: (val) {
                  //   amountInput = val;
                  // },
                  controller: amountController,
                ),
                // ignore: deprecated_member_use
                FlatButton(
                  onPressed: () {
                    print(titleController.text);
                  },
                  textColor: Color.fromARGB(255, 243, 108, 59),
                  child: Text('Add Transaction'),
                )
              ])),
    );
  }
}
