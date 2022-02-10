import 'package:flutter/cupertino.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCircleAvatar extends StatelessWidget {
  final IconData? icon;
  final Color? backgroundColor;
  final Color? iconColor;

  CustomCircleAvatar({this.icon, this.backgroundColor, this.iconColor});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CircleAvatar(
      backgroundColor:
          backgroundColor != null ? backgroundColor : Apptheme.primaryColor,
      radius: 17,
      child: Icon(
        icon != null ? icon : Icons.add_circle_outline,
        size: 20,
        color: Apptheme.backgroundColor,
      ),
    );
  }
}