import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'package:line_icons/line_icons.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shedistrict/providers/tab_provider.dart';
import 'package:shedistrict/services/tab_info.dart';
import 'package:shedistrict/ui/conversations/createnew_post_screen.dart';

import 'package:shedistrict/ui/conversations/widgets/all_conversations.dart';
import 'package:shedistrict/ui/conversations/widgets/my_conversations.dart';
import 'package:shedistrict/ui/conversations/widgets/postbox.dart';
import 'package:shedistrict/ui/core/she_app_bar.dart';
import 'package:shedistrict/ui/routes/routes.gr.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ConverSationsScreen extends StatefulWidget {
  @override
  _ConverSationsScreenState createState() => _ConverSationsScreenState();
}

class _ConverSationsScreenState extends State<ConverSationsScreen> with TickerProviderStateMixin{
  final List<String> textList = [
    'All',
    'Trending Now',
    'Most Recent',
    "My Location"
  ];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  int activeTabIndex = 0;
  String filter = "All";
  String location = "";


  late TabController _tabViewController;
  late TabController _scrollController;

  @override
  void initState() {
    super.initState();

    _tabViewController = TabController(vsync: this, length:7);
    _scrollController = TabController(vsync: this, length:7);
    _tabViewController.addListener((){
      final tabIndex = _tabViewController.index;
      if(activeTabIndex - tabIndex == 1 || tabIndex - activeTabIndex == 1){
        updateCurrentTab(tabIndex);
        // DefaultTabController.of(context).animateTo(1);
        // print('my index is'+ _tabViewController.index.toString());
        // print('current index is $tabIndex');
      }
    });
  }

  updateCurrentTab(tabIndex) {
    setState(() {
      activeTabIndex = tabIndex;
    });
    _tabViewController.index = tabIndex;
    _scrollController.animateTo(tabIndex, duration: Duration(milliseconds: 400), curve: Curves.ease);
  }




  @override
  void dispose() {
    _tabViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isNeedSafeArea = MediaQuery.of(context).viewPadding.top > 20;
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
    );

