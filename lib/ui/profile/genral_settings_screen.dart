import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shedistrict/providers/tab_provider.dart';
import 'package:shedistrict/ui/core/tab_body.dart';
import 'package:shedistrict/ui/home_screen.dart';

import 'package:shedistrict/ui/routes/routes.gr.dart';

import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';

import 'package:shedistrict/utlis/constants/constants.dart';

import 'widgets/profile_menu_tile.dart';

class GenralSettingsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final tabwatcher = watch(tabprovider);
    return Scaffold(
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Apptheme.backgroundColor,
            boxShadow: [
              BoxShadow(color: Color(0xffB9C0F7), spreadRadius: 1),
            ],
          ),
          child: Customnavigationbar(tabwatcher: tabwatcher)),
      body: tabbody(
        tabwatcher.tab,
        GenralSettingbody(),
      ),
    );
  }
}

class GenralSettingbody extends StatelessWidget {
  const GenralSettingbody({
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
                "General Settings",
                style: Apptheme(context).boldText.copyWith(
                    color: Apptheme.assentColor2,
                    fontSize: 26,
                    fontWeight: FontWeight.w500
                ),
              ),
            ]),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                AutoRouter.of(context).push(
                  AboutShedistrictScreen(),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: ProfileMenuTile(
                  icon: FeatherIcons.file,
                  title: "About SheDistrict",
                ),
              ),
            ),
            InkWell(
              onTap: () {
                AutoRouter.of(context).push(
                  SheRulesScreen(),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: ProfileMenuTile(
                  icon: FeatherIcons.checkSquare,
                  title: "SheRules",
                ),
              ),
            ),
            InkWell(
              onTap: () {
                AutoRouter.of(context).push(
                  SheProtectsScreen(),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: ProfileMenuTile(
                  icon: FeatherIcons.shield,
                  title: "SheProtects",
                ),
              ),
            ),
            InkWell(
              onTap: () {
                AutoRouter.of(context).push(
                  MessageFromCEOScreen(),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: ProfileMenuTile(
                  icon: FeatherIcons.messageCircle,
                  title: "Message from the CEO",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
