import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';

class CustomPopupMenu extends StatelessWidget{
  final List items;
  final String? hintText;
  final Color? backgroundColor;
  final String ? value;

  final void Function(String?, String?)? onChanged;
  CustomPopupMenu({
    required this.items,
    this.hintText,
    this.backgroundColor,
    this.onChanged,
    this.value
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Row(
        children: [
          // SizedBox(width: 18.w),
          PopupMenuButton<String>(
            offset: Offset(0.0, 50.0),
            itemBuilder: (context) {
              return <String>[
               ...items
              ].map((str) {
                return PopupMenuItem(
                  height: 40,
                  value: str,
                  child: Text(
                    str,
                    style: Apptheme(context).normalText.copyWith(
                      fontSize: 17,
                    ),
                  ),
                );
              }).toList();
            },
            child: Container(
              height: 47,
              width: size.width - 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Apptheme.filterlightColor,
              ),
              child:Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      // top: 12,
                      left: 32,
                    ),
                    child: Text(
                      value!,
                      textAlign: TextAlign.left,
                      style: Apptheme(context).lightboldText.copyWith(
                        fontSize: 15,
                        color: Apptheme.assentColor,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  Spacer(),
                  Icon(FeatherIcons.chevronDown, color: Apptheme.filterColor),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
            ),
            onSelected:(v) => onChanged!(hintText, v),
          )
        ],
      ),
    );
  }
}