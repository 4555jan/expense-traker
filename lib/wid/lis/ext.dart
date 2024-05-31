import 'package:expenxe/models/esp.dart';
import 'package:flutter/material.dart';

class ext extends StatelessWidget {
  const ext(this.exti, {super.key});

  final esp exti;
  @override
  Widget build(context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(exti.title),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text('\$${exti.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [Icon(cateitmcon[exti.category]), Text(exti.fd)],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
