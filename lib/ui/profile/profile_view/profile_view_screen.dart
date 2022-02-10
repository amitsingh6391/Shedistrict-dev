import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shedistrict/providers/tab_provider.dart';
import 'package:shedistrict/ui/core/custom_avartar.dart';
import 'package:shedistrict/ui/core/rounded_button.dart';

import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/constants.dart';

import '../../home_screen.dart';

class ProfileViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
    );
    return DefaultTabController(
      length: 2,
      child: Builder(
        builder: (context) {
          final index = DefaultTabController.of(context)!.index;
          return Consumer(
            builder: (context, watch, child) {
              final tabwatcher = watch(tabprovider);
              return Scaffold(
                resizeToAvoidBottomInset: false,
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
                  child: Customnavigationbar(tabwatcher: tabwatcher),
                ),
                appBar: AppBar(
                  titleTextStyle: Apptheme(context).boldText.copyWith(
                      color: Apptheme.eventsColor,
                      fontSize: 26,
                      fontWeight: FontWeight.w500
                  ),
                  elevation: 0,
                  toolbarHeight: 95,
                  centerTitle: false,
                  titleSpacing: 0.0,
                  title: Transform(
                    transform: Matrix4.translationValues(-0, 0.0, 0.0),
                    child: Text(
                      "Profile Views",
                    ),
                  ),
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: IconButton(
                      onPressed: () {
                        AutoRouter.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Apptheme.assentColor2,
                      ),
                    ),
                  ),
                  bottom: PreferredSize(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: TabBar(
                            isScrollable: true,
                            onTap: (index) {
                              context.read(tabprovider).updateTopTab(index);
                              print(index);
                            },
                            unselectedLabelColor: Colors.white.withOpacity(0.3),
                            indicatorColor: Colors.white,
                            tabs: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Tab(
                                  child: Text(
                                    'All Views',
                                    style: tabwatcher.topTapindex != 0
                                        ? Apptheme(context).lightText
                                        : Apptheme(context).lightText.copyWith(
                                              color: Apptheme.eventsColor,
                                            ),
                                  ),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Boosts',
                                  style: tabwatcher.topTapindex != 1
                                      ? Apptheme(context).lightText
                                      : Apptheme(context).lightText.copyWith(
                                            color: Apptheme.eventsColor,
                                          ),
                                ),
                              ),
                            ]),
                      ),
                    ),
                    preferredSize: Size.fromHeight(30.0),
                  ),
                ),
                body: Padding(
                  padding: EdgeInsets.only(
                    // left: leftPadding + 5,
                    // right: 5,
                    top: toppadding,
                  ),
                  child: TabBarView(
                    children: [
                      Column(
                        children: [
                          for (int i = 0; i < 4; i++)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (int j = 0; j < 5; j++)
                                  CustomAvartar(
                                    size: size.width > 330
                                        ? size.width < 400
                                            ? 23
                                            : 30
                                        : 20,
                                    right: size.width == 414
                                        ? rightpadding - 15
                                        : rightpadding - 5,
                                    bottom: 10,
                                    shouldBlur: i > 1 ? true :  false
                                  ),
                              ],
                            ),
                          SizedBox(height: 20),
                          Text(
                            "Upgrade your plan to see all the views!",
                            style: Apptheme(context).boldText.copyWith(
                                  color: Apptheme.eventsColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: Apptheme.normalTextSize,
                                ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            width: Apptheme.btnWidth,
                            height: Apptheme.btnHeight,
                            child: RoundedButton(
                              isOutlined: false,
                              color: Apptheme.eventsColor,
                              textColor: Apptheme.backgroundColor,
                              text: "Upgrade now",
                            ),
                          )
                        ],
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "You haven’t boosted yet!",
                                style: Apptheme(context).boldText.copyWith(
                                      color: Apptheme.eventsColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 17,
                                    ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                width: Apptheme.btnWidth,
                                height: Apptheme.btnHeight,
                                child: RoundedButton(
                                  isOutlined: false,
                                  color: Apptheme.eventbuttonColorlight,
                                  textColor: Apptheme.backgroundColor,
                                  text: "Boost now!",
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                width: Apptheme.btnWidth,
                                height: Apptheme.btnHeight,
                                child: RoundedButton(
                                  isOutlined: true,
                                  color: Apptheme.backgroundColor,
                                  textColor: Apptheme.eventsColor,
                                  text: "Buy boosts",
                                ),
                              ),
                              SizedBox(height: 40),
                              Text(
                                "You don’t have boosts",
                                style: Apptheme(context).boldText.copyWith(
                                      color: Apptheme.eventsColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                    ),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
