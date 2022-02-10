import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shedistrict/storage.dart';
import 'package:shedistrict/stores/auth_store.dart';
import 'package:shedistrict/stores/conversation_store.dart';
import 'package:shedistrict/stores/notification_store.dart';
import 'package:shedistrict/ui/conversations/widgets/conversation_comments.dart';
import 'package:shedistrict/ui/conversations/widgets/delete_confirmatation_pop_up.dart';
import 'package:shedistrict/ui/conversations/widgets/post_crud_popup.dart';
import 'package:shedistrict/ui/core/dateformatter.dart';

import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/app_icons.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';
import 'package:shedistrict/utlis/constants/constants.dart';
import 'package:shedistrict/utlis/constants/rules_text.dart';

import '../createnew_post_screen.dart';

class PostBox extends StatelessWidget {
  final String? tags;
  final Map conversation;
  PostBox({ Key? key,this.tags, required this.conversation}) : super(key: key);

  ConversationStore conversationStore = ConversationStore();
  NotificationStore notificationStore = NotificationStore();
  Storage storage = Storage();
  TextEditingController _text = TextEditingController();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
    );


    _displayDialog(BuildContext context, conversation) {
      showGeneralDialog(
        context: context,
        barrierDismissible: false,
        transitionDuration: Duration(milliseconds: 500),
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: animation,
              child: child,
            ),
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) {
          return ConversationCommentsScreen(conversation['id']);
        },
      );
    }


    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 5),
      padding: EdgeInsets.only(
        left: 20,
        right: 10,
        bottom: bottomPadding,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: size.height * 0.1,
            child: Row(children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(conversation['user']['favouritePictures'][0]),
              ),
              SizedBox(width: 10),
              Wrap(
                direction: Axis.vertical,
                children: [
                  Text(
                    conversation['user']['name'],
                    style: Apptheme(context).boldText.copyWith(
                          fontSize: Apptheme.normalTextSize,
                        ),
                  ),
                  SizedBox(height: 5.h),
                  Wrap(
                    children: [
                      Text(
                        DateFormatter().getVerboseDateTimeRepresentation(conversation['createdAt']),
                        style: Apptheme(context).lightboldText.copyWith(
                              fontSize: 12.sp,
                              color: Apptheme.lightColor,
                            ),
                      ),
                      SizedBox(width: 5,),
                      tags != null
                          ? Text(
                              "in Friends Needed ",
                              style: Apptheme(context).normalText.copyWith(
                                  decoration: TextDecoration.underline,
                                  fontSize: 12.sp),
                            )
                          : SizedBox()
                    ],
                  )
                ],
              ),
              Spacer(),
              PopupMenuButton<String>(
                offset: Offset(0.0, 36.0),
                shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      height: 35,
                      value: 'Delete Post',
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delete Post',
                              style: Apptheme(context).normalText.copyWith(
                                fontSize: Apptheme.normalTextSize,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Icon(
                              FeatherIcons.trash,
                              size: 17,
                            )
                          ],
                        )
                      ),
                    ),
                    PopupMenuItem(
                      height: 35,
                      value: 'Edit Post',
                      child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Edit Post',
                                style: Apptheme(context).normalText.copyWith(
                                  fontSize: Apptheme.normalTextSize,
                                ),
                              ),
                              SizedBox(width: 10,),
                              Icon(
                                  FeatherIcons.edit2,
                                size: 17,
                              )
                            ],
                          )

                      ),
                    ),
                    PopupMenuItem(
                      height: 35,
                      value: 'Copy Link',
                      child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Copy Link',
                                style: Apptheme(context).normalText.copyWith(
                                  fontSize: Apptheme.normalTextSize,
                                ),
                              ),
                              SizedBox(width: 10,),
                              Icon(
                                FeatherIcons.link,
                                size: 17,
                              )
                            ],
                          )

                      ),
                    ),
                  ];
                },
                child:Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.more_vert,
                      color: Apptheme.black,
                    ),
                  ],
                ),
                onSelected: (v) async {
                  if(v == 'Delete Post') {
                    await conversationStore.deletePost(conversation['id']);

                    AutoRouter.of(context).pop().then((value) {
                      showGeneralDialog(
                        barrierLabel: "Barrier",
                        barrierDismissible: true,
                        barrierColor: Colors.black.withOpacity(0.5),
                        transitionDuration: Duration(milliseconds: 800),
                        context: context,
                        pageBuilder: (_, __, ___) {
                          return PostDeleteConfirmatationPopup();
                        },
                        transitionBuilder: (_, anim, __, child) {
                          return SlideTransition(
                            position: Tween(begin: Offset(1, 3), end: Offset(0, 0))
                                .animate(anim),
                            child: child,
                          );
                        },
                      );
                    });
                  }
                  else if(v == 'Edit Post') {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                            insetPadding: EdgeInsets.zero,
                            contentPadding: EdgeInsets.zero,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            content: CreateNewPostScreen(conversation),
                          );
                        });
                  }
                  else if(v == "Copy Link"){
                    Scaffold.of(context).showSnackBar(new SnackBar(
                      content: new Text('Link has been copied to clipboard.'),
                    ));
                  }
                },
              ),
              // IconButton(
              //   icon: Icon(
              //     Icons.more_vert,
              //     color: Apptheme.black,
              //   ),
              //   onPressed: () {
              //     showGeneralDialog(
              //       barrierLabel: "Barrier",
              //       barrierDismissible: true,
              //       barrierColor: Colors.black.withOpacity(0.5),
              //       transitionDuration: Duration(milliseconds: 800),
              //       context: context,
              //       pageBuilder: (_, __, ___) {
              //         return PostCrudPopup();
              //       },
              //       transitionBuilder: (_, anim, __, child) {
              //         return SlideTransition(
              //           position: Tween(begin: Offset(1, 3), end: Offset(0, 0))
              //               .animate(anim),
              //           child: child,
              //         );
              //       },
              //     );
              //   },
              // ),
            ]),
          ),
          SizedBox(height: 10,),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              conversation['title'],
              style: Apptheme(context).boldText.copyWith(
                    fontSize: 15.sp,
                  ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            conversation['content'],
            textAlign: TextAlign.left,
            style: Apptheme(context).normalText.copyWith(
                  wordSpacing: 2,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w300,
                ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(FeatherIcons.mapPin, color: Apptheme.conversattionColor),
              // Image(
              //   image: AssetImage(pindrop),
              //   color: Apptheme.conversattionColor,
              //   height: 15.h,
              // ),
              SizedBox(width: 10.0),
              Text(
                  conversation['city'],
                style: Apptheme(context).normalText.copyWith(
                      color: Apptheme.conversattionColor,
                    ),
              ),
              Spacer(),
              Column(
                children: [
                  IconButton(onPressed: () async {
                    final userId = await storage.get('uid');
                    final user = await storage.get('user');
                    bool isDisliked = false;
                    List existingLikes = conversation['likes'] != null ? conversation['likes'] : [];
                    List likes = [];
                    if(existingLikes.length > 0) {
                      if(existingLikes.contains(userId)) {
                        existingLikes.removeWhere((element) => element == userId);
                        likes = existingLikes;
                        isDisliked = true;
                      }
                      else{
                        likes = [userId, ...existingLikes];
                        isDisliked = false;
                      }
                    }
                    else{
                      likes = [userId];
                      isDisliked = false;
                    }

                    final payload = {
                      'likes': likes,
                      'likesCount' : likes.length
                    };
                    await conversationStore.likeDislikePost(conversation['id'], payload);
                    if(!isDisliked) {
                      final notificationPayload = {
                        'user' : user,
                        'owner_id' : conversation['uid'],
                        'type' : 'liked',
                        'post' : conversation,
                        'isSeen' : false,
                        'createdAt' : DateTime.now()
                      };
                      await notificationStore.addNotification(notificationPayload);
                    }

                  }, icon: Icon(FeatherIcons.thumbsUp, color: Apptheme.conversattionColor)),
                  Text(
                    conversation['likesCount'] != null ? conversation['likesCount'].toString() : "0",
                    style: Apptheme(context).lightboldText.copyWith(
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  IconButton(onPressed: () {
                    _displayDialog(context, conversation);
                  }, icon: Icon(FeatherIcons.messageCircle, color: Apptheme.conversattionColor)),
                  Text(
                    conversation['commentsCount'] != null ? conversation['commentsCount'].toString() : "0",
                    style: Apptheme(context)
                        .lightboldText
                        .copyWith(fontSize: 10),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
