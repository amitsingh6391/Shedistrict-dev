import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shedistrict/ui/core/custum_textfield.dart';
import 'package:shedistrict/ui/core/she_app_bar.dart';
import 'package:shedistrict/ui/messages_and_friends/widgets/report_popup.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';
import 'package:shedistrict/utlis/constants/constants.dart';

import 'widgets/meet_popup.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}
class _ChatScreenState extends State<ChatScreen> {
  String selectedReportReason = 'Choose a reason';
  onChangeSelectedReportReason(value) {
    print('value $value');
    setState(() {
      this.selectedReportReason = value;
    });
    print('this selectd reason ${ this.selectedReportReason}');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final isNeedSafeArea = MediaQuery.of(context).viewPadding.top > 20;

    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: isNeedSafeArea ? 120 : 100,
        leading: IconButton(
          onPressed: () {
            AutoRouter.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Apptheme.primaryColor,
          ),
        ),
        title: Center(
          child: Text(
            "Andrea Gray",
            style: Apptheme(context).normalText.copyWith(
                  fontSize: 20,
                ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showGeneralDialog(
                barrierLabel: "Barrier",
                barrierDismissible: true,
                barrierColor: Colors.black.withOpacity(0.5),
                transitionDuration: Duration(milliseconds: 800),
                context: context,
                pageBuilder: (_, __, ___) {
                  return ReportPopup(
                    selectedReason: selectedReportReason,
                    onReasonSelect: onChangeSelectedReportReason,
                  );
                },
                transitionBuilder: (_, anim, __, child) {
                  return SlideTransition(
                    position: Tween(begin: Offset(1, 3), end: Offset(0, 0))
                        .animate(anim),
                    child: child,
                  );
                },
              );
            },
            icon: Icon(
              FeatherIcons.alertCircle,
              color: Apptheme.messageIconActivieColor,
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(
              size.width > 330 ? size.height * 0.1 / 3 : size.height * 0.1 / 2),
          child: Column(
            children: [
              Text(
                "Online",
                style: Apptheme(context).lightText.copyWith(
                      color: Apptheme.primaryColor,
                      fontSize: 14,
                    ),
              ),
              SizedBox(
                height: 10,
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
                      return MeetPopup();
                    },
                    transitionBuilder: (_, anim, __, child) {
                      return SlideTransition(
                        position: Tween(begin: Offset(1, 3), end: Offset(0, 0))
                            .animate(anim),
                        child: child,
                      );
                    },
                  );
                },
                child: Text(
                  "13:00:54:00",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          // right: size.width > 330 ? rightpadding : 0,
          top: 16,
        ),
        child: Container(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      ceoDp,
                    ),
                    radius: 15,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 70,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Apptheme.chatlightColor,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                          padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 16,
                            bottom: 16,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Did you buy tickets for this concert?",
                                overflow: TextOverflow.ellipsis,
                                style: Apptheme(context).normalText.copyWith(
                                      fontSize: 14,
                                    ),
                              ),
                              SizedBox(height: 8),
                              Container(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  "6:89 PM",
                                  style: Apptheme(context).normalText.copyWith(
                                        fontSize: 11,
                                        color: Apptheme.primaryColor,
                                      ),
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),

              // MymessageCard(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 70,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Apptheme.primaryColor,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                          padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 16,
                            bottom: 16,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "No, I didn't!!! I have to try again, their web site crashed.",
                                style: Apptheme(context).normalText.copyWith(
                                      fontSize: 14,
                                      color: Apptheme.backgroundColor,
                                    ),
                              ),
                              SizedBox(height: 8),
                              Container(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  "6:89 PM",
                                  style: Apptheme(context).normalText.copyWith(
                                        fontSize: 11,
                                        color: Apptheme.backgroundColor,
                                      ),
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      ceoDp,
                    ),
                    radius: 15,
                  ),
                ],
              ),

              Spacer(),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 2 * bottomPadding,
                ),
                child: Container(
                  alignment: Alignment.bottomRight,
                  child: InputField(
                    backgroundColor: Apptheme.secondaryColor,
                    hintText: "Type something..",
                    suffixIcon: Container(
                      width: 100,
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Apptheme.messageIconDisabledColor,
                            child: Icon(
                              Icons.arrow_upward,
                              size: 17,
                              color: Apptheme.backgroundColor,
                            ),
                            radius: 17,
                          ),
                          SizedBox(width: 8),
                          CircleAvatar(
                            backgroundColor: Apptheme.messageIconActivieColor,
                            child: Icon(
                              LineIcons.camera,
                              size: 17,
                              color: Apptheme.backgroundColor,
                            ),
                            radius: 17,
                          ),

                          // Spacer()
                          SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