    Future<Position> _determinePosition() async {
      bool serviceEnabled;
      LocationPermission permission;

      // Test if location services are enabled.
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // Location services are not enabled don't continue
        // accessing the position and request users of the
        // App to enable the location services.
        return Future.error('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // Permissions are denied, next time you could try
          // requesting permissions again (this is also where
          // Android's shouldShowRequestPermissionRationale
          // returned true. According to Android guidelines
          // your App should show an explanatory UI now.
          return Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      // When we reach here, permissions are granted and we can
      // continue accessing the position of the device.
      return await Geolocator.getCurrentPosition();
    }

    return DefaultTabController(
      length: 7,
      child: StreamBuilder(
        stream: _firestore
            .collection('conversations')
            .snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          final index = DefaultTabController.of(context)!.index;
          if (streamSnapshot.hasData) {
            List docs = streamSnapshot.data!.docs;
            final conversations = docs.map((document){
              return {'id' : document.id,  ...document.data()};
            }).toList();

            List allConversations = conversations;
            if(filter == "Most Recent") {
             allConversations.sort((a,b) {
                var adate = a['createdAt']; //before -> var adate = a.expiry;
                var bdate = b['createdAt']; //before -> var bdate = b.expiry;
                return bdate.compareTo(adate); //to get the order other way just switch `adate & bdate`
              });
            }

            if(filter == "Trending Now") {
              allConversations.sort((a, b) {
                var aCount = a['likesCount'] != null ? a['likesCount'].toString() : "0"; //before -> var adate = a.expiry;
                var bCount = b['likesCount'] != null ? b['likesCount'].toString()  : "0"; //before -> var bdate = b.expiry;
                return bCount.compareTo(aCount); //to get the order other way just switch `adate & bdate`
              });
            }

            if(filter == "My Location") {
              allConversations.where((element) => element['city'] == location);
            }

            final myConversations = conversations.where((element) => element['category'] == "My Conversations");
            final ceoPosts = conversations.where((element) => element['category'] == "From the CEO");
            final shamelessPosts = conversations.where((element) => element['category'] == "Shameless Plugs");
            final fiendsPosts = conversations.where((element) => element['category'] == "Friends(S) Needed");
            final mediaPosts = conversations.where((element) => element['category'] == "Media");
            final helpWantedPosts = conversations.where((element) => element['category'] == "Help Wanted");

            return Consumer(
              builder: (context, watch, child) {
                final tabwatcher = watch(tabprovider);
                return Scaffold(
                  resizeToAvoidBottomInset: false,
                  backgroundColor: Colors.white,
                  body: Column(
                    children: [
                      SizedBox(height: isNeedSafeArea ? 50 : 30),
                      SheAppBar(
                          titleColor: Apptheme.conversattionColor,
                          hasBackAction: false,
                          actions: [
                            IconButton(
                                onPressed: () {
                                  AutoRouter.of(context).push(
                                    NotificationsScreen(),
                                  );
                                },
                                icon: Icon(FeatherIcons.bell, color: Apptheme.conversattionColor)
                            ),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                        ),
                                        insetPadding:EdgeInsets.all(20.0),
                                        contentPadding: EdgeInsets.zero,
                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                        content: CreateNewPostScreen({}),
                                      );
                                    });
                              },
                              icon: Icon(FeatherIcons.plusCircle, color: Apptheme.conversattionColor),
                            )
                          ],
                          title: "Conversations"
                      ),
                      SizedBox(height: 5),
                      Container(
                        height: 50,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: TabBar(
                          controller: _scrollController,
                            isScrollable: true,
                            onTap: (index) {
                              updateCurrentTab(index);
                              // context.read(tabprovider).updateTopTab(index);
                              print(index);
                            },
                            unselectedLabelColor: Colors.white.withOpacity(0.3),
                            indicatorColor: Colors.white,
                            labelPadding: const EdgeInsets.only(left: 10.0, bottom: 10, right:10.0),
                            tabs: [
                              Tab(
                                child: Row(
                                  children: [
                                    PopupMenuButton<String>(
                                      offset: Offset(0.0, 36.0),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(2),
                                            topRight: Radius.circular(2),
                                            bottomRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                          )
                                      ),
                                      itemBuilder: (context) {
                                        return textList.map((str) {
                                          var index = textList.indexOf(str);
                                          return PopupMenuItem(
                                              height: 35,
                                              value: str,
                                              child: Container(
                                                  child: Row(
                                                    children: [
                                                      Text(str, style: TextStyle(fontSize: Apptheme.normalTextSize),),
                                                      SizedBox(width: 10,),
                                                      index == 1 ? Icon(FontAwesomeIcons.hotjar, color: Color.fromRGBO(254, 211, 44, 1), size: 16.0,) : SizedBox(),
                                                    ],
                                                  )
                                              )
                                            // child: ListTile(
                                            //   trailing: index == 1 ? Icon(FontAwesomeIcons.hotjar, color: Color.fromRGBO(254, 211, 44, 1), size: 18.0,) : SizedBox(),
                                            //   title: Text(str),
                                            // ),
                                          );
                                        }).toList();
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          GestureDetector(
                                            onTap: () {
                                              debugPrint("ihi");

                                              debugPrint(index.toString());

                                              AutoRouter.of(context)
                                                  .push(HomeScreen());
                                              updateCurrentTab(0);
                                              // context
                                              //     .read(tabprovider)
                                              //     .updateTopTab(0);
                                            },
                                            child: Text(
                                              "All",
                                              style: activeTabIndex != 0
                                                  ? Apptheme(context).lightText
                                                  : Apptheme(context)
                                                  .lightText
                                                  .copyWith(
                                                color: Apptheme
                                                    .conversattionColor,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: ScreenUtil().setWidth(5),
                                          ),
                                          Icon(
                                            Icons.arrow_drop_down,
                                            color: activeTabIndex != 0
                                                ? Apptheme.lightColor
                                                : Apptheme.conversattionColor,
                                          ),
                                        ],
                                      ),
                                      onSelected: (v) async{
                                        print(v);
                                        var city = "";
                                        if(v == "My Location") {
                                          var status = await Permission.locationWhenInUse.request().isGranted;
                                          if(status) {
                                            final position = await _determinePosition();
                                            List<Placemark> placemarks = await placemarkFromCoordinates(
                                              position.latitude,
                                              position.longitude,
                                            );

                                            city = "${placemarks[0].locality}, ${placemarks[0].administrativeArea}";
                                          }
                                        }

                                        setState(() {
                                          filter = v;
                                          location = city;
                                        });
                                        // debugPrint("ihi");

                                        // debugPrint(index.toString());

                                        // AutoRouter.of(context).push(HomeScreen());
                                        // context.read(tabprovider).updateTopTab(0);
                                      },
                                    )
                                  ],
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'My Conversations',
                                  style: activeTabIndex != 1
                                      ? Apptheme(context).lightText
                                      : Apptheme(context).lightText.copyWith(
                                    color: Apptheme.conversattionColor,
                                  ),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'From the CEO',
                                  style: activeTabIndex != 2
                                      ? Apptheme(context).lightText
                                      : Apptheme(context).lightText.copyWith(
                                    color: Apptheme.conversattionColor,
                                  ),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Shameless Plugs',
                                  style: activeTabIndex != 3
                                      ? Apptheme(context).lightText
                                      : Apptheme(context).lightText.copyWith(
                                    color: Apptheme.conversattionColor,
                                  ),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Friends(S) Needed',
                                  style: activeTabIndex != 4
                                      ? Apptheme(context).lightText
                                      : Apptheme(context).lightText.copyWith(
                                    color: Apptheme.conversattionColor,
                                  ),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Media',
                                  style: activeTabIndex != 5
                                      ? Apptheme(context).lightText
                                      : Apptheme(context).lightText.copyWith(
                                    color: Apptheme.conversattionColor,
                                  ),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Help Wanted',
                                  style: activeTabIndex != 6
                                      ? Apptheme(context).lightText
                                      : Apptheme(context).lightText.copyWith(
                                    color: Apptheme.conversattionColor,
                                  ),
                                ),
                              )
                            ]
                        )
                      ),

                    Expanded(
                      child: Container(
                        color: Color.fromRGBO(128, 141, 241, 0.12),
                        child: TabBarView(
                          controller: _tabViewController,
                          physics: BouncingScrollPhysics(),
                          dragStartBehavior: DragStartBehavior.start,
                          children: [
                            SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Column(
                                children: allConversations.map((conversation) {
                                  return PostBox(conversation: conversation,);
                                }).toList()
                              ),
                            ),
                            SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: myConversations.length > 0 ? Column(
                                children: myConversations.map((conversation) {
                                  return PostBox(conversation: conversation,);
                                }).toList(),
                              ) : Container(
                                padding: EdgeInsets.all(15),
                                child: Text('No posts available'),
                              ),
                            ),
                            SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: ceoPosts.length > 0 ? Column(
                                children: ceoPosts.map((conversation) {
                                  return PostBox(conversation: conversation,);
                                }).toList(),
                              ) : Container(
                                padding: EdgeInsets.all(15),
                                child: Text('No posts available'),
                              ),
                            ),
                            SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: shamelessPosts.length > 0 ? Column(
                                children: shamelessPosts.map((conversation) {
                                  return PostBox(conversation: conversation,);
                                }).toList(),
                              ) : Container(
                                padding: EdgeInsets.all(15),
                                child: Text('No posts available'),
                              ),
                            ),
                            SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: fiendsPosts.length > 0 ? Column(
                                children: fiendsPosts.map((conversation) {
                                  return PostBox(conversation: conversation,);
                                }).toList(),
                              ) : Container(
                                padding: EdgeInsets.all(15),
                                child: Text('No posts available'),
                              ),
                            ),
                            SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: mediaPosts.length > 0 ? Column(
                                children: mediaPosts.map((conversation) {
                                  return PostBox(conversation: conversation,);
                                }).toList(),
                              ) : Container(
                                padding: EdgeInsets.all(15),
                                child: Text('No posts available'),
                              ),
                            ),
                            SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: helpWantedPosts.length > 0 ? Column(
                                children: helpWantedPosts.map((conversation) {
                                  return PostBox(conversation: conversation,);
                                }).toList(),
                              ) : Container(
                                padding: EdgeInsets.all(15),
                                child: Text('No posts available'),
                              ),
                            ),
                          ],
                        ),
                      )

                      ),
                    ],
                  )
                );
              },
            );

          } else {
            return Text("No data");
          }
        },
      ),
    );
  }
}
