// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, use_key_in_widget_constructors, unnecessary_import, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HeadingText extends StatelessWidget {
final String mainHeading;
final String SubHeading;
HeadingText(this.mainHeading, this.SubHeading);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          mainHeading,
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Text(
          SubHeading,
          style: TextStyle(
              color: Colors.blue, fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
