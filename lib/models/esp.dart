import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final fo = DateFormat.yMd();
const uui = Uuid();

// ignore: camel_case_types
enum cat { food, travel, leisure, work }

const cateitmcon = {
  cat.food: Icons.lunch_dining,
  cat.travel: Icons.flight_takeoff,
  cat.work: Icons.work,
  cat.leisure: Icons.movie,
};

class esp {
  esp({
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
  }) : id = uui.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final cat category;
  String get fd {
    return fo.format(date);
  }
}

class exb {
 exb({required this.cate, required this.err});
  final cat cate;
  exb.forCate(List<esp> alles,this.cate):err=alles.where((esp) => esp.category==cate).toList();
 
  final List<esp> err;
  double get te {
    double sum = 0;
    for (final e in err) {
      sum += e.amount;
    }
    return sum;
  }
}
