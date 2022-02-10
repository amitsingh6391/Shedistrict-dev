import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shedistrict/ui/core/she_app_bar.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';

import 'package:shedistrict/utlis/constants/constants.dart';

import 'widgets/notifications_tile.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isNeedSafeArea = MediaQuery.of(context).viewPadding.top > 20;
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    return Scaffold(
        backgroundColor: Colors.white,
        body: StreamBuilder(
            stream: _firestore
                .collection('notifications')
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              var notifications = [];
              if(streamSnapshot.hasData) {
                List docs = streamSnapshot.data!.docs;
                notifications = docs.map((document){
                  return {'id' : document.id,  ...document.data()};
                }).toList();
              }

              final seenNotifications = notifications.where((element) => element['isSeen'] == true);
              final unseenNotifications = notifications.where((element) => element['isSeen'] == false);


              return SingleChildScrollView(
                child: Column(
                    children: [
                      SizedBox(height: isNeedSafeArea ? 50 : 30),
                      SheAppBar(
                          titleColor: Apptheme.conversattionColor,
                          hasBackAction: true,
                          actions: [],
                          title: "Notifications"
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.only(bottom: 20, left: 25),
                        color: Colors.white,
                        alignment: Alignment.centerLeft,
                        child: Text("New",
                            style: Apptheme(context).normalText.copyWith(
                              color: Apptheme.conversattionColor,
                              fontSize: 20,
                            )),
                      ),
                      ...unseenNotifications.map((notification) {
                        return NotificationsTile(notification: notification);
                      }).toList(),
                      SizedBox(height: 20),
                      seenNotifications.length > 0 ?
                      Container(
                        padding: EdgeInsets.only(left: 25),
                        alignment: Alignment.centerLeft,
                        child: Text("Seen",
                            style: Apptheme(context).normalText.copyWith(
                              color: Apptheme.conversattionColor,
                              fontSize: 20,
                            )),
                      ) : SizedBox(),
                      SizedBox(height: 20),
                      ...seenNotifications.map((notification) {
                        return NotificationsTile(notification: notification);
                      }).toList()
                    ]
                ),
              );
            }
        )
    );
    // appBar: AppBar(
    //   // toolbarHeight: 80,
    //   elevation: 0,
    //   centerTitle: false,
    //   titleSpacing: 0.0,
    //   title: Transform(
    //     transform: Matrix4.translationValues(-10.0, 0.0, 0.0),
    //     child: Text(
    //       "Notifications",
    //       style: Apptheme(context).boldText.copyWith(
    //         color: Apptheme.conversattionColor,
    //         fontSize: 26,
    //       ),
    //     ),
    //   ),
    //   leading: Container(
    //     // margin: const EdgeInsets.only(left: 7),
    //     child: IconButton(
    //       onPressed: () {
    //         AutoRouter.of(context).pop();
    //       },
    //       icon: Icon(
    //         Icons.arrow_back_ios,
    //         size: 20,
    //         color: Apptheme.conversattionColor,
    //       ),
    //     ),
    //   ),
    // ),
    // body: SingleChildScrollView(
    //   child: Padding(
    //     padding: EdgeInsets.only(
    //       top: 0,
    //     ),
    //     child: Container(
    //       child: Column(
    //         children: [
    //           Container(
    //             padding: EdgeInsets.only(bottom: 20, left: 25),
    //             color: Colors.white,
    //             alignment: Alignment.centerLeft,
    //             child: Text("New",
    //                 style: Apptheme(context).normalText.copyWith(
    //                   color: Apptheme.conversattionColor,
    //                   fontSize: 20,
    //                 )),
    //           ),
    //           NotificationsTile(),
    //           LikeTile(),
    //           SizedBox(height: 20),
    //           Container(
    //             padding: EdgeInsets.only(left: 25),
    //             alignment: Alignment.centerLeft,
    //             child: Text("Seen",
    //                 style: Apptheme(context).normalText.copyWith(
    //                   color: Apptheme.conversattionColor,
    //                   fontSize: 20,
    //                 )),
    //           ),
    //           SizedBox(height: 20),
    //           NotificationsTile(),
    //           LikeTile(),
    //           NotificationsTile(),
    //         ],
    //       ),
    //     ),
    //   ),
    // )
    // );
  }
}
