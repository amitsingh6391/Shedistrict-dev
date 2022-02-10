import 'package:flutter/cupertino.dart';

import 'package:auto_route/auto_route.dart';

import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shedistrict/ui/core/app_logo.dart';
import 'package:shedistrict/ui/core/back_icon.dart';
import 'package:shedistrict/ui/core/signup_bar.dart';
import 'package:shedistrict/ui/core/step_progress.dart';

import 'package:shedistrict/ui/routes/routes.gr.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';

import 'package:shedistrict/utlis/constants/constants.dart';

class VerifyYourSelfScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height,
      maxWidth: MediaQuery.of(context).size.width,
    ));
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Container(
                width: double.infinity,
                height: size.height > 800 ? size.height: 800,
                margin: const EdgeInsets.only(top: 60),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40.0),
                    topLeft: Radius.circular(40.0),
                  ),
                ),
                child: Container(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SignupBar(),
                          SizedBox(height: 40,),
                          StepProgress(currentStep: 2),
                          SizedBox(height: 40,),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Verify Yourself:",
                              style: Apptheme(context).boldText.copyWith(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Apptheme.primaryColor,
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            verifyourSelfText,
                            style: Apptheme(context).normalText.copyWith(
                              fontSize: Apptheme.normalTextSize,
                            ),
                          ),

                          SizedBox(height: 20),
                          InkWell(
                            onTap: () {
                              AutoRouter.of(context).replace(TakePictureScreen());
                            },
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                color: Apptheme.secondaryColor,
                                border: Border.all(
                                  color: Apptheme.secondaryColor,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.elliptical(30, 30),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 30,
                                ),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(FeatherIcons.camera, size: 40, color: Color(0xFFED60A9)),
                                    SizedBox(width: size.width * .08),
                                    Center(
                                      child: Text(
                                        "Take a picture",
                                        style:
                                        Apptheme(context).normalText.copyWith(
                                          fontSize: 16,
                                          color: Color(0xFFED60A9),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          InkWell(
                            onTap: () {
                              AutoRouter.of(context).replace(RecordVideoScreen());
                            },
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(
                                  128,
                                  141,
                                  241,
                                  .12,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.elliptical(30, 30),
                                ),
                              ),
                              child: Padding(
                                padding:
                                EdgeInsets.only(left: 30),
                                child: Row(
                                  children: [
                                    Icon(FeatherIcons.video, size: 40, color: Color(0xFF808DF1)),
                                    SizedBox(width: size.width * .08),
                                    Center(
                                      child: Text(
                                        "Record a video",
                                        style:
                                        Apptheme(context).normalText.copyWith(
                                          fontSize: 16,
                                          color: Color(0xFF808DF1),
                                          fontWeight: FontWeight.w400,
                                        ),

                                        // TextStyle(
                                        //   color: Color(0xFF2134C5),
                                        // ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: "I have an account.  ",
                                  style: Apptheme(context).normalText.copyWith(
                                    fontSize: 14,
                                    color: Apptheme.assentColor2,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: "Log In",
                                  style: Apptheme(context).normalText.copyWith(
                                    decoration: TextDecoration.underline,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  recognizer: new TapGestureRecognizer()
                                    ..onTap = () => AutoRouter.of(context).replace(
                                      LoginOptionScreen(),
                                    ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20,)
                        ]
                    )
                )
            )
        )
    );
  }
}
