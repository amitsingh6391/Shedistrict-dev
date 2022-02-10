import 'package:auto_route/auto_route.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shedistrict/providers/tab_provider.dart';
import 'package:shedistrict/ui/core/tab_body.dart';
import 'package:shedistrict/ui/home_screen.dart';

import 'package:shedistrict/ui/routes/routes.gr.dart';

import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';

import 'package:shedistrict/utlis/constants/constants.dart';

import 'widgets/profile_menu_tile.dart';

class SettingsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final tabwatcher = watch(tabprovider);
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
        child: Customnavigationbar(tabwatcher: tabwatcher),
      ),
      body: tabbody(tabwatcher.tab, Settingbody()),
    );
  }
}

class Settingbody extends StatelessWidget {
  const Settingbody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 44,
      ),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              SizedBox(width: 17),
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
                "Settings",
                style: Apptheme(context).boldText.copyWith(
                    color: Apptheme.assentColor2,
                    fontSize: 26,
                    fontWeight: FontWeight.w500
                ),
              ),
            ]),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      AutoRouter.of(context).push(
                        GenralSettingsScreen(),
                      );
                    },
                    child: ProfileMenuTile(
                      icon: FeatherIcons.settings,
                      title: "General",
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      AutoRouter.of(context).push(
                        PrivacyScreen(),
                      );
                    },
                    child: ProfileMenuTile(
                      icon: FeatherIcons.key,
                      title: "Privacy",
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      AutoRouter.of(context).push(
                        PurchasesScreen(),
                      );
                    },
                    child: ProfileMenuTile(
                      icon: FeatherIcons.shoppingCart,
                      // icon: Icons.shopping_cart_outlined,
                      title: "Purchases",
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      AutoRouter.of(context).push(ProfileNotification());
                    },
                    child: ProfileMenuTile(
                      icon: FeatherIcons.bell,
                      title: "Notifications",
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      AutoRouter.of(context).push(
                        SheUpdateScreen(),
                      );
                    },
                    child: ProfileMenuTile(
                      icon: FeatherIcons.share,
                      title: "SheUpdate",
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
