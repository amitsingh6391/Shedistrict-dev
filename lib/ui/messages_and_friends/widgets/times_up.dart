import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shedistrict/ui/core/rounded_button.dart';

import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';

import 'how_it_works_pop_up.dart';

class TimesUpPopup extends ConsumerWidget {
  TimesUpPopup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery
              .of(context)
              .size
              .width,
          maxHeight: MediaQuery
              .of(context)
              .size
              .height),
    );
    return Align(
        alignment: Alignment.center,
        child: Container(
            height: 480,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
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
                  SizedBox(height: 16),
                  Center(
                    child: Text(
                      "Time's Up!",
                      textAlign: TextAlign.center,
                      style: Apptheme(context).boldText.copyWith(
                        fontSize: 17.sp,
                        color: Apptheme.primaryColor,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: Container(
                      width: 250,
                      child: Text(
                        "You and Andrew Grey has been chatting for:",
                        textAlign: TextAlign.center,
                        style: Apptheme(context).normalText.copyWith(
                          fontSize: 13.sp,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: Text(
                      "2 Weeks",
                      textAlign: TextAlign.center,
                      style: Apptheme(context).boldText.copyWith(
                        fontSize: 17.sp,
                        color: Apptheme.primaryColor,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: Container(
                      width: 250,
                      child: Text(
                        "Maybe it's time to meet in person! Are you ready?",
                        textAlign: TextAlign.center,
                        style: Apptheme(context).normalText.copyWith(
                          fontSize: 13.sp,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: Container(
                      width: 140,
                      child: GestureDetector(
                          onTap: () {
                            AutoRouter.of(context).pop();
                          },
                          child: RoundedButton(
                              isOutlined: false,
                              color: Apptheme.backgroundColor,
                              textColor: Apptheme.primaryColor,
                              text: "No")
                      ) ,
                    ),
                  ),
                  SizedBox(height: 8),
                  Center(
                    child: Container(
                      width: 140,
                      child: GestureDetector(
                          onTap: () {
                            AutoRouter.of(context).pop();
                          },
                          child: RoundedButton(
                              isOutlined: false,
                              color: Apptheme.primaryColor,
                              textColor: Apptheme.backgroundColor,
                              text: "Yes")
                      ) ,
                    ),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        AutoRouter.of(context).pop().then(
                              (value) {
                            showGeneralDialog(
                              barrierLabel: "Barrier",
                              barrierDismissible: true,
                              barrierColor: Colors.black.withOpacity(0.5),
                              transitionDuration: Duration(milliseconds: 800),
                              context: context,
                              pageBuilder: (_, __, ___) {
                                return HowItWorksPopup();
                              },
                              transitionBuilder: (_, anim, __, child) {
                                return SlideTransition(
                                  position:
                                  Tween(begin: Offset(-1, -1), end: Offset(0, 0))
                                      .animate(anim),
                                  child: child,
                                );
                              },
                            );
                          },
                        );
                      },
                      child: Text(
                        "How it works?",
                        textAlign: TextAlign.center,
                        style: Apptheme(context).boldText.copyWith(
                          fontSize: 15,
                          color: Apptheme.primaryColor,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                ]
            ),
          margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
        )
    );
  }
}