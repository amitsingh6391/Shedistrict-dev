import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:line_icons/line_icons.dart';
import 'package:shedistrict/providers/tab_provider.dart';
import 'package:shedistrict/ui/core/tab_body.dart';
import 'package:shedistrict/ui/home_screen.dart';

import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';

import 'package:shedistrict/utlis/constants/constants.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

import 'widgets/deactivate_popup.dart';
import 'widgets/delete_account_popup.dart';

class PrivacyProfileScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final tabwatcher = watch(tabprovider);
    return Scaffold(
      bottomNavigationBar: Customnavigationbar(tabwatcher: tabwatcher),
      body: tabbody(
        tabwatcher.tab,
        PrivacyProfileBody(),
      ),
    );
  }
}

class PrivacyProfileBody extends StatelessWidget {
  const PrivacyProfileBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 44,
        left: 20,
        right: 20,
      ),
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                IconButton(
                  onPressed: () {
                    AutoRouter.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Apptheme.assentColor2,
                  ),
                ),
                Text(
                  "Profile",
                  style: Apptheme(context).boldText.copyWith(
                      color: Apptheme.assentColor2,
                      fontSize: 26,
                      fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(width: 10),
                Image(
                  image: AssetImage(singlemen),
                  height: 20,
                )
              ]),
              SizedBox(height: 20),
              OtherMessagePrivacySetting(
                prefernce: "Hide profile",
                value: true,
                // icon: LineIcons.lock,
              ),
              SizedBox(height: 10,),
              OtherMessagePrivacySetting(
                prefernce: "Hide online status (Premium)",
                value: false,
                // icon: LineIcons.lock,
              ),
              SizedBox(height: 10,),
              OtherMessagePrivacySetting(
                prefernce: "Pause incoming invitations",
                value: true,
                // icon: LineIcons.lock,
              ),
              SizedBox(height: 10,),
              OtherMessagePrivacySetting(
                prefernce: "Hide location (Premium)",
                value: true,
                icon: LineIcons.lock,
              ),
              SizedBox(height: 10,),
              OtherMessagePrivacySetting(
                prefernce: "Hide age (Premium)",
                value: false,
                icon: LineIcons.lock,
              ),
              GestureDetector(
                onTap: () {
                  showGeneralDialog(
                    barrierLabel: "Barrier",
                    barrierDismissible: true,
                    barrierColor: Colors.black.withOpacity(0.5),
                    transitionDuration: Duration(milliseconds: 800),
                    context: context,
                    pageBuilder: (_, __, ___) {
                      return DeactivePopup();
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
                  padding: EdgeInsets.only(
                    top: toppadding,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Image(
                          image: AssetImage(cancelSqaure),
                          height: 20,
                        ),
                        onPressed: (){},
                      ),
                      Text(
                        "Deactive my profile",
                        style: Apptheme(context).normalText.copyWith(
                          color: Apptheme.assentColor2,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              ),

              GestureDetector(
                onTap: () {
                  showGeneralDialog(
                    barrierLabel: "Barrier",
                    barrierDismissible: true,
                    barrierColor: Colors.black.withOpacity(0.5),
                    transitionDuration: Duration(milliseconds: 800),
                    context: context,
                    pageBuilder: (_, __, ___) {
                      return DeleteAccountPopup();
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
                child: Row(
                  children: [
                    IconButton(
                      icon: Image(
                        image: AssetImage(delete),
                        height: 20,
                      ),
                      onPressed: () {

                      },
                    ),
                    Text(
                      "Delete my profile",
                      style: Apptheme(context).normalText.copyWith(
                        color: Apptheme.assentColor2,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OtherMessagePrivacySetting extends StatelessWidget {
  final String prefernce;
  final bool value;

  final IconData? icon;
  OtherMessagePrivacySetting({
    required this.prefernce,
    required this.value,
    this.icon,
  });
  final _controller = AdvancedSwitchController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(
        15,
      ),
      decoration: BoxDecoration(
        color: Apptheme.eventCardColorlight,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        child: Row(
          children: [
            icon != null
                ? Row(
              children: [
                Container(
                  child: Icon(
                    icon,
                    color: Apptheme.assentColor2,
                  ),
                ),
                SizedBox(width: 10,)
              ],
            )
                : SizedBox(),
            Container(
              child: Text(
                prefernce,
                style: Apptheme(context).normalText.copyWith(
                  fontSize: Apptheme.normalTextSize,
                ),
              ),
            ),
            Spacer(),
            AdvancedSwitch(
              controller: _controller,
              activeColor: Apptheme.eventsColor,
              inactiveColor: Colors.grey,
              width: 35.0,
              height: 20.0,
              enabled: true,
              disabledOpacity: 0.1,
            ),
          ],
        ),
      ),
    );
  }
}
