import 'package:auto_route/auto_route.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

import 'package:shedistrict/providers/tab_provider.dart';
import 'package:shedistrict/ui/conversations/conversations_screen.dart';
import 'package:shedistrict/ui/events/event_screen.dart';
import 'package:shedistrict/ui/filters/filter_results_screen.dart';
import 'package:shedistrict/ui/messages_and_friends/message_and_friends_screen.dart';
import 'package:shedistrict/ui/routes/routes.gr.dart';

import '../../utlis/constants/asset_path.dart';
import '../../utlis/constants/constants.dart';
import '../core/userdp.dart';
import '../theme/apptheme.dart';

class EditProfileScreen extends ConsumerWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final tabwatcher = watch(tabprovider);
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(
        iconSize: 30.0,
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
      body: tabbody(tabwatcher.tab),
      // body: EditProfile(),
    );
  }

  Color tabColor(int index) {
    if (index == 0) {
      return Apptheme.conversattionColor;
    } else if (index == 1) {
      return Apptheme.filterColor;
    } else if (index == 2) {
      return Apptheme.eventsColor;
    } else if (index == 3) {
      return Apptheme.primaryColor;
    } else {
      return Apptheme.assentColor2;
    }
  }

  tabbody(int index) {
    if (index == 0) {
      return ConverSationsScreen();
    } else if (index == 1) {
      return FilterResultsScreen();
    } else if (index == 2) {
      return EventScreen();
    } else if (index == 3) {
      return MessageAndFriendsScreen();
    } else {
      return EditProfile();
      // ProfileScreen();
    }
  }
}

