import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nemesis_hackathon/data/user_list.dart';
import 'package:nemesis_hackathon/screens/dummy.dart';
import 'package:nemesis_hackathon/screens/maps_delivery.dart';
import 'package:nemesis_hackathon/widgets/bottomNavbar.dart';
import 'package:nemesis_hackathon/widgets/hamburger.dart';
import 'package:provider/provider.dart';
import '../widgets/notiLeaveForm.dart';
import '../widgets/notiLeaveFormUser.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<SavedUser>(context, listen: false).getUser();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('History'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: const HamburgerDrawer(),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage(
            'assets/homepage.jpg',
          ),
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 70,
                ),
                const NotiLeaveWidgetUser(
                  // 9.582355615460715, 76.97034483525111
                  // day: listOfLeaveForms.getlistForLeaveForm[index].day,
                  from: 'Donate',
                  to: 'Non-Recyclable',
                  status: 'Hello',
                  typeOFLeave: 'Hello',
                  numberOfDays: 15,
                  checked_periods: [1, 2, 3],
                  ifDonate: 'Donate',
                  ifRecylable: 'Recyclable',
                  time: 'Ordered Time: 15:00 IST',
                ),
                SizedBox(
                  height: 20,
                ),
                const NotiLeaveWidgetUser(
                  // 9.582355615460715, 76.97034483525111
                  // day: listOfLeaveForms.getlistForLeaveForm[index].day,
                  from: 'Donate',
                  to: 'Recyclable',
                  status: 'Hello',
                  typeOFLeave: 'Hello',
                  numberOfDays: 15,
                  checked_periods: [1, 2, 3],
                  ifDonate: 'Donate',
                  ifRecylable: 'Non-Recyclable',
                  time: 'Ordered Time: 15:00 IST',
                ),
                SizedBox(
                  height: 20,
                ),
                const NotiLeaveWidgetUser(
                  // 9.582355615460715, 76.97034483525111
                  // day: listOfLeaveForms.getlistForLeaveForm[index].day,
                  from: 'Donate',
                  to: 'Recyclable',
                  status: 'Hello',
                  typeOFLeave: 'Hello',
                  numberOfDays: 15,
                  checked_periods: [1, 2, 3],
                  ifDonate: 'Waste',
                  ifRecylable: 'Recyclable',
                  time: 'Ordered Time: 15:00 IST',
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
