import './widgets/new_transaction_list.dart';
import 'package:flutter/material.dart';
import './widgets/transaction_list.dart';
import 'models/transactions.dart';
import './widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses ',
      theme: ThemeData(
        primaryColor: Colors.deepOrange,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.yellow),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transactions> _userTransaction = [
    // Transactions(
    //   id: "t1",
    //   title: "new shoes",
    //   amount: 225,
    //   date: DateTime.now(),
    // ),
    // Transactions(
    //   id: "t2",
    //   title: "new nail polish",
    //   amount: 16.99,
    //   date: DateTime.now(),
    // ),
  ];

  // List<Transactions> get _recentTransactions {
  //   return _userTransaction.where((tx) {
  //     return tx.date.isAfter(
  //       DateTime.now().subtract(
  //         Duration(days: 7),
  //       ),
  //     );
  //   }).toList();
  // }

  List<Transactions> get _recentTransactions {
    return _userTransaction.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

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

  void _startAddTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: NewTransactionList(_addNewTransaction),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Personal Expenses',
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _startAddTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionList(_userTransaction),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddTransaction(context),
        child: const Icon(Icons.add_circle),
      ),
    );
  }
}