class EditProfile extends StatefulWidget {
  EditProfile({
    Key? key,
  }) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();

}
class _EditProfileState extends State<EditProfile> {
  final TextEditingController aboutMeController = TextEditingController(text: aboutMe);
  final TextEditingController lookingForController = TextEditingController(text: iAmLookingForText);
  bool isAboutMeVisible = false;
  bool isLookingForVisible = false;


  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
    );
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 44,
      ),
      child: SingleChildScrollView(
        child: GestureDetector(
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
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
                      "Edit Profile",
                      style: Apptheme(context).boldText.copyWith(
                          color: Apptheme.assentColor2,
                          fontSize: 26,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
                UserDp(
                  height: 50.h,
                  width: 50.w,
                  image: ceoDp,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Lily Rose",
                    style: Apptheme(context).boldText.copyWith(
                      fontSize: 17.sp,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 4; i++)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: UserDp(
                            height: 50.h,
                            width: 50.w,
                            image: ceoDp,
                          ),
                        ),
                    ],
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Apptheme.eventCardColor,
                  radius: 15.r,
                  child: IconButton(
                      onPressed: () {
                        AutoRouter.of(context).push(
                          ProfileViewScreen(),
                        );
                      },
                      icon: Center(
                        child: Icon(
                          Icons.remove_red_eye_outlined,
                          size: MediaQuery.of(context).size.width > 330
                              ? 15.w
                              : 13.w,
                          color: Apptheme.editIconsColor,
                        ),
                      )),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Apptheme.eventCardColor,
                      radius: 15.r,
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              isAboutMeVisible = !isAboutMeVisible;
                              isLookingForVisible = false;
                            });
                          },
                          icon: Center(
                            child: Icon(
                              isAboutMeVisible ? LineIcons.check : LineIcons.pen,
                              size: 15.w,
                              color: Apptheme.editIconsColor,
                            ),
                          )),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      "About Me:",
                      style: Apptheme(context).boldText.copyWith(
                        fontSize: 17,
                        color: Apptheme.eventsColor,
                      ),
                    ),
                    SizedBox(
                      width: 40.w,
                    ),
                  ],
                ),
                SizedBox(height: 15,),

                isAboutMeVisible
                    ?
                TextField(
                  style: Apptheme(context).normalText.copyWith(
                    fontSize: Apptheme.normalTextSize,
                    fontWeight: FontWeight.w300,
                  ),
                  controller: aboutMeController,
                  cursorColor:Color.fromRGBO(128, 141, 241, 1),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromRGBO(128, 141, 241, 0.12),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        width: 0,
                        color: Apptheme.backgroundColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide:
                        BorderSide(width: 0, color: Apptheme.backgroundColor)),
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                )
                    :
                Padding(
                  padding: EdgeInsets.only(
                    left: leftPadding,
                    right: rightpadding,
                  ),
                  child: Text(
                    aboutMe,
                    textAlign: TextAlign.center,
                    style: Apptheme(context).normalText.copyWith(
                      fontSize: Apptheme.normalTextSize,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 15.r,
                      backgroundColor: Apptheme.eventCardColor,
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              isLookingForVisible = !isLookingForVisible;
                              isAboutMeVisible = false;
                            });
                          },
                          icon: Icon(
                            isLookingForVisible ? LineIcons.check : LineIcons.pen,
                            size: 15.w,
                            color: Apptheme.editIconsColor,
                          )),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      "I'm looking for friends who :",
                      style: Apptheme(context).boldText.copyWith(
                        fontSize: 17,
                        color: Apptheme.eventsColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                isLookingForVisible
                ?
                TextField(

                  style: Apptheme(context).normalText.copyWith(
                    fontSize: Apptheme.normalTextSize,
                    fontWeight: FontWeight.w300,
                  ),
                  controller: lookingForController,
                  cursorColor:Color.fromRGBO(128, 141, 241, 1),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromRGBO(128, 141, 241, 0.12),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        width: 0,
                        color: Apptheme.backgroundColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide:
                        BorderSide(width: 0, color: Apptheme.backgroundColor)),
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                )
                :
                Padding(
                  padding: EdgeInsets.only(
                    left: leftPadding,
                    right: rightpadding,
                  ),
                  child: Text(
                    iAmLookingForText,
                    textAlign: TextAlign.center,
                    style: Apptheme(context).normalText.copyWith(
                      fontSize: Apptheme.normalTextSize,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Apptheme.eventCardColor,
                      radius: 15.r,
                      child: IconButton(
                          onPressed: () {
                            AutoRouter.of(context).push(YourInfoScreen());
                          },
                          icon: Icon(
                            LineIcons.pen,
                            size: 15.w,
                            color: Apptheme.editIconsColor,
                          )),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      "More about me! ",
                      style: Apptheme(context).boldText.copyWith(
                        fontSize: 17,
                        color: Apptheme.eventsColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.only(
                    left: leftPadding - 12.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Age:',
                              style: Apptheme(context).boldText.copyWith(
                                fontSize: Apptheme.normalTextSize,
                                color: Apptheme.eventsColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: '  27',
                              style: Apptheme(context).boldText.copyWith(
                                fontSize: Apptheme.normalTextSize,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Ethnicity:',
                              style: Apptheme(context).boldText.copyWith(
                                fontSize: Apptheme.normalTextSize,
                                color: Apptheme.eventsColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: '  Black',
                              style: Apptheme(context).boldText.copyWith(
                                fontSize: Apptheme.normalTextSize,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Nationality:',
                              style: Apptheme(context).boldText.copyWith(
                                fontSize: Apptheme.normalTextSize,
                                color: Apptheme.eventsColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: ' Haitian',
                              style: Apptheme(context).boldText.copyWith(
                                fontSize: Apptheme.normalTextSize,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Religion:',
                              style: Apptheme(context).boldText.copyWith(
                                fontSize: Apptheme.normalTextSize,
                                color: Apptheme.eventsColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: ' Agnostic',
                              style: Apptheme(context).boldText.copyWith(
                                fontSize: Apptheme.normalTextSize,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Location:',
                              style: Apptheme(context).boldText.copyWith(
                                fontSize: Apptheme.normalTextSize,
                                fontWeight: FontWeight.w400,
                                color: Apptheme.eventsColor,
                              ),
                            ),
                            TextSpan(
                              text: ' Suffern, NY',
                              style: Apptheme(context).boldText.copyWith(
                                fontSize: Apptheme.normalTextSize,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Education:',
                              style: Apptheme(context).boldText.copyWith(
                                fontSize: Apptheme.normalTextSize,
                                color: Apptheme.eventsColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: ' Postgrad',
                              style: Apptheme(context).boldText.copyWith(
                                fontSize: Apptheme.normalTextSize,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Relationship status:',
                              style: Apptheme(context).boldText.copyWith(
                                fontSize: Apptheme.normalTextSize,
                                color: Apptheme.eventsColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: ' Single',
                              style: Apptheme(context).boldText.copyWith(
                                fontSize: Apptheme.normalTextSize,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Sexual orientation:',
                              style: Apptheme(context).boldText.copyWith(
                                fontSize: Apptheme.normalTextSize,
                                color: Apptheme.eventsColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: '  Straight',
                              style: Apptheme(context).boldText.copyWith(
                                fontSize: Apptheme.normalTextSize,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Have kids?',
                              style: Apptheme(context).boldText.copyWith(
                                fontSize: Apptheme.normalTextSize,
                                color: Apptheme.eventsColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: '  No',
                              style: Apptheme(context).boldText.copyWith(
                                fontSize: Apptheme.normalTextSize,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Drinking habits:',
                              style: Apptheme(context).boldText.copyWith(
                                fontSize: Apptheme.normalTextSize,
                                color: Apptheme.eventsColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: ' Rarely',
                              style: Apptheme(context).boldText.copyWith(
                                fontSize: Apptheme.normalTextSize,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Smoking habits:',
                              style: Apptheme(context).boldText.copyWith(
                                fontSize: Apptheme.normalTextSize,
                                color: Apptheme.eventsColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: '  Never',
                              style: Apptheme(context).boldText.copyWith(
                                fontSize: Apptheme.normalTextSize,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Political affiliation:',
                              style: Apptheme(context).boldText.copyWith(
                                fontSize: Apptheme.normalTextSize,
                                color: Apptheme.eventsColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: ' Never Conservative',
                              style: Apptheme(context).boldText.copyWith(
                                fontSize: Apptheme.normalTextSize,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      iconSize: 25,
                      icon: Icon(FeatherIcons.instagram, color:Color(0xffED60A9)),
                    ),
                    IconButton(
                      iconSize: 25,
                      onPressed: () {},
                      icon: Icon(FeatherIcons.twitter, color:Color(0xff3CB7FD)),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
