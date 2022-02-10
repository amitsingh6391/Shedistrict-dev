import 'package:auto_route/auto_route.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shedistrict/ui/core/custom_avartar.dart';
import 'package:shedistrict/ui/core/she_app_bar.dart';

import 'package:shedistrict/ui/messages_and_friends/widgets/message_card.dart';
import 'package:shedistrict/ui/routes/routes.gr.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';
import 'package:shedistrict/utlis/constants/constants.dart';

class MessageAndFriendsScreen extends StatelessWidget {
  const MessageAndFriendsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final isNeedSafeArea = MediaQuery.of(context).viewPadding.top > 20;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: isNeedSafeArea ? 50 : 30,),
            SheAppBar(
                actions: [],
                title: "Friends",
                hasBackAction: false,
                titleColor: Apptheme.primaryColor
            ),
            SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: List.generate(
                        10,
                            (index) => CustomAvartar(
                          right: rightpadding - 8,
                          size: 25,
                        ))),
              ),
            ),

            SizedBox(height: size.height * 0.1 / 4),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                "Conversations",
                style: Apptheme(context).boldText.copyWith(
                  color: Apptheme.primaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 26,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.1 / 4),

            for (int i = 0; i < 4; i++)
              InkWell(
                onTap: () {
                  AutoRouter.of(context).push(
                    ChatScreen(),
                  );
                },
                child: Container(
                  // height: 100,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: MessageCard(
                    currentMsg: size.width > 330
                        ? 'Did you buy tickets for me? '
                        : 'Did you buy tickets....',
                    friendDp: ceoDp,
                    friendName: "Alia",
                    time: i / 2 == 0 ? "11:34 AM" : 'Yesterday',
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
