import 'package:auto_route/auto_route.dart';

import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shedistrict/ui/core/app_logo.dart';

import 'package:shedistrict/ui/routes/routes.gr.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height,
      maxWidth: MediaQuery.of(context).size.width,
    ));
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: size.height * .2),
              child: Center(
                  child: Hero(
                tag: "applogo",
                child: Applogo(
                  height: 220.h,
                  width: 220.h,
                  // height: size.height > 600 ? 220 : 220,
                  // width: size.height > 600 ? 220 : 220,
                ),
              )),
            ),
            SizedBox(height: 60),
            Container(
              width: Apptheme.btnWidth,
              height: Apptheme.btnHeight,
              child: OutlinedButton(
                onPressed: () {
                  AutoRouter.of(context).push(SignupScreen());
                },
                child: Text('Sign Up',
                    style: Apptheme(context).normalText.copyWith(
                          color: Apptheme.primaryColor,
                          fontWeight: FontWeight.w400,
                          fontSize: Apptheme.normalTextSize
                        )
                    // TextStyle(color: Apptheme.primaryColor),
                    ),
                style: OutlinedButton.styleFrom(
                  shape: StadiumBorder(),
                  side: BorderSide(color: Apptheme.primaryColor),
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: Apptheme.btnWidth,
              height: Apptheme.btnHeight,
              child: OutlinedButton(
                onPressed: () {
                  AutoRouter.of(context).push(LoginOptionScreen());
                },
                child: Text('Log In',
                    style: Apptheme(context).normalText.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: Apptheme.normalTextSize
                        )),
                style: OutlinedButton.styleFrom(
                  shape: StadiumBorder(),
                  backgroundColor: Apptheme.primaryColor,
                  side: BorderSide(color: Apptheme.primaryColor),
                ),
              ),
            ),
            SizedBox(height: 65),
            InkWell(
              onTap: () {
                AutoRouter.of(context).push(WhyJoinUsScreen());
              },
              child: Text(
                "Why Join Us?",
                style: Apptheme(context).boldText.copyWith(
                      color: Apptheme.primaryColor,
                      fontSize: Apptheme.labelTextSize,
                      decoration: TextDecoration.underline,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
