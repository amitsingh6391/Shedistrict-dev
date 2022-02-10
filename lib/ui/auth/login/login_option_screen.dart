import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shedistrict/ui/routes/routes.gr.dart';
import 'package:shedistrict/ui/core/app_logo.dart';

import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:flutter/gestures.dart';

class LoginOptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height,
      maxWidth: MediaQuery.of(context).size.width,
    ));
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 70.h),
                child: Center(
                    child: Hero(
                      tag: "applogo",
                      child: Applogo(
                        height: 220,
                        width: 220,
                        // height: 220,
                        // width: 220,
                      ),
                    )),
              ),
              SizedBox(height: 40),
              Text(
                "Log In",
                style: Apptheme(context).boldText.copyWith(
                  color: Apptheme.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                ),
              ),
              SizedBox(height: 30),
              Container(
                width: Apptheme.btnWidth,
                height: Apptheme.btnHeight,
                child: OutlinedButton(
                  onPressed: () {
                    AutoRouter.of(context).push(PhoneLoginScreen());
                  },
                  child: Text(
                    'Phone number',
                    style: TextStyle(color: Apptheme.primaryColor, fontSize: Apptheme.normalTextSize),
                  ),
                  style: OutlinedButton.styleFrom(
                    shape: StadiumBorder(),
                    side: BorderSide(color: Apptheme.primaryColor),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Container(
                width: Apptheme.btnWidth,
                height: Apptheme.btnHeight,
                child: OutlinedButton(
                  onPressed: () {
                    AutoRouter.of(context).push(EmailLoginScreen());
                  },
                  child: Text('Email', style: TextStyle(color: Colors.white, fontSize: Apptheme.normalTextSize)),
                  style: OutlinedButton.styleFrom(
                    shape: StadiumBorder(),
                    backgroundColor: Apptheme.primaryColor,
                    side: BorderSide(color: Apptheme.primaryColor),
                  ),
                ),
              ),
              Spacer(),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "Don't have an account?   ",
                      style: Apptheme(context).normalText.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Apptheme.eventsColor,
                      ),
                    ),
                    TextSpan(
                      text: "Sign Up",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () => AutoRouter.of(context).replace(
                          RulesScreen(),
                        ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        )
      ),
    );
  }
}
