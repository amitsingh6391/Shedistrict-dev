import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';

class CustomAvartar extends StatelessWidget {
  late final double? right;
  late final double? bottom;
  late final double? size;
  late final bool? shouldBlur;
  late final Map? user;

  CustomAvartar({this.bottom, this.right, this.size, this.shouldBlur, this.user});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
    );

    return Container(
      margin: EdgeInsets.all(10),
      child: Container(
        child: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  CircleAvatar(
                      radius: size ?? 35.r,
                      backgroundImage: NetworkImage(user!['favouritePictures'][0])),
                  Text(
                    user!['name'],
                    style: Apptheme(context).normalText.copyWith(fontSize: 12.sp),
                  )
                ],
              ),
            ),
            shouldBlur  == true
            ?
            Positioned(
              width: 200,
              height: 200,
              // Note: without ClipRect, the blur region will be expanded to full
              // size of the Image instead of custom size
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                  child: Container(
                    color: Colors.black.withOpacity(0.0),
                  ),
                ),
              ),
            )
                :
            SizedBox()
          ],
        ),
      )
    );
  }
}
