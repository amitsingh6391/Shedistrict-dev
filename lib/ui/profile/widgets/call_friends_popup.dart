import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shedistrict/ui/core/rounded_button.dart';
import 'package:shedistrict/ui/core/userdp.dart';

import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';
import 'package:shedistrict/utlis/constants/constants.dart';

class CallFriendsPopup extends ConsumerWidget {
  CallFriendsPopup({
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
        height: 550,
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
                    backgroundColor: Color.fromRGBO(128, 141, 241, 0.12),
                    child: Image.asset(
                      closeIcon,
                      color: Apptheme.eventsColor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Center(
              child: Text(
                "Call Friends",
                textAlign: TextAlign.center,
                style: Apptheme(context).boldText.copyWith(
                      fontSize: 20.h,
                      color: Apptheme.eventsColor,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(
                left: 20.0.w,
                right: 15.h,
                top: 10.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select All",
                    textAlign: TextAlign.center,
                    style: Apptheme(context).boldText.copyWith(
                          fontSize: Apptheme.normalTextSize,
                          color: Apptheme.eventsColor,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(
                top: toppadding - 15.h,
              ),
              children: [
                for (int i = 0; i < 3; i++)
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      0.h,
                      0.h,
                      0.h,
                      8.h,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Apptheme.profileColor,
                        //  Apptheme.eventCardColorlight,
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(8.h, 8.h, 8.h, 8.h),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            UserDp(
                              height: 35.h,
                              width: 35.h,
                              image: ceoDp,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Marial Williams",
                                  style: Apptheme(context).boldText.copyWith(
                                        fontSize: Apptheme.normalTextSize,
                                        fontWeight: FontWeight.w400,
                                        decoration: TextDecoration.none,
                                      ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "+1 (559) 786 5445",
                                    style: Apptheme(context).boldText.copyWith(
                                          fontSize: 12.sp,
                                          color: Apptheme.eventsColor,
                                          fontWeight: FontWeight.w400,
                                          decoration: TextDecoration.none,
                                        ),
                                  ),
                                )
                              ],
                            ),
                            Spacer(),
                            Image(
                              height: 20.h,
                              width: 20.h,
                              image: AssetImage(call),
                            ),
                            SizedBox(width: 20,)
                          ],
                        ),
                      ),
                    ),
                  )
              ],
            ),
            Spacer(),

            Center(
              child:
              Container(
                width: Apptheme.btnWidth,
                height: Apptheme.btnHeight,
                child: OutlinedButton(
                  onPressed: () {
                    // AutoRouter.of(context).replace(RulesScreen());
                  },
                  child: Text('Group Call',
                      style: Apptheme(context).normalText.copyWith(
                          color: Apptheme.backgroundColor,
                          fontWeight: FontWeight.w400,
                          fontSize: Apptheme.normalTextSize
                      )),
                  style: OutlinedButton.styleFrom(
                    shape: StadiumBorder(),
                    backgroundColor: Apptheme.eventsColor,
                    side: BorderSide(color: Apptheme.eventsColor),
                  ),
                ),
              ),
            ),
            // Center(
            //   child: Container(
            //     width: 156.w,
            //     height: 40.h,
            //     child: RoundedButton(
            //       isOutlined: false,
            //       color: Apptheme.eventsColor,
            //       textColor: Apptheme.backgroundColor,
            //       text: "Group Call",
            //     ),
            //   ),
            // ),
            Spacer()
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
