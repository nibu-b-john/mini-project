import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class ListerList extends ChangeNotifier {
  bool? active;
  List? history;
  String? shop_closing;
  String? material;
  String? latitude;
  String? logitude;
  String? list_time;

  ListerList(
      {this.active,
      this.history,
      this.latitude,
      this.list_time,
      this.logitude,
      this.material,
      this.shop_closing});
}
