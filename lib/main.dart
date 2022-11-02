import 'package:flutter/services.dart';
import './widgets/new_transaction_list.dart';
import 'package:flutter/material.dart';
import './widgets/transaction_list.dart';
import 'models/transactions.dart';
import './widgets/chart.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //   [
  //     DeviceOrientation.portraitDown,
  //     DeviceOrientation.portraitUp,
  //   ],
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expenses ',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Color.fromARGB(255, 206, 128, 3),
            secondary: Color.fromARGB(255, 151, 115, 6)),
        textTheme: Theme.of(context)
            .textTheme
            .apply(bodyColor: Color.fromARGB(255, 62, 41, 7)),
        buttonTheme: ButtonThemeData(
            // textTheme: ButtonTextTheme.primary,
            colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: Colors.white,
                secondary: Color.fromARGB(255, 151, 115, 6))),
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

  bool _showChart = false;

  List<Transactions> get _recentTransactions {
    return _userTransaction.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(
      String newTitle, double newAmount, DateTime choosenDate) {
    final nTransaction = Transactions(
        id: DateTime.now().toString(),
        title: newTitle,
        amount: newAmount,
        date: choosenDate);

    setState(() {
      _userTransaction.add(nTransaction);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransaction.removeWhere((tx) => tx.id == id);
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
    final islandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final appBar = AppBar(
      title: const Text(
        'Personal Expenses',
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () => _startAddTransaction(context),
        ),
      ],
    );
    final txListWidgets = Container(
      height: (MediaQuery.of(context).size.height -
              appBar.preferredSize.height -
              MediaQuery.of(context).padding.top) *
          0.7,
      child: TransactionList(_userTransaction, _deleteTransaction),
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (islandScape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Show Chart'),
                  Switch(
                    value: _showChart,
                    onChanged: (val) {
                      setState(
                        () {
                          _showChart = val;
                        },
                      );
                    },
                  ),
                ],
              ),
            // show both chart and textlist in portrait
            if (!islandScape)
              Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.3,
                child: Chart(_recentTransactions),
              ),
            if (!islandScape) txListWidgets,
            // if its on land scape mood so the button of chart will apper to show chart or to hide it
            if (islandScape)
              _showChart
                  ? Container(
                      height: (MediaQuery.of(context).size.height -
                              appBar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.7,
                      child: Chart(_recentTransactions),
                    )
                  : txListWidgets,
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddTransaction(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
