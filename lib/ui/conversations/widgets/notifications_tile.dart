import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shedistrict/stores/notification_store.dart';
import 'package:shedistrict/ui/core/dateformatter.dart';
import 'package:shedistrict/ui/routes/routes.gr.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/app_icons.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';

class NotificationsTile extends StatelessWidget {
  final notification;


  const NotificationsTile({
    Key? key,
    this.notification
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    NotificationStore notificationStore = NotificationStore();

    return Column(
      children: [
        Container(
          // height: 90,
          color: Colors.white,
          padding: const EdgeInsets.only(left: 25, right: 25, top: 15, bottom: 15),
          margin: const EdgeInsets.only(bottom: 7),
          child: Column(
            // shrinkWrap: true,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(notification['user']['favouritePictures'][0]
                        // "assets/images/samplepic.png",
                        ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                      child: Wrap(
                    direction: Axis.vertical,
                    spacing: 3,
                    children: [
                      Row(
                        children: [
                          Text(
                      notification['user']['name'],
                            style: Apptheme(context).boldText.copyWith(
                                  fontSize: Apptheme.normalTextSize,
                                ),
                          ),
                          SizedBox(width: 15),
                          Text(
                            DateFormatter().getVerboseDateTimeRepresentation(notification['createdAt']),
                            style: Apptheme(context).lightText.copyWith(
                                  fontSize: 10,
                                ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: size.width * 0.5,
                            child: Row(
                              children: [
                                Text(
                                  notification['type'] == 'liked' ? "Liked your" :"Commented on your",
                                  style: Apptheme(context)
                                      .normalText
                                      .copyWith(fontSize: 12, wordSpacing: 2),
                                ),
                                SizedBox(width: 2,),
                                GestureDetector(
                                  onTap: () async {
                                    notificationStore.markSeen(notification['id']);
                                    AutoRouter.of(context).push(
                                      PostViewScreen(postId: notification['post']['id']),
                                    );
                                  },
                                  child: Text(
                                    "post",
                                    style: Apptheme(context)
                                        .normalText
                                        .copyWith(fontSize: 12, wordSpacing: 2, decoration: TextDecoration.underline,),
                                  ),
                                )

                              ],
                            )
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          // comment,
                        ],
                      )
                    ],
                  )),
                  Icon(
                      notification['type'] == 'liked' ?  FeatherIcons.thumbsUp : FeatherIcons.messageCircle ,
                    size: 20,
                    color: Apptheme.conversattionColor
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 5,
          color: Apptheme.grayBackground,
        )
      ],
    );
  }
}

class LikeTile extends StatelessWidget {
  const LikeTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 25, right: 25, bottom: 15, top: 15),
          child: Column(
            // shrinkWrap: true,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(
                      ceoDp,
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Wrap(
                      direction: Axis.vertical,
                      spacing: 3,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Maraia Williams",
                              style: Apptheme(context).boldText.copyWith(
                                    fontSize: 16,
                                  ),
                            ),
                            SizedBox(width: 15),
                            Text(
                              "Today, 8:67 PM",
                              style: Apptheme(context).lightText.copyWith(
                                    fontSize: 10,
                                  ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: size.width * 0.5,
                              child: Row(
                                children: [
                                  Text(
                                    "Liked on your",
                                    style: Apptheme(context)
                                        .normalText
                                        .copyWith(fontSize: 12, wordSpacing: 2),
                                  ),
                                  SizedBox(width: 2,),
                                  Text(
                                    "post",
                                    style: Apptheme(context)
                                        .normalText
                                        .copyWith(fontSize: 12, wordSpacing: 2, decoration: TextDecoration.underline,),
                                  ),
                                ],
                              )
                            ),
                            SizedBox(
                              width: 40,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Icon(
                    FeatherIcons.thumbsUp,
                    size: 20,
                    color: Apptheme.conversattionColor
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          height: 5,
          color: Apptheme.grayBackground,
        )
      ],
    );
  }
}
