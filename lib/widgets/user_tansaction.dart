import 'package:flutter/cupertino.dart';
import '../models/transactions.dart';
import 'new_transaction_list.dart';
import 'transaction_list.dart';

class UserTarnsaction extends StatefulWidget {
  @override
  State<UserTarnsaction> createState() => _UserTarnsactionState();
}

class _UserTarnsactionState extends State<UserTarnsaction> {
  final List<Transactions> _userTransaction = [
    Transactions(
      id: "t1",
      title: "new shoes",
      amount: 225,
      date: DateTime.now(),
    ),
    Transactions(
      id: "t2",
      title: "new nail polish",
      amount: 16.99,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String newTitle, double newAmount) {
    final nTransaction = Transactions(
        id: DateTime.now().toString(),
        title: newTitle,
        amount: newAmount,
        date: DateTime.now());
    setState(() {
      _userTransaction.add(nTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransactionList(_addNewTransaction),
        TransactionList(_userTransaction)
      ],
    );
  }
}
