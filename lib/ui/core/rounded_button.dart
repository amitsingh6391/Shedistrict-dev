import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';

class RoundedButton extends StatelessWidget {
  final String? text;
  final Color color;
  final Color textColor;
  final bool isOutlined;

  RoundedButton({
    this.text,
    required this.color,
    required this.textColor,
    required this.isOutlined
  });

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height,
      maxWidth: MediaQuery.of(context).size.width,
    ));

    print('textColor $textColor');
    return Container(
      height: Apptheme.btnHeight,
      width: Apptheme.btnWidth,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: color,
          border: Border.all(
            color: textColor.toString() == "Color(0xffffffff)" ? color : textColor,
            width: 2,
          )),
      child: Center(
        child: Text(
          text.toString(),
          style: TextStyle(
            color: textColor,
            fontSize: Apptheme.normalTextSize,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
