import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserList extends ChangeNotifier {
  String? name;
  int? user_id;
  String? organization;
  String? profile_pic;
  double? rating;
  String? type;
  String? details;
  UserList(
      {this.user_id,
      this.details,
      this.organization,
      this.name,
      this.profile_pic,
      this.rating,
      this.type});
}

class SavedUser with ChangeNotifier {
  UserList user = UserList();
  void loggedInUser(int user_id, String organization, String name,
      String profile_pic, double rating, String type, String details) {
    user = UserList(
      user_id: user_id,
      details: details,
      organization: organization,
      name: name,
      profile_pic: profile_pic,
      rating: rating,
      type: type,
    );
  }

  UserList getUser() {
    return user;
  }
}
