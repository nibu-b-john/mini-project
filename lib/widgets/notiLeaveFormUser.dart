import 'dart:developer';

import 'package:flutter/material.dart';
// import 'package:number_to_character/number_to_character.dart';

class NotiLeaveWidgetUser extends StatefulWidget {
  final String status;
  // final String day;
  final String time;
  final String ifDonate;
  final String ifRecylable;
  final String typeOFLeave;
  final String from;
  final String to;
  final int numberOfDays;
  final List<int> checked_periods;
  const NotiLeaveWidgetUser({
    Key? key,
    required this.status,
    required this.time,
    // required this.day,
    required this.typeOFLeave,
    required this.from,
    required this.to,
    required this.numberOfDays,
    required this.checked_periods,
    required this.ifDonate,
    required this.ifRecylable,
  }) : super(key: key);

  @override
  State<NotiLeaveWidgetUser> createState() => _NotiLeaveWidgetUserState();
}

class _NotiLeaveWidgetUserState extends State<NotiLeaveWidgetUser> {
  Color typeOFLeaveColor = const Color.fromARGB(0, 0, 0, 0);
  @override
  Widget build(BuildContext context) {
    late final String day;
    if (widget.checked_periods.length < 4) {
      day = 'Half Day';
    } else {
      day = 'Full Day';
    }
    // var converter = NumberToCharacterConverter('en');
    // final numberString = converter.convertInt(widget.numberOfDays);
    // final numberOfDaysInString = numberString.substring(0, 1).toUpperCase() +
    //     numberString.substring(1, numberString.length);

    Color widgetColor = const Color.fromARGB(0, 0, 0, 0);
    Color textColor = const Color.fromARGB(0, 0, 0, 0);
    IconData widgetIcon = Icons.abc;
    if (widget.status == "Awaiting") {
      setState(() {
        widgetColor = const Color.fromARGB(70, 255, 191, 0);
        textColor = const Color.fromARGB(255, 170, 128, 2);
        widgetIcon = Icons.watch_later_rounded;
      });
    } else if (widget.status == "Approved") {
      setState(() {
        widgetColor = const Color.fromARGB(70, 80, 151, 17);
        textColor = const Color.fromARGB(255, 0, 92, 8);
        widgetIcon = Icons.check_circle;
      });
    } else if (widget.status == "Declined") {
      setState(() {
        widgetColor = const Color.fromARGB(70, 244, 88, 88);
        textColor = const Color.fromARGB(255, 151, 17, 17);
        widgetIcon = Icons.dangerous;
      });
    }
    if (widget.typeOFLeave == "Casual") {
      setState(() {
        typeOFLeaveColor = const Color.fromARGB(255, 255, 193, 7);
      });
    }
    if (widget.typeOFLeave == "Medical") {
      typeOFLeaveColor = const Color.fromARGB(236, 13, 158, 191);
    }
    if (widget.typeOFLeave == "Duty") {
      typeOFLeaveColor = const Color.fromARGB(255, 255, 71, 114);
    }

    return SizedBox(
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          // color: Colors.red,
          elevation: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color.fromARGB(50, 0, 0, 0)),
                    borderRadius: const BorderRadius.all(Radius.circular(14))),
                child: ListTile(
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //   widget.numberOfDays == 1
                      //       ? '${day} Application ${widget.checked_periods}'
                      //       : 'Longitude: ${widget.long}  Latitude:${widget.lat} ',
                      //   style: const TextStyle(fontWeight: FontWeight.w400),
                      // ),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: [
                          Text(
                            // 'WED, 16 Dec',
                            widget.ifDonate,
                            style: const TextStyle(
                                color: Colors.black,
                                // fontSize: 20,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.0),
                          ),
                          Text(
                            // 'WED, 16 Dec',
                            '- ${widget.ifRecylable}',
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.0),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        widget.time,
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: widgetColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(7))),
                          height: 19,
                          width: 60,
                          child: Text(
                            widget.status,
                            style: TextStyle(
                                color: textColor, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Icon(
                        widgetIcon,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
