import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BadgeWidget extends StatelessWidget {
  const BadgeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      child: Row(
        children: [
          const Icon(
            Icons.bakery_dining_rounded,
            color: Colors.amber,
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }
}
