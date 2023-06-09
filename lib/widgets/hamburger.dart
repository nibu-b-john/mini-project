import 'package:flutter/material.dart';
import 'package:nemesis_hackathon/data/list_hamburger.dart';

class HamburgerDrawer extends StatefulWidget {
  const HamburgerDrawer({Key? key}) : super(key: key);

  @override
  State<HamburgerDrawer> createState() => _HamburgerDrawerState();
}

class _HamburgerDrawerState extends State<HamburgerDrawer> {
  @override

// bool _iconBool=false;

// IconData _iconLight=Icons.wb_sunny_outlined;
// IconData _iconDark=Icons.nights_stay_outlined;
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          UserAccountsDrawerHeader(
            accountName: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'User Name',
                style: TextStyle(fontSize: 10),
              ),
            ),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image(
                    image: AssetImage(
                  'assets/profile.webp',
                )),
              ),
            ),
            accountEmail: const Text(
              '',
              style: TextStyle(fontSize: 10),
            ),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary
                // image: DecorationImage(
                //     fit: BoxFit.fill,
                //     image: NetworkImage(
                //         'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
                ),
            // otherAccountsPictures: [IconButton(onPressed: (){setState(() {
            //   _iconBool=!_iconBool;
            // });}, icon: Icon(_iconBool ? _iconDark:_iconLight))],
          ),
          SizedBox(
            height: 600,
            child: ListView.builder(
              padding: const EdgeInsets.all(0),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: hamburgerList.length,
              itemBuilder: (context, index) => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Icon(hamburgerList[index].icon),
                    title: Text(hamburgerList[index].title),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(hamburgerList[index].address);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
