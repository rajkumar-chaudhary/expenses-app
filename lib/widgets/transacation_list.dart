import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_items.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      child: transactions.isEmpty
          ? LayoutBuilder(builder: (ctx, constraints) {
              return Column(
                children: <Widget>[
                  Text(
                    'No transactions added yet!',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.7,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            })
          : ListView(
              children: transactions.map((tx) {
                return TransactionItems(
                    key: ValueKey(tx.id), transaction: tx, deleteTx: deleteTx);
              }).toList(),
            ),
      // : ListView.builder(
      //     itemBuilder: (context, index) {
      //       return TransactionItems(
      //           key: ValueKey(transactions[index].id),
      //           transaction: transactions[index],
      //           deleteTx: deleteTx);
      //     },
      //     itemCount: transactions.length,
      //   ),
    );
  }
}
