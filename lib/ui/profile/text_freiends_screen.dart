import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shedistrict/ui/core/custum_textfield.dart';

import 'package:shedistrict/ui/core/rounded_button.dart';
import 'package:shedistrict/ui/core/userdp.dart';

import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';
import 'package:shedistrict/utlis/constants/constants.dart';

class TextFriendsScreen extends ConsumerWidget {
  TextFriendsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
    );

    return Scaffold(
      body: TextFriendsBody(),
    );
  }
}

class TextFriendsBody extends StatefulWidget{
  _TextFriendsBodyState createState() => _TextFriendsBodyState();
}

class _TextFriendsBodyState extends State<TextFriendsBody> {
  List selectedContacts = [];
  bool imInDanger = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 44),
      child: Container(
        child: ListView(
          padding: EdgeInsets.zero,
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 25,
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    AutoRouter.of(context).pop();
                  },
                  child: CircleAvatar(
                    backgroundColor:Color.fromRGBO(128, 141, 241, 0.12),
                    child: Image.asset(
                      closeIcon,
                      color: Apptheme.eventsColor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Center(
              child: Text(
                "Text Friends",
                textAlign: TextAlign.center,
                style: Apptheme(context).boldText.copyWith(
                  fontSize: 20,
                  color: Apptheme.eventsColor,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(
                left: 20.0.w,
                right: 15.h,
                top: 10.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select All",
                    textAlign: TextAlign.center,
                    style: Apptheme(context).boldText.copyWith(
                      fontSize: Apptheme.normalTextSize,
                      color: Apptheme.eventsColor,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(
                top: toppadding - 15.h,
              ),
              children: [
                for (int i = 0; i < 3; i++)
                  GestureDetector(
                    onTap: (){
                      List indexes = selectedContacts;
                      if(indexes.contains(i)){
                        indexes.remove(i);
                      }
                      else{
                        indexes.add(i);
                      }

                      setState(() {
                        selectedContacts = indexes;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(128, 141, 241, 0.03),
                          ),
                          child: Container(
                              padding: EdgeInsets.fromLTRB(8.h, 8.h, 8.h, 8.h),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  UserDp(
                                    height: 35.h,
                                    width: 35.h,
                                    image: ceoDp,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Marial Williams",
                                        style: Apptheme(context).boldText.copyWith(
                                          fontSize: Apptheme.normalTextSize,
                                          fontWeight: FontWeight.w400,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "+1 (559) 786 5445",
                                          style:
                                          Apptheme(context).boldText.copyWith(
                                            fontSize: 13,
                                            color: Apptheme.eventsColor,
                                            fontWeight: FontWeight.w400,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Spacer(),
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        color: selectedContacts.contains(i) ? Apptheme.eventsColor : Colors.white,
                                        shape: BoxShape.circle,
                                        border: Border.all(width: 4, color: Colors.white)
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  )
                                ],
                              )
                          )
                      ),
                    ),
                  )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 20.0.w,
                right: 15.h,
                top: 15.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Manual Message:",
                    textAlign: TextAlign.center,
                    style: Apptheme(context).boldText.copyWith(
                      fontSize: Apptheme.normalTextSize,
                      color: Apptheme.eventsColor,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  InputField(
                    backgroundColor: Apptheme.eventCardColor,
                    maxLines: 5,
                    hintText: "Write your message...",
                    hintTextColor: Color.fromRGBO(
                      16,
                      16,
                      16,
                      0.35,
                    ),

                    // Apptheme.assentColor,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Automatic Message:",
                    textAlign: TextAlign.center,
                    style: Apptheme(context).boldText.copyWith(
                      fontSize: Apptheme.normalTextSize,
                      color: Apptheme.eventsColor,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        imInDanger = !imInDanger;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(128, 141, 241, 0.1),
                        //  Apptheme.eventCardColorlight,
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 5),
                              Text(
                                "I’m in Danger! This is my location:",
                                style: Apptheme(context).boldText.copyWith(
                                  fontSize: Apptheme.normalTextSize,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "1234 Water St, New York, NY, 23556",
                                  style:
                                  Apptheme(context).boldText.copyWith(
                                    fontSize: Apptheme.normalTextSize,
                                    color: Apptheme.eventsColor,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                            ],
                          ),
                          Spacer(),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                color: imInDanger ? Apptheme.eventsColor : Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(width: 4, color: Colors.white)
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child:
              Container(
                width: Apptheme.btnWidth,
                height: Apptheme.btnHeight,
                child: OutlinedButton(
                  onPressed: () {
                    // AutoRouter.of(context).replace(RulesScreen());
                  },
                  child: Text('Send',
                      style: Apptheme(context).normalText.copyWith(
                          color: Apptheme.backgroundColor,
                          fontWeight: FontWeight.w400,
                          fontSize: Apptheme.normalTextSize
                      )),
                  style: OutlinedButton.styleFrom(
                    shape: StadiumBorder(),
                    backgroundColor: Apptheme.eventsColor,
                    side: BorderSide(color: Apptheme.eventsColor),
                  ),
                ),
              ),
            ),
            // Center(
            //   child: Container(
            //     width: 156.w,
            //     height: 40.h,
            //     child: RoundedButton(
            //       isOutlined: false,
            //       color: Apptheme.eventsColor,
            //       textColor: Apptheme.backgroundColor,
            //       text: "Send",
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
        margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

}
