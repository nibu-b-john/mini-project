import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class WasteSelectionPage extends StatefulWidget {
  const WasteSelectionPage({Key? key}) : super(key: key);

  @override
  State<WasteSelectionPage> createState() => _WasteSelectionPageState();
}

class _WasteSelectionPageState extends State<WasteSelectionPage> {
  bool first_drop = false;
  bool second_drop = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
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
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage(
                      'assets/waste_selection.jpg',
                    ))),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(50)),
                width: double.infinity,
                height: height * 0.58,
                child: Padding(
                  padding: const EdgeInsets.all(38.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: width * 0.65,
                          height: height * 0.07,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80)),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                side: const BorderSide(color: Colors.white)),
                            onPressed: () {
                              setState(() {
                                first_drop = !first_drop;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    first_drop ? 'Donate' : 'Waste',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  const Icon(
                                    Icons.arrow_drop_down_sharp,
                                    size: 30,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // const Text(
                      //   'Waste',
                      //   style: TextStyle(color: Colors.white),
                      // ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        width: width * 0.65,
                        height: height * 0.07,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80)),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              side: const BorderSide(color: Colors.white)),
                          onPressed: () {
                            setState(() {
                              second_drop = !second_drop;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  second_drop ? 'Recyclable' : 'Non-Recyclable',
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                const Icon(
                                  Icons.arrow_drop_down_sharp,
                                  size: 30,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // const Text(
                      //   'Non-recyclable',
                      //   style: TextStyle(color: Colors.white),
                      // ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/maps');
                        },
                        child: Stack(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              child: const Icon(
                                Icons.map_sharp,
                                size: 50,
                                color: Colors.white,
                              ),
                            ),
                            const Positioned(
                              bottom: 50,
                              left: 30,
                              child: Icon(
                                Icons.location_on,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: width * 0.65,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              primary: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed('/addtitle');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Add to bin',
                                  style: TextStyle(color: Colors.black),
                                ),
                                Icon(
                                  Icons.handyman,
                                  color: Colors.black,
                                )
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
