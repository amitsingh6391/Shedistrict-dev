import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';
import 'package:shedistrict/utlis/constants/constants.dart';

class HowItWorksPopup extends ConsumerWidget {
  HowItWorksPopup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
    );
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(top: 30.h),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.width > 540 ? .85.sh : 1.sh,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 25,
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        AutoRouter.of(context).pop();
                      },
                      child: CircleAvatar(
                        backgroundColor: Color.fromRGBO(236, 119, 200, 0.12),
                        child: Image.asset(
                          closeIcon,
                          color: Apptheme.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    "How this works:",
                    textAlign: TextAlign.center,
                    style: Apptheme(context).boldText.copyWith(
                          fontSize: 17.sp,
                          color: Apptheme.primaryColor,
                          decoration: TextDecoration.none,
                        ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 60.w,
                      right: 60.w,
                    ),
                    child: Text(
                      howThisWorkHeading,
                      textAlign: TextAlign.center,
                      style: Apptheme(context).lightText.copyWith(
                            fontSize: 14.sp,
                            color: Apptheme.assentColor,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w300,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 20.0.w,
                    right: 15.w,
                    top: toppadding,
                  ),
                  child: Column(
                    children: [
                      Text(
                        point1HowThisWork,
                        // textAlign: TextAlign.center,
                        style: Apptheme(context).lightText.copyWith(
                              fontSize: 14.sp,
                              color: Apptheme.assentColor,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        point2HowThisWork,
                        // textAlign: TextAlign.center,/
                        style: Apptheme(context).lightText.copyWith(
                              fontSize: 14.sp,
                              color: Apptheme.assentColor,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        point3HowThisWork,
                        // textAlign: TextAlign.center,
                        style: Apptheme(context).lightText.copyWith(
                              fontSize: 14.sp,
                              color: Apptheme.assentColor,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: Text(
                    "Why?",
                    textAlign: TextAlign.center,
                    style: Apptheme(context).boldText.copyWith(
                          fontSize: 17.sp,
                          color: Apptheme.primaryColor,
                          decoration: TextDecoration.none,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 20.0.w,
                    right: 15.w,
                    top: toppadding,
                  ),
                  child: Text(
                    whyItWorks,
                    // textAlign: TextAlign.center,
                    style: Apptheme(context).lightText.copyWith(
                          fontSize: 14.sp,
                          color: Apptheme.assentColor,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "Disagree? Tell us why ",
                          style: Apptheme(context).lightText.copyWith(
                                fontSize: 14.sp,
                                color: Apptheme.assentColor,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w300,
                              ),
                        ),
                        TextSpan(
                          text: "here",
                          style: Apptheme(context).normalText.copyWith(
                                decoration: TextDecoration.underline,
                                fontSize: 14.h,
                                color: Apptheme.primaryColor,
                              ),
                          // recognizer: new TapGestureRecognizer()
                          //   ..onTap = () => AutoRouter.of(context).replace(
                          //         // RulesScreen(),
                          //       ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
