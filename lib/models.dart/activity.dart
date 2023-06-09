import 'package:flutter/cupertino.dart';

class Acitivity {
  final String date;
  final String time;
  final String type;
  final IconData icon;
  final bool accepted;
  Acitivity(
      {required this.date,
      required this.time,
      required this.type,
      required this.accepted,
      required this.icon});
}
