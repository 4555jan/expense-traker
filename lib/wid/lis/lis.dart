import 'package:expenxe/wid/lis/ext.dart';
import 'package:flutter/material.dart';
import 'package:expenxe/models/esp.dart';

class lis extends StatelessWidget {
  const lis({super.key, required this.es, required this.ore});
  final List<esp> es;
  final void Function(esp p) ore;
  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: es.length,
      itemBuilder: (context, index) => Dismissible(
          key: ValueKey(es[index]),
          onDismissed: (direction) {
            ore(es[index]);
          },
          child: ext(
            es[index],
          )),
    );
  }
}
