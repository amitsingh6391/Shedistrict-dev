import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shedistrict/providers/tab_provider.dart';
import 'package:shedistrict/ui/core/tab_body.dart';
import 'package:shedistrict/ui/home_screen.dart';
import 'package:shedistrict/ui/routes/routes.gr.dart';

import 'package:shedistrict/ui/theme/apptheme.dart';

import 'package:shedistrict/utlis/constants/constants.dart';

import 'widgets/profile_menu_tile.dart';

class PrivacyScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final tabwatcher = watch(tabprovider);
    return Scaffold(
      bottomNavigationBar: Customnavigationbar(tabwatcher: tabwatcher),
      body: tabbody(tabwatcher.tab, PrivacyScreenbody()),
    );
  }
}

class PrivacyScreenbody extends StatelessWidget {
  const PrivacyScreenbody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 44, left: 20, right: 20),
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
                "Privacy",
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
                  PrivacyMessageScreen(),
                );
              },
              child: ProfileMenuTile(
                icon: Icons.chat_bubble_outline,
                title: "Messages",
              ),
            ),
            InkWell(
              onTap: () {
                AutoRouter.of(context).push(
                  PrivacyProfileScreen(),
                );
              },
              child: ProfileMenuTile(
                icon: Icons.person_outlined,
                title: "Profile",
              ),
            ),
            InkWell(
              onTap: () {
                AutoRouter.of(context).push(
                  BlockedUserScreen(),
                );
              },
              child: ProfileMenuTile(
                icon: Icons.block,
                title: "Blocked Users",
              ),
            ),
            InkWell(
              onTap: () {
                AutoRouter.of(context).push(
                  PrivacyPolicyScreen(),
                );
              },
              child: ProfileMenuTile(
                icon: LineIcons.book,
                title: "Privacy Policy",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
