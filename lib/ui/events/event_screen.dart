import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:line_icons/line_icons.dart';
import 'package:shedistrict/providers/tab_provider.dart';
import 'package:shedistrict/ui/core/she_app_bar.dart';
import 'package:shedistrict/ui/events/widgets/attended_events.dart';
import 'package:shedistrict/ui/events/widgets/pending_events.dart';

import 'package:shedistrict/ui/routes/routes.gr.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';

import 'widgets/attending_events.dart';

class EventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Builder(
        builder: (context) {
          return Consumer(
            builder: (context, watch, child) {
              final tabwatcher = watch(tabprovider);
              final isNeedSafeArea = MediaQuery.of(context).viewPadding.top > 20;
              return Scaffold(
                  body: Column(
                      children: [
                        SizedBox(height: isNeedSafeArea ? 50 : 30),
                        SheAppBar(
                            titleColor: Apptheme.eventsColor,
                            hasBackAction: false,
                            actions: [
                              IconButton(
                                onPressed: () {
                                  AutoRouter.of(context).push(
                                    ScheduleMeetingEventScreen(),
                                  );
                                },
                                icon: Icon(
                                  FeatherIcons.plusCircle,
                                  color: Apptheme.eventsColor,
                                  size: 25,
                                ),
                              )
                            ],
                            title: "Events"
                        ),
                        SizedBox(height: 5),
                        Container(
                            height: 50,
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: TabBar(
                                isScrollable: true,
                                onTap: (index) {
                                  context.read(tabprovider).updateEventTab(index);
                                  print(index);
                                },
                                unselectedLabelColor: Colors.white.withOpacity(0.3),
                                indicatorColor: Colors.white,
                                tabs: [
                                  Tab(
                                    child: Text(
                                      'Attending',
                                      style: tabwatcher.enventTabindex != 0
                                          ? Apptheme(context).lightText
                                          : Apptheme(context).lightText.copyWith(
                                        color: Apptheme.eventsColor,
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      'Pending',
                                      style: tabwatcher.enventTabindex != 1
                                          ? Apptheme(context).lightText
                                          : Apptheme(context).lightText.copyWith(
                                        color: Apptheme.eventsColor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 108.0),
                                    child: Tab(
                                      child: Text(
                                        'Attended',
                                        style: tabwatcher.enventTabindex != 2
                                            ? Apptheme(context).lightText
                                            : Apptheme(context).lightText.copyWith(
                                          color: Apptheme.eventsColor,
                                        ),
                                      ),
                                    ),
                                  )
                                ]
                            ),
                        ),
                        Expanded(
                            child: Container(
                              padding: EdgeInsets.only(left: 5, right: 5),
                              child: TabBarView(
                                children: [
                                  AttendingEvents(),
                                  PendingEvents(),
                                  AttendedEvents(),
                                ],
                              ),
                            )
                        )
                      ]
                  )
              );
              // return Scaffold(
              //   appBar: AppBar(
              //     elevation: 0,
              //     title: Transform(
              //       transform: Matrix4.translationValues(-55.0, 0.0, 0.0),
              //       child: Text(
              //         "Events",
              //         style: Apptheme(context).boldText.copyWith(
              //               color: Apptheme.eventsColor,
              //               fontSize: 26,
              //             ),
              //       ),
              //     ),
              //     leading: SizedBox(),
              //     actions: [
              //       IconButton(
              //         onPressed: () {
              //           AutoRouter.of(context).push(
              //             ScheduleMeetingEventScreen(),
              //           );
              //         },
              //         icon: Icon(
              //           LineIcons.plusCircle,
              //           color: Apptheme.eventsColor,
              //         ),
              //       )
              //     ],
              //     bottom: PreferredSize(
              //       child: TabBar(
              //           isScrollable: true,
              //           onTap: (index) {
              //             context.read(tabprovider).updateEventTab(index);
              //             print(index);
              //           },
              //           unselectedLabelColor: Colors.white.withOpacity(0.3),
              //           indicatorColor: Colors.white,
              //           tabs: [
              //             Tab(
              //               child: Text(
              //                 'Attending',
              //                 style: tabwatcher.enventTabindex != 0
              //                     ? Apptheme(context).lightText
              //                     : Apptheme(context).lightText.copyWith(
              //                           color: Apptheme.eventsColor,
              //                         ),
              //               ),
              //             ),
              //             Tab(
              //               child: Text(
              //                 'Pending',
              //                 style: tabwatcher.enventTabindex != 1
              //                     ? Apptheme(context).lightText
              //                     : Apptheme(context).lightText.copyWith(
              //                           color: Apptheme.eventsColor,
              //                         ),
              //               ),
              //             ),
              //             Padding(
              //               padding: EdgeInsets.only(right: 108.0),
              //               child: Tab(
              //                 child: Text(
              //                   'Attended',
              //                   style: tabwatcher.enventTabindex != 2
              //                       ? Apptheme(context).lightText
              //                       : Apptheme(context).lightText.copyWith(
              //                             color: Apptheme.eventsColor,
              //                           ),
              //                 ),
              //               ),
              //             )
              //           ]),
              //       preferredSize: Size.fromHeight(30.0),
              //     ),
              //   ),
              //   body: TabBarView(
              //     children: [
              //       AttendingEvents(),
              //       PendingEvents(),
              //       AttendedEvents(),
              //     ],
              //   ),
              // );
            },
          );
        },
      ),
    );
  }
}
