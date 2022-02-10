import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:line_icons/line_icons.dart';
import 'package:shedistrict/providers/tab_provider.dart';
import 'package:shedistrict/ui/core/tab_body.dart';
import 'package:shedistrict/ui/home_screen.dart';

import 'package:shedistrict/ui/theme/apptheme.dart';

import 'package:shedistrict/utlis/constants/constants.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

class PrivacyMessageScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final tabwatcher = watch(tabprovider);
    return Scaffold(
      bottomNavigationBar: Customnavigationbar(tabwatcher: tabwatcher),
      body: tabbody(
        tabwatcher.tab,
        MessageScreenBody(),
      ),
    );
  }
}

class MessageScreenBody extends StatefulWidget{
  _MessageScreenBodyState createState() => _MessageScreenBodyState();
}

class _MessageScreenBodyState extends State<MessageScreenBody>{
  String messageFrom = "Everyone";

  void onSelect(value) {
    setState(() {
      messageFrom = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
    );
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
                  "Messages",
                  style: Apptheme(context).boldText.copyWith(
                    color: Apptheme.assentColor2,
                    fontSize: 26,
                    fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.chat_bubble_outline,
                  color: Apptheme.eventsColor,
                )
              ]),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 13),
                  Text(
                    "Allow messages from:",
                    style: Apptheme(context).boldText.copyWith(
                      color: Apptheme.assentColor2,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    messageFrom = "Everyone";
                  });
                },
                child: AllowMessagesTile(
                  prefernce: "Everyone",
                  value: messageFrom == "Everyone",
                  onSelect: () {
                    setState(() {
                      messageFrom = "Everyone";
                    });
                  }
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    messageFrom = "Only people who like your profile";
                  });
                },
                child:  AllowMessagesTile(
                  prefernce: "Only people who like your profile",
                  value: messageFrom == "Only people who like your profile",
                  onSelect: () {
                    setState(() {
                      messageFrom = "Only people who like your profile";
                    });
                  }
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    messageFrom = "Only people who fit your preferences";
                  });
                },
                child:
                AllowMessagesTile(
                  prefernce: "Only people who fit your preferences",
                  value: messageFrom == "Only people who fit your preferences",
                  onSelect: () {
                    setState(() {
                      messageFrom = "Only people who fit your preferences";
                    });
                  }
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  SizedBox(width: 13),
                  Text(
                    "Other:",
                    style: Apptheme(context).boldText.copyWith(
                      color: Apptheme.assentColor2,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              OtherMessagePrivacySetting(
                prefernce: "Read receipts (Premium)",
                value: true,
              ),
              OtherMessagePrivacySetting(
                prefernce: "Two week message limit (Premium)",
                value: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OtherMessagePrivacySetting extends StatefulWidget {
  final String prefernce;
  final bool value;
  OtherMessagePrivacySetting({required this.prefernce, required this.value});

  @override
  _OtherMessagePrivacySettingState createState() =>
      _OtherMessagePrivacySettingState();
}

class _OtherMessagePrivacySettingState
    extends State<OtherMessagePrivacySetting> {
  // bool togellvalue = true;
  final _controller = AdvancedSwitchController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        top: toppadding,
        left: 15
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Apptheme.eventCardColorlight,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: EdgeInsets.only(
            top: 15.0,
            bottom: 15,
            left: 15,
            right: 15,
          ),
          child: Row(
            children: [
              SizedBox(
                width: size.width < 400 ? 5 : leftPadding - 10,
                // 13,
              ),
              Icon(
                LineIcons.lock,
                color: Apptheme.assentColor2,
              ),
              Container(
                width: size.width - 170,
                padding: EdgeInsets.only(
                  left: size.width > 330 ? leftPadding - 12 : 4,
                ),
                child: Text(
                  widget.prefernce,
                  style: Apptheme(context).normalText.copyWith(
                        fontSize: Apptheme.normalTextSize
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
      ),
    );
  }
}

class AllowMessagesTile extends StatelessWidget {
  final String prefernce;
  final Function onSelect;

  final bool value;
  const AllowMessagesTile({
    required this.prefernce,
    required this.value,
    required this.onSelect,
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        top: toppadding,
        left:
            // size.width < 400 ? 0 :
            leftPadding - 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Apptheme.eventCardColorlight,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Container(
                width: size.width - 120,
                padding: EdgeInsets.only(
                  left: leftPadding - 8,
                ),
                child: Text(
                  prefernce,
                  style: Apptheme(context).normalText.copyWith(
                        fontSize: Apptheme.normalTextSize),
                ),
              ),
              Spacer(),
              Radio(
                activeColor: Apptheme.eventsColor,
                value: true,
                groupValue: value,
                onChanged: (value) {onSelect();},
              )
            ],
          ),
        ),
      ),
    );
  }
}
