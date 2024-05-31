import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:expenxe/chart/chart.dart';
import 'package:expenxe/models/esp.dart';

class chart extends StatelessWidget {
  const chart({super.key, required this.expenses});
  final List<esp> expenses;
  List<exb> get buckets {
    return [
      exb.forCate(expenses, cat.food),
      exb.forCate(expenses, cat.leisure),
      exb.forCate(expenses, cat.travel),
      exb.forCate(expenses, cat.work),
    ];
  }

  double get te {
    double maxTotalExpense = 0;

    for (final bucket in buckets) {
      if (bucket.te > maxTotalExpense) {
        maxTotalExpense = bucket.te;
      }
    }

    return maxTotalExpense;
  }

  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.3),
            Theme.of(context).colorScheme.primary.withOpacity(0.0)
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              for (final bucket in buckets) // alternative to map()
                ChartBar(
                  fill: bucket.te == 0 ? 0 : bucket.te / this.te,
                )
            ],
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: buckets // for ... in
              .map(
                (bucket) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Icon(
                      cateitmcon[bucket.cate],
                    ),
                  ),
                ),
              )
              .toList(),
        )
      ]),
    );
  }
}
