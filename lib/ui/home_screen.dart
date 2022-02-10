import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shedistrict/providers/tab_provider.dart';
import 'package:shedistrict/services/tab_info.dart';

import 'package:shedistrict/utlis/constants/asset_path.dart';

import 'core/tab_body.dart';
import 'core/tab_color.dart';
import 'profile/profile_screen.dart';
import 'theme/apptheme.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Consumer(builder: (
      BuildContext context,
      watch,
      child,
    ) {
      final tabwatcher = watch(tabprovider);
      final viewPadding = MediaQuery.of(context).viewPadding;
      final bool isFrameless = viewPadding.bottom == 0.0;

      return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          child: Customnavigationbar(tabwatcher: tabwatcher),
        ),
        body: Container(
          child: tabbody(tabwatcher.tab, ProfileScreen()),
        )
      );
    });
  }
}

class Customnavigationbar extends StatelessWidget {
  const Customnavigationbar({
    Key? key,
    required this.tabwatcher,
  }) : super(key: key);

  final TabProvider tabwatcher;

  @override
  Widget build(BuildContext context) {
    final viewPadding = MediaQuery.of(context).viewPadding;
    final bool isFrameless = viewPadding.bottom == 0.0;

     return Container(
      height: 50,
      margin: isFrameless ?const EdgeInsets.only(bottom: 0) : const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Apptheme.backgroundColor,
        border:Border(
          top: BorderSide( //
            color: Color(0XFFB9C0F7),
            width: 1.0,
          ),
        ),
      ),
      child: CustomNavigationBar(
        elevation: 0,
        iconSize: 27.0,
        selectedColor: tabColor(tabwatcher.tab),
        strokeColor: tabColor(tabwatcher.tab),
        unSelectedColor: Color(0xffC4C4C4),
        backgroundColor: Colors.white,
        items: [
          CustomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(tabwatcher.tab == 0 ? mike2 : mike),
            ),
          ),
          CustomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(tabwatcher.tab == 1 ? search2 : search),
            ),
          ),
          CustomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(
                events,
              ),
            ),
          ),
          CustomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(tabwatcher.tab == 3 ? chats2 : chats),
            ),
            showBadge: true,
          ),
          CustomNavigationBarItem(
            icon: Icon(Icons.menu),
          ),
        ],
        currentIndex: tabwatcher.tab,
        onTap: (index) {
          context.read(tabprovider).updateBottomTab(index);
        },
      ),
    );
  }
}
