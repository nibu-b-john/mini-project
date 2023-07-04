import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:nemesis_hackathon/screens/dummy%20copy.dart';
import 'package:nemesis_hackathon/screens/dummy.dart';
import 'package:nemesis_hackathon/screens/home_page.dart';
import 'package:nemesis_hackathon/screens/profile.dart';
import 'package:nemesis_hackathon/screens/waste_selection.dart';

// void main() => runApp(MaterialApp(home: BottomNavBar()));
//semester
//branch
//subject
//period
class BottomNavBar extends StatefulWidget {
  String email;
  BottomNavBar({super.key, required this.email});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  String userEmail = '';
  List screens = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    screens = [
      const ProfileScreen(),
      HomePage(email: widget.email),
      WasteSelectionPage(email: widget.email),
    ];
    userEmail = widget.email;
    final _db = FirebaseFirestore.instance;
    _db
        .collection('User')
        .where('email', isEqualTo: widget.email)
        .get()
        .then(((value) {
      if (value.docs.length == 0) {
        _db.collection('User').add({'email': widget.email, 'list': []});
      }
    }));
  }

  int _page = 1;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      body: screens[_page],
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 1,
        height: 60.0,
        items: const <Widget>[
          Icon(Icons.perm_identity, color: Colors.white, size: 30),
          Icon(Icons.home, color: Colors.white, size: 30),
          Icon(Icons.abc, color: Colors.white, size: 30),
        ],
        color: Theme.of(context).colorScheme.primary,
        buttonBackgroundColor: Color.fromARGB(255, 62, 46, 88),
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 200),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
    );
  }
}
