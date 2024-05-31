import 'package:expenxe/chart/chart_bar.dart';
import 'package:expenxe/wid/lis/lis.dart';
import 'package:expenxe/models/esp.dart';
import 'package:expenxe/wid/lis/new_expense.dart';

import 'package:flutter/material.dart';

class exp extends StatefulWidget {
  const exp({super.key});

  @override
  State<exp> createState() {
    return _expState();
  }
}

// ignore: camel_case_types
class _expState extends State<exp> {
  final List<esp> _regiex = [

  ];
  void oexo() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return trt(
            oae: Ae,
          );
        });
  }

  void Ae(esp er) {
    setState(() {
      _regiex.add(er);
    });
  }

  void re(esp er) {
    final en = _regiex.indexOf(er);
    setState(() {
      _regiex.remove(er);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 1),
      content: const Text('expense daleted'),
      action: SnackBarAction(
        label: 'undo',
        onPressed: () {
          setState(() {
            _regiex.insert(en, er);
          });
        },
      ),
    ));
  }

  @override
  Widget build(context) {
    Widget mainC = const Center(
      child: Text('No expenses found.Start adding some!'),
    );
    if (_regiex.isEmpty) {
      mainC = lis(
        es: _regiex,
        ore: re,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Expenses',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )),
        backgroundColor: Colors.pink[200],
        actions: [IconButton(onPressed: oexo, icon: const Icon(Icons.add))],
      ),
      body: Column(
        children: [
          chart(expenses: _regiex),
          Expanded(
              child: lis(
            es: _regiex,
            ore: re,
          ))
        ],
      ),
    );
  }
}
