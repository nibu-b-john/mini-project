import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nemesis_hackathon/services/auth.dart';

class firestoreHelper {
  // User

  static Future<void> createUser(dynamic user) async {
    final userCol = FirebaseFirestore.instance.collection('users');
    // String? conUser = Authservice().currentUser?.uid;
    // log(user.toString());
    // final docRef = userCol.doc(conUser);

    final newUser = {
      'user_id': user.id,
      'name': user.name,
      'type': user.type,
      'organization': user.organization,
      'profile_pic': user.profile_pic,
      'rating': user.rating
    };

    try {
      // await docRef.set(newUser);
      print(json);
    } catch (e) {
      print('Error: $e');
    }
  }

  static Future<dynamic> readUser() async {
    Map<String, dynamic>? ndata;
    // String? conUser = Authservice().currentUser?.uid;
    // await FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(conUser)
    //     .get()
    //     .then((value) => {ndata = value.data()})
    //     .catchError((error) =>
    //         {print("Error on get data from User"), print(error.toString())});
    // // print(ndata);
    return ndata;
  }

  // Lister

  static Future<void> createLister(dynamic user) async {
    final userCol = FirebaseFirestore.instance.collection('listers');
    // String? conUser = Authservice().currentUser?.uid;
    // log(user.toString());
    // final docRef = userCol.doc(conUser);

    final newUser = {
      'name': user.name,
      'type': user.type,
      'organization': user.organization,
      'profile_pic': user.profile_pic,
      'rating': user.rating
    };

    try {
      // await docRef.set(newUser);
      print(json);
    } catch (e) {
      print('Error: $e');
    }
  }

  static Future<void> readLister() async {
    Map<String, dynamic>? ndata;
    // String? conUser = Authservice().currentUser?.uid;
    await FirebaseFirestore.instance
        .collection('listers')
        // .doc(conUser)
        .get()
        // .then((value) => {ndata = value.data()})
        .catchError((error) =>
            {print("Error on get data from User"), print(error.toString())});
    print(ndata);
  }

  // Pickup

  static Future<void> createPickup(dynamic user) async {
    final userCol = FirebaseFirestore.instance.collection('pickups');
    // String? conUser = Authservice().currentUser?.uid;
    // log(user.toString());
    // final docRef = userCol.doc(conUser);

    final newUser = {
      'name': user.name,
      'type': user.type,
      'organization': user.organization,
      'profile_pic': user.profile_pic,
      'rating': user.rating
    };

    try {
      // await docRef.set(newUser);
      print(json);
    } catch (e) {
      print('Error: $e');
    }
  }

  static Future<void> readPickup() async {
    Map<String, dynamic>? ndata;
    // String? conUser = Authservice().currentUser?.uid;
    await FirebaseFirestore.instance
        .collection('pickups')
        // .doc(conUser)
        .get()
        // .then((value) => {ndata = value.data()})
        .catchError((error) =>
            {print("Error on get data from User"), print(error.toString())});
    print(ndata);
  }
}
