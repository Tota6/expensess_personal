import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transactions.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  "No transactions added yet",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      radius: 40,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: FittedBox(
                            child: Text(
                          '\$${transactions[index].amount.toStringAsFixed(2)}',
                          style:
                              TextStyle(color: Color.fromARGB(255, 73, 56, 5)),
                          // style: Theme.of(context).textTheme.titleSmall,
                        )),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(
                        DateFormat.yMMMMd().format(transactions[index].date)),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
