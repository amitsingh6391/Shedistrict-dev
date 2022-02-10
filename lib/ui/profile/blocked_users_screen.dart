import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shedistrict/providers/tab_provider.dart';
import 'package:shedistrict/ui/core/tab_body.dart';

import 'package:shedistrict/ui/core/userdp.dart';
import 'package:shedistrict/ui/home_screen.dart';

import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';
import 'package:shedistrict/utlis/constants/constants.dart';

class BlockedUserScreen extends ConsumerWidget {
  const BlockedUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final tabwatcher = watch(tabprovider);
    return Scaffold(
      bottomNavigationBar: Customnavigationbar(tabwatcher: tabwatcher),
      body: tabbody(
        tabwatcher.tab,
        BlockedUserBody(),
      ),
    );
  }
}

class BlockedUserBody extends StatelessWidget {
  const BlockedUserBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 44, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            // SizedBox(width: 17),
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
              "Blocked Users",
              style: Apptheme(context).boldText.copyWith(
                  color: Apptheme.assentColor2,
                  fontSize: 26,
                  fontWeight: FontWeight.w500
              ),
            ),
            SizedBox(width: 10),
            Icon(FeatherIcons.userX ,  color: Apptheme.assentColor2),
          ]),

          SizedBox(
            height: 20,
          ),

          for (int i = 0; i < 3; i++)
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Apptheme.profileColor,
                ),
                child: Container(
                  child: Row(
                    children: [
                      UserDp(
                        height: 50,
                        width: 50,
                        image: ceoDp,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Marial Williams",
                            style: Apptheme(context).boldText.copyWith(
                                  fontSize: Apptheme.normalTextSize,
                                ),
                          ),
                          SizedBox(height: 5,),
                          Text(
                            "Blocked:  Nov 11, 2020",
                            style: Apptheme(context).boldText.copyWith(
                                  fontSize: 12,
                                  color: Apptheme.eventsColor,
                                ),
                          )
                        ],
                      ),
                      Spacer(),
                      Text(
                        "Unblock",
                        style: Apptheme(context).boldText.copyWith(
                              fontSize: 13,
                              color: Apptheme.eventsColor,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          // ListView.builder(
          //   shrinkWrap: true,
          //   itemCount: 10,
          //   itemBuilder: (BuildContext context, int index) {
          //     return ListTile(
          //       title: Text('amit'),
          //     );
          //   },
          // )
        ],
      ),
    );
  }
}
