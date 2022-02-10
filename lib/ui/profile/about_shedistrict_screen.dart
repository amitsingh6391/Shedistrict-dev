import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shedistrict/ui/core/app_logo.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';
import 'package:shedistrict/utlis/constants/constants.dart';

class AboutShedistrictScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 44,
        ),
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Row(children: [
                  IconButton(
                    onPressed: () {
                      AutoRouter.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Apptheme.primaryColor,
                    ),
                  ),
                ]),
                SizedBox(
                  height: topPadding1,
                ),
                Applogo(
                  height: size.height * .18,
                  width: size.height * .18,
                ),
                SizedBox(height: 40.h),
                Image(
                  width: ScreenUtil().setWidth(200),
                  image: AssetImage(
                    aboutShedistrictimage,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(
                    left: leftPadding,
                    right: rightpadding,
                  ),
                  child: Text(
                    aboutShedistrict,
                    textAlign: TextAlign.center,
                    style: Apptheme(context).normalText.copyWith(
                          fontSize: 17.sp,
                          wordSpacing: 2,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff797171),
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
