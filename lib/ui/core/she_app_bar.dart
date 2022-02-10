import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';

class SheAppBar extends StatelessWidget{
  late List<Widget> actions;
  final String title;
  final bool hasBackAction;
  late Color titleColor;
  SheAppBar({
    required this.actions,
    required this.title,
    required this.hasBackAction,
    required this.titleColor
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: hasBackAction ? const EdgeInsets.only(left: 5, right: 5) : const EdgeInsets.only(left: 20, right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                hasBackAction
                    ?
                IconButton(
                  iconSize: 30,
                  icon: Icon(FeatherIcons.chevronLeft, color: titleColor,),
                  onPressed: () {
                    AutoRouter.of(context).pop();
                  },
                )
                    : SizedBox(),
                hasBackAction ? SizedBox(width: 5,) : SizedBox(),
                Container(
                  width: size.width * 0.6,
                  child: Text(
                    title,
                    style: Apptheme(context).boldText.copyWith(
                        color: titleColor,
                        fontSize: 26,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: actions,
            ),
          )
        ],
      ),
    );
  }
}