import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shedistrict/providers/tab_provider.dart';
import 'package:shedistrict/ui/core/tab_body.dart';
import 'package:shedistrict/ui/home_screen.dart';

import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';

import 'package:shedistrict/utlis/constants/constants.dart';

class ProfileNotification extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final tabwatcher = watch(tabprovider);
    return Scaffold(
      bottomNavigationBar: Customnavigationbar(tabwatcher: tabwatcher),
      body: tabbody(
        tabwatcher.tab,
        ProfileNotificationBody(),
      ),
    );
  }
}

class ProfileNotificationBody extends StatelessWidget {
  const ProfileNotificationBody({
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
                  "Notifications",
                  style: Apptheme(context).boldText.copyWith(
                      color: Apptheme.assentColor2,
                      fontSize: 26,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ]),
              SizedBox(height: 10),
              NotificationTile(
                prefernce: 'Push Notifications',
                value: true,
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(
                  left: 12,
                  top: toppadding,
                ),
                child: Text(
                  "Email Notifications",
                  style: Apptheme(context).boldText.copyWith(
                    color: Apptheme.assentColor2,
                    fontSize: 17,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              EmailNotificationTile(
                prefernce: "When someone views your profile",
                value: false,
                color: Color.fromARGB(
                  05,
                  128,
                  141,
                  241,
                ),
              ),
              EmailNotificationTile(
                prefernce: "When someone likes your profile",
                value: true,
                color: Apptheme.eventCardColorlight,
              ),
              EmailNotificationTile(
                prefernce: "When someone likes your picture",
                value: true,
                color: Apptheme.eventCardColorlight,
              ),
              EmailNotificationTile(
                prefernce: "When someone comments on your\n picture",
                value: true,
                color: Apptheme.eventCardColorlight,
              ),
              EmailNotificationTile(
                prefernce: "When someone sends you a \nmessage",
                value: false,
                color: Color.fromRGBO(
                  128,
                  141,
                  241,
                  0.05,
                ),
              ),
              EmailNotificationTile(
                prefernce: "When someone likes your comment\n under a picture",
                value: false,
                color: Color.fromRGBO(
                  128,
                  141,
                  241,
                  0.05,
                ),
              ),
              EmailNotificationTile(
                prefernce: "When someone replies to your \ncomment in a post",
                value: true,
                color: Apptheme.eventCardColorlight,
              ),
              EmailNotificationTile(
                prefernce: "When someone comments in a \npost",
                value: false,
                color: Apptheme.eventCardColorlight,
              ),
              EmailNotificationTile(
                prefernce: "When someone dislikes your \ncomment in a post",
                value: false,
                color: Apptheme.eventCardColorlight,
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class EmailNotificationTile extends StatefulWidget {
  final String prefernce;

  final Color color;

  final bool value;
  const EmailNotificationTile({
    required this.prefernce,
    required this.color,
    required this.value,
  });

  @override
  _EmailNotificationTileState createState() => _EmailNotificationTileState();
}

class _EmailNotificationTileState extends State<EmailNotificationTile> {
  String status = circle;

  bool enable = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        setState(() {
          enable = !enable;
        });
      },
      child:Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: enable == true
              ? Color.fromRGBO(128, 141, 241, 0.05)
              : Apptheme.eventCardColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 15.0,
            bottom: 15,
            left: 15,
          ),
          child: Row(
            children: [
              Container(
                width: size.width - 120,
                child: Text(
                  widget.prefernce,
                  style: Apptheme(context).normalText.copyWith(
                    fontSize: Apptheme.normalTextSize,
                  ),
                ),
              ),
              Spacer(),
              Container(
                child: Image(
                  image: enable ? AssetImage(circle) : AssetImage(correct),
                  height: 20,
                ),
              ),
              SizedBox(
                width: 15,
              )
            ],
          ),
        ),
      ) ,
    );
  }
}

class NotificationTile extends StatefulWidget {
  final String prefernce;
  final bool value;
  NotificationTile({required this.prefernce, required this.value});

  @override
  _NotificationTileState createState() => _NotificationTileState();
}

class _NotificationTileState extends State<NotificationTile> {
  // bool togellvalue = true;
  final _controller = AdvancedSwitchController();

  String status = circle;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(
          color: Apptheme.eventCardColorlight,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              SizedBox(
                width: size.width < 400 ? 5 : leftPadding - 10,
                // 13,
              ),
              Text(
                widget.prefernce,
                style: Apptheme(context).normalText.copyWith(
                  fontSize: Apptheme.normalTextSize,
                  // 14,
                ),
              ),
              Spacer(),
              AdvancedSwitch(
                controller: _controller,
                activeColor: Apptheme.eventsColor,
                inactiveColor: Colors.grey,
                width: 40.0,
                height: 25.0,
                enabled: true,
                disabledOpacity: 0.5,
              ),
              SizedBox(width: 5),
            ],
          ),
        )
    );
  }
}
