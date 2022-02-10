import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shedistrict/providers/tab_provider.dart';

import 'package:shedistrict/ui/core/custum_textfield.dart';
import 'package:shedistrict/ui/core/tab_body.dart';
import 'package:shedistrict/ui/core/userdp.dart';
import 'package:shedistrict/ui/home_screen.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';
import 'package:shedistrict/utlis/constants/constants.dart';

class SheProtectsFriendsListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final tabwatcher = watch(tabprovider);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Apptheme.backgroundColor,
            boxShadow: [
              BoxShadow(
                color: Color(0xffB9C0F7),
                spreadRadius: 1,
              ),
            ],
          ),
          child: Customnavigationbar(tabwatcher: tabwatcher)),
      body: tabbody(tabwatcher.tab, FriendlistBody(size: size)),
    );
  }
}

class FriendlistBody extends StatelessWidget {
  const FriendlistBody({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
    );
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 44,
        bottom: bottomPadding,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    AutoRouter.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Apptheme.eventsColor,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Image(
                      height: ScreenUtil().setHeight(25.h),
                      image: AssetImage(
                        sheProtects,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            InputField(
              backgroundColor: Color.fromRGBO(
                128,
                141,
                241,
                0.06,
              ),
              prefixIcon: Icon(
                LineIcons.search,
                color: Apptheme.eventsColor,
              ),
              hintText: "Search for Friends",
              hintTextColor: Apptheme.eventsColor,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0.w),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Current Friends List",
                  style: Apptheme(context).boldText.copyWith(
                        color: Apptheme.eventsColor,
                        fontSize: 17.sp,
                      ),
                ),
              ),
            ),
            ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(
                top: toppadding,
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
                              height: size.width > 330 ? 50 : 40,
                              width: size.width > 330 ? 50 : 40,
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
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
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
                                        ),
                                  ),
                                )
                              ],
                            ),
                            Spacer(),
                            Text(
                              "Remove",
                              style: Apptheme(context).boldText.copyWith(
                                    fontSize: 13.sp,
                                    color: Apptheme.eventsColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            SizedBox(width: 10.w)
                          ],
                        ),
                      ),
                    ),
                  )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0.w),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "All Friends",
                  style: Apptheme(context).boldText.copyWith(
                        color: Apptheme.eventsColor,
                        fontSize: 17.sp,
                      ),
                ),
              ),
            ),
            for (int i = 0; i < 7; i++)
              Padding(
                padding: EdgeInsets.fromLTRB(
                  0.h,
                  0.h,
                  0.h,
                  8.h,
                ),
                // padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Apptheme.profileColor,
                    //  Apptheme.eventCardColorlight,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10.sp,
                        ),
                        UserDp(
                          height: size.width > 330 ? 50 : 40,
                          width: size.width > 330 ? 50 : 40,
                          image: ceoDp,
                        ),
                        SizedBox(
                          width: 20.sp,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Marial Williams",
                              style: Apptheme(context).boldText.copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            Text(
                              "+ 1 (908) 789 6745",
                              style: Apptheme(context).boldText.copyWith(
                                    fontSize: 12.sp,
                                    color: Apptheme.eventsColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                            )
                          ],
                        ),
                        Spacer(),
                        Text(
                          "Add",
                          style: Apptheme(context).boldText.copyWith(
                                fontSize: 13.sp,
                                color: Apptheme.eventsColor,
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                        SizedBox(width: 10.w)
                      ],
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
