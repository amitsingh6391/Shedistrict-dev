import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shedistrict/ui/core/rounded_button.dart';
import 'package:shedistrict/ui/messages_and_friends/widgets/times_up.dart';

import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';

import 'how_it_works_pop_up.dart';

class MeetConfirmatationPopup extends ConsumerWidget {
  MeetConfirmatationPopup({
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
      child: Container(
        height: 400,
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
            SizedBox(height: 10),
            Center(
              child: Text(
                "Ready to meet?",
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
                  "You and Andrea Gray have been chatting for:",
                  textAlign: TextAlign.center,
                  style: Apptheme(context).lightText.copyWith(
                        fontSize: 15.sp,
                        color: Apptheme.assentColor,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w300,
                      ),
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Center(
              child: Text(
                "12 days 4 hours and 35 minutes",
                textAlign: TextAlign.center,
                style: Apptheme(context).boldText.copyWith(
                      fontSize: 15.sp,
                      color: Apptheme.primaryColor,
                      decoration: TextDecoration.none,
                    ),
              ),
            ),
            SizedBox(height: 15.h),
            Center(
              child: Container(
                width: 140,
                child: RoundedButton(
                    isOutlined: false,
                    color: Apptheme.backgroundColor,
                    textColor: Apptheme.primaryColor,
                    text: "Not yet"),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Container(
                  width: 140,
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
                              return TimesUpPopup();
                            },
                            transitionBuilder: (_, anim, __, child) {
                              return SlideTransition(
                                position: Tween(
                                    begin: Offset(
                                      1,
                                      -1,
                                    ),
                                    end: Offset(0, 0))
                                    .animate(anim),
                                child: child,
                              );
                            },
                          );
                        },
                      );
                    },
                    child: RoundedButton(
                        isOutlined: false,
                        color: Apptheme.primaryColor,
                        textColor: Apptheme.backgroundColor,
                        text: "Yes"),
                  )
              ),
            ),
            SizedBox(height: 10),
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
            SizedBox(
              height: 20,
            ),
          ],
        ),
        margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
