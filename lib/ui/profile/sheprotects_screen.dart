import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shedistrict/providers/tab_provider.dart';
import 'package:shedistrict/ui/core/tab_body.dart';
import 'package:shedistrict/ui/home_screen.dart';
import 'package:shedistrict/ui/profile/widgets/call_friends_popup.dart';
import 'package:shedistrict/ui/profile/widgets/custom_list_tile.dart';

import 'package:shedistrict/ui/profile/widgets/sheprotects_popup.dart';
import 'package:shedistrict/ui/routes/routes.gr.dart';

import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';

import 'package:shedistrict/utlis/constants/constants.dart';

class SheProtectsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final tabwatcher = watch(tabprovider);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Apptheme.backgroundColor,
            boxShadow: [
              BoxShadow(color: Color(0xffB9C0F7), spreadRadius: 1),
            ],
          ),
          child: Customnavigationbar(tabwatcher: tabwatcher)),
      body: tabbody(tabwatcher.tab, SheProtectscreenbody(size: size)),
    );
  }
}

class SheProtectscreenbody extends StatelessWidget {
  const SheProtectscreenbody({
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
    bool active = true;
    return Padding(
      padding: EdgeInsets.only(top: 44),
      child: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Container(
                      child: Image(
                        height: 30,
                        image: AssetImage(
                          sheProtects,
                        ),
                        fit: BoxFit.fill,
                      )
                    ),
                    IconButton(
                      onPressed: () {
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                  ]),
            ),
            SizedBox(height: toppadding),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Center(
                child: InkWell(
                  onTap: () {
                    showGeneralDialog(
                      barrierLabel: "Barrier",
                      barrierDismissible: true,
                      barrierColor: Colors.black.withOpacity(0.5),
                      transitionDuration: Duration(milliseconds: 800),
                      context: context,
                      pageBuilder: (_, __, ___) {
                        return SheProtectsPopup(size: size);
                      },
                      transitionBuilder: (_, anim, __, child) {
                        return SlideTransition(
                          position:
                              Tween(begin: Offset(1, 3), end: Offset(0, 0))
                                  .animate(anim),
                          child: child,
                        );
                      },
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.0.h),
                    child: Text(
                      "What is SheProtects ?",
                      style: Apptheme(context).normalText.copyWith(
                            fontSize: 13.sp,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: toppadding,
            ),
            StatefulBuilder(
              builder: (BuildContext context, setState) {
                return Container(
                  color: Apptheme.profileColor,
                  child: CustomListTitle(
                    image: sheprotects,
                    size: size,
                    label: "SheProtects",
                    fn: () {},
                    trailing: SizedBox(
                      width: 40,
                      height: 20,
                      child: FittedBox(
                        child: CupertinoSwitch(
                          value: active,
                          activeColor: Apptheme.eventsColor,
                          onChanged: (bool value) {
                            debugPrint("im here");
                            setState(() {
                              active = !active;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Apptheme.profileColor,
              child: CustomListTitle(
                image: mens,
                trailing: SizedBox(
                  height: 20,
                  width: 40,
                  child: FittedBox(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Apptheme.assentColor2,
                    ),
                  ),
                ),
                fn: () {
                  debugPrint("ok fine");
                  AutoRouter.of(context).push(
                    SheProtectsFriendsListScreen(),
                  );
                },
                size: size,
                label: "Friends List",
                //TODO need image icon of svg
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: topPadding1,
                bottom: bottomPadding,
                right: 2 * rightpadding,
                left: 2 * leftPadding,
              ),
              child: GestureDetector(
                onTap: () {
                  showGeneralDialog(
                    barrierLabel: "Barrier",
                    barrierDismissible: true,
                    barrierColor: Colors.black.withOpacity(0.5),
                    transitionDuration: Duration(milliseconds: 800),
                    context: context,
                    pageBuilder: (_, __, ___) {
                      return CallFriendsPopup();
                    },
                    transitionBuilder: (_, anim, __, child) {
                      return SlideTransition(
                        position: Tween(begin: Offset(1, 3), end: Offset(0, 0))
                            .animate(anim),
                        child: child,
                      );
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Apptheme.eventCardColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        height: 20,
                        image: AssetImage(call),
                      ),
                      // Icon(
                      //   LineIcons.phone,
                      //   color: Apptheme.eventsColor,
                      // ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text("Call Friends",
                          style: Apptheme(context).normalText.copyWith(
                                color: Apptheme.eventsColor,
                            fontSize: Apptheme.normalTextSize
                              ))
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                AutoRouter.of(context).push(
                  TextFriendsScreen(),
                );
              },
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: bottomPadding,
                  right: 2 * rightpadding,
                  left: 2 * leftPadding,
                ),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Apptheme.eventCardColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        height: 20,
                        image: AssetImage(
                          telegram,
                        ),
                      ),
                      // Icon(
                      //   LineIcons.telegram,
                      //   color: Apptheme.eventsColor,
                      // ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Text Friends",
                        style: Apptheme(context).normalText.copyWith(
                              color: Apptheme.eventsColor,
                            fontSize: Apptheme.normalTextSize
                            ),
                      )
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
