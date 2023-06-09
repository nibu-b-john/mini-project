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

class HomePageDelivery extends StatefulWidget {
  const HomePageDelivery({Key? key}) : super(key: key);

  @override
  State<HomePageDelivery> createState() => _HomePageDeliveryState();
}

class _HomePageDeliveryState extends State<HomePageDelivery> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<SavedUser>(context, listen: false).getUser();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Delivery Location'),
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MapsDelivery(
                                  lat: 9.58355105618984,
                                  long: 76.9717073973738,
                                )));
                  },
                  child: const NotiLeaveWidget(
                    // 9.582355615460715, 76.97034483525111
                    // day: listOfLeaveForms.getlistForLeaveForm[index].day,
                    long: 76.97034483525111,
                    lat: 9.582355615460715,
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
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  // 9.58222479412334, 76.97056254194044
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MapsDelivery(
                                  lat: 9.58222479412334,
                                  long: 76.97056254194044,
                                )));
                  },
                  child: const NotiLeaveWidget(
                    // 9.582355615460715, 76.97034483525111
                    // day: listOfLeaveForms.getlistForLeaveForm[index].day,
                    long: 76.97056254194044,
                    lat: 9.58222479412334,
                    from: 'Donate',
                    to: 'Recyclable',
                    status: 'Hello',
                    typeOFLeave: 'Hello',
                    numberOfDays: 15,
                    checked_periods: [1, 2, 3],
                    ifDonate: 'Waste',
                    ifRecylable: 'Non-Recyclable',
                    time: 'Ordered Time: 10:00 IST',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  // 9.59371061575105, 76.97883341101755
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MapsDelivery(
                                  lat: 9.59371061575105,
                                  long: 76.97883341101755,
                                )));
                  },
                  child: const NotiLeaveWidget(
                    // 9.582355615460715, 76.97034483525111
                    // day: listOfLeaveForms.getlistForLeaveForm[index].day,
                    long: 76.97883341101755,
                    lat: 9.59371061575105,
                    from: 'Donate',
                    to: 'Recyclable',
                    status: 'Hello',
                    typeOFLeave: 'Hello',
                    numberOfDays: 15,
                    checked_periods: [1, 2, 3],
                    ifDonate: 'Donate',
                    ifRecylable: 'Recyclable',
                    time: 'Ordered Time: 19:00 IST',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  // 9.635542990109997, 76.97877722864789
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MapsDelivery(
                                  lat: 9.635542990109997,
                                  long: 76.97877722864789,
                                )));
                  },
                  child: const NotiLeaveWidget(
                    // 9.582355615460715, 76.97034483525111
                    // day: listOfLeaveForms.getlistForLeaveForm[index].day,
                    long: 76.97877722864789,
                    lat: 9.635542990109997,
                    from: 'Waste',
                    to: 'Recyclable',
                    status: 'Hello',
                    typeOFLeave: 'Hello',
                    numberOfDays: 15,
                    checked_periods: [1, 2, 3],
                    ifDonate: 'Waste',
                    ifRecylable: 'Recyclable',
                    time: 'Ordered Time: 03:00 IST',
                  ),
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
