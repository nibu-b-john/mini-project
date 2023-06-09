import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nemesis_hackathon/data/user_list.dart';
import 'package:nemesis_hackathon/models.dart/shared_preference.dart';
import 'package:nemesis_hackathon/widgets/badges.dart';
import 'package:nemesis_hackathon/widgets/star.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();

  //   log(Shared_Preferences.getString());
  // }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<SavedUser>(context, listen: false).getUser();

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/home');
              // Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            )),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12, spreadRadius: 1, blurRadius: 20),
                  ],
                ),
                child: CircleAvatar(
                  radius: 60.0,
                  backgroundImage: AssetImage('assets/profile.jpg'),
                  backgroundColor: Colors.transparent,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Rachel',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                'User',
                style: TextStyle(fontSize: 20, color: Colors.grey[400]),
              ),
            ],
          )),
          Container(
            height: height * 0.6,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(30)),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Badges',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.bakery_dining_rounded,
                        color: Colors.amber,
                        size: 40,
                      ),
                      const Icon(
                        Icons.bakery_dining_rounded,
                        color: Colors.amber,
                        size: 40,
                      ),
                      const Icon(
                        Icons.bakery_dining_rounded,
                        color: Colors.amber,
                        size: 40,
                      ),
                      const Icon(
                        Icons.bakery_dining_rounded,
                        color: Colors.amber,
                        size: 40,
                      ),
                      const Icon(
                        Icons.bakery_dining_rounded,
                        color: Colors.amber,
                        size: 40,
                      ),
                    ],
                  ),
                  Text(
                    'Description',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    'Average User with average of 5 badges and 3 star rating;',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Rating',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 30,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 30,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 30,
                      ),
                      Icon(
                        Icons.star_border_outlined,
                        color: Colors.amber,
                        size: 30,
                      ),
                      Icon(
                        Icons.star_border_outlined,
                        color: Colors.amber,
                        size: 30,
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
