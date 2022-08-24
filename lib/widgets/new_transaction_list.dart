import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransactionList extends StatefulWidget {
  final Function addtransation;

  NewTransactionList(this.addtransation);

  @override
  State<NewTransactionList> createState() => _NewTransactionListState();
}

class _NewTransactionListState extends State<NewTransactionList> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.parse('0000-00-00');

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty ||
        enteredAmount <= 0 ||
        _selectedDate == DateTime.parse('0000-00-00')) {
      return;
    }
    widget.addtransation(
      _titleController.text,
      double.parse(_amountController.text),
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
                  controller: _titleController,
                  onSubmitted: (_) => _submitData(),
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Amount"),
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => _submitData(),
                ),
                Container(
                  height: 90,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(_selectedDate ==
                                DateTime.parse('0000-00-00')
                            ? 'No Date Chooose!'
                            : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}'),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          primary: Theme.of(context).primaryColor,
                        ),
                        child: const Text(
                          "Choose Date",
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                        onPressed: () => _presentDatePicker(),
                      )
                    ],
                  ),
                ),
                // ignore: deprecated_member_use
                ElevatedButton(
                  onPressed: _submitData,
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
