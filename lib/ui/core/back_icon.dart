import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';

class BackIcon extends StatelessWidget {
  IconData icon;
  BackIcon({required this.icon});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: 37,
      height: 37,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),

      child: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 6),
          child: Center(
            child: Icon(
              icon,
              color: Apptheme.assentColor2,
              size: 17,
            ),
          )
        ),
      ),
    );
  }
}
