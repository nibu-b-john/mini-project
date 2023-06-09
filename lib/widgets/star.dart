import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class StarWidget extends StatelessWidget {
  const StarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      child: Row(
        children: [
          Icon(Icons.star_border_outlined, color: Colors.amber),
          SizedBox(width: 20)
        ],
      ),
    );
  }
}
