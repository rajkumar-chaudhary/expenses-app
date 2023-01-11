import 'dart:math';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItems extends StatefulWidget {
  const TransactionItems({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  State<TransactionItems> createState() => _TransactionItemsState();
}

class _TransactionItemsState extends State<TransactionItems> {
  Color _bgColor;
  void initState() {
    const availableColors = [
      Colors.purple,
      Colors.blue,
      Colors.yellow,
      Colors.cyan
    ];
    _bgColor = availableColors[Random().nextInt(4)];
    super.initState();
  }

  // static const availableColors = [
  //   Colors.purple,
  //   Colors.blue,
  //   Colors.yellow,
  //   Colors.cyan
  // ];
  // Color _bgColor = availableColors[Random().nextInt(4)];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        //we can use this in place of cicular avatar;
        //leading:Container(
        //height:60,
        // width:60,
        // decoration:BoxDecoration(
        //   color: Theme.of(context).primaryColor,
        //   shape:BoxShape.circle,
        // ),
        //),
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text('\$${widget.transaction.amount}'),
            ),
          ),
        ),
        title: Text(widget.transaction.title),
        // style: Theme.of(context).textTheme.title,
        subtitle: Text(
          DateFormat.yMMMd().format(widget.transaction.date),
        ),

        trailing: MediaQuery.of(context).size.width > 300
            ? TextButton.icon(
                onPressed: () => widget.deleteTx(widget.transaction.id),
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                label: const Text(
                  'Delete',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                // style: TextButton.styleFrom(
                //   textStyle: TextStyle(
                //     color: Colors.red,
                //   ),
                // ),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => widget.deleteTx(widget.transaction.id),
              ),
      ),
    );
  }
}
