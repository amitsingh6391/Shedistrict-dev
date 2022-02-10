import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shedistrict/providers/tab_provider.dart';
import 'package:shedistrict/ui/core/rounded_button.dart';
import 'package:shedistrict/ui/core/tab_body.dart';
import 'package:shedistrict/ui/home_screen.dart';

import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';

import 'package:shedistrict/utlis/constants/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PurchasesScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final tabwatcher = watch(tabprovider);
    return Scaffold(
      bottomNavigationBar: Customnavigationbar(tabwatcher: tabwatcher),
      body: tabbody(
        tabwatcher.tab,
        PurchaseScreenBody(),
      ),
    );
  }
}

class PurchaseScreenBody extends StatefulWidget {
  const PurchaseScreenBody({
    Key? key,
  }) : super(key: key);

  _PurchaseScreenBodyState createState() => _PurchaseScreenBodyState();
}
class _PurchaseScreenBodyState extends State<PurchaseScreenBody> {
  var selectedOptions = '79.99';
  var selectedItems = [0, 1, 2, 3, 4, 5, 6, 7, 8];
  var subscriptionItems = [];
  var _currentPage;

  void onSelected(name) {
    setState(() {
      selectedOptions = name;
      if(name == "79.99") {
        selectedItems = [0, 1, 2, 3, 4, 5, 6, 7, 8];
      }
      else if(name == "9.99") {
        selectedItems = [0, 1, 2, 3, 4, 5];
      }
      else if(name == "5.99") {
        selectedItems = [0, 1, 2, 3];
      }
      else{
        selectedItems = [0, 1, 2, 3];
      }

    });
  }

  @override
  void initState() {
    buildSubscriptionItems();
    super.initState();
  }

  void buildSubscriptionItems() {
    var items = [];
    if(selectedOptions == "79.99") {
      items =  [
        {
          "name": "Send an unlimited amount of messages",
          'icon': "assets/icons/chat-icon.png",
        },
        {
          "name": "See all profile views",
          'icon': "assets/icons/eye.png",
        },
        {
          "name" : "Hide location",
          'icon': "assets/icons/location-off.png",
        },
        {
          "name": "Hide read receipts",
          'icon': "assets/icons/file.png",
        },
        {
          "name": "Hide age",
          'icon': "assets/icons/eye-off.png",
        },
        {
          "name": "Hide online status",
          'icon':  "assets/icons/no-screen.png",
        },
        {
          "name": "Ten free boosts per month",
          'icon':  "assets/icons/star.png",
        },
        {
          "name": "Remove 2 week limit",
          'icon':  "assets/icons/calendar-icon.png",
        },
        {
          "name": "No ads",
          'icon':  "assets/icons/no-ads.png",
        },
      ];
    }
    else if(selectedOptions == "9.99") {
      items =  [
        {
          "name": "Send up to 36 messages",
          'icon': "assets/icons/chat-icon.png",
        },
        {
          "name": "See up to 20 most recent profile views",
          'icon': "assets/icons/eye.png",
        },
        {
          "name": "No ads",
          'icon': "assets/icons/no-ads.png",
        },
        {
          "name": "Hide read receipts",
          'icon': "assets/icons/file.png",
        },
        {
          "name": "Hide online status",
          'icon': "assets/icons/no-screen.png",
        },
        {
          "name": "Three free boosts per month",
          'icon':  "assets/icons/star.png",
        },
      ];
    }
    else if(selectedOptions == "5.99") {
      items =  [
        {
          "name": "Send up to 24 messages",
          'icon': "assets/icons/chat-icon.png",
        },
        {
          "name": "See up to 10 most recent profile views",
          'icon': "assets/icons/eye.png",
        },
        {
          "name": "No ads",
          'icon': "assets/icons/no-ads.png",
        },
        {
          "name": "One free boost per month",
          'icon': "assets/icons/star.png",
        },
      ];
    }
    else{
      items =  [
        {
          "name": "Send up to 12 messages",
          'icon': "assets/icons/chat-icon.png",
        },
        {
          "name": "See up to 5 most recent profile views",
          'icon': "assets/icons/eye.png",
        },
        {
          "name": "No ads",
          'icon': "assets/icons/no-ads.png",
        },
        {
          "name": "One free boosts per month",
          'icon':  "assets/icons/star.png",
        },
      ];
    }

    setState(() {
      subscriptionItems = items;
    });
  }

  void callbackFunction(index) {
    print('index $index');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 44,
          left: 20,
          right: 20
      ),
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Row(children: [
                IconButton(
                  onPressed: () {
                    AutoRouter.of(context).pop();
                  },
                  icon:
                  Icon(Icons.arrow_back_ios, color: Apptheme.assentColor2),
                ),
                Text(
                  "Purchases",
                  style: Apptheme(context).boldText.copyWith(
                      color: Apptheme.assentColor2,
                      fontSize: 26,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ]),
              SizedBox(height: 20),
              // Text(
              //   "Subscription Options:",
              //   style: TextStyle(
              //     fontSize: 20,
              //     fontWeight: FontWeight.w500,
              //     color: Apptheme.eventsColor,
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.only(
              //     left: 2 * leftPadding,
              //     top: toppadding,
              //     right: 2 * rightpadding,
              //   ),
              //   child: Text(
              //     subscriptionText,
              //     textAlign: TextAlign.center,
              //     style: Apptheme(context).normalText.copyWith(
              //       fontSize: 13,
              //       color: Apptheme.eventsColor,
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  // color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Color(0XFF47C2E9), width: 3)
                ),
                child: Column(
                  children: [
                    selectedOptions == "79.99"
                        ?
                Align(
                alignment: Alignment.centerLeft,
                  child: Text('Unlimited Possibilities!',
                    style: TextStyle(fontSize: 35, color: Apptheme.eventsColor,  fontWeight: FontWeight.w500),
                  ),
                )
                        : SizedBox(),

                    selectedOptions == "9.99"
                        ?
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Extended Possibilities!',
                        style: TextStyle(fontSize: 35, color: Apptheme.eventsColor,  fontWeight: FontWeight.w500),
                      ),
                    )
                        : SizedBox(),

                    selectedOptions == "5.99"
                        ?
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Great Possibilities!',
                        style: TextStyle(fontSize: 35, color: Apptheme.eventsColor,  fontWeight: FontWeight.w500),
                      ),
                    )
                        : SizedBox(),

                    selectedOptions == "current"
                        ?
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Your Current Plan',
                        style: TextStyle(fontSize: 35, color: Apptheme.eventsColor,  fontWeight: FontWeight.w500),
                      ),
                    )
                        : SizedBox(),

                    SizedBox(
                      height: 20,
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 200,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: false,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 300),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                        scrollDirection: Axis.horizontal,
                      ),
                      items: selectedItems.map((i) {
                        Map item = subscriptionItems[i];
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                height: 200,
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                  color: Apptheme.purchaseColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image(
                                            width: 50,
                                            image: AssetImage(
                                                item['icon']
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          Text(item['name'], textAlign: TextAlign.center, style: TextStyle(fontSize: 17, color: Colors.white)),
                                        ]
                                    )
                                )
                            );
                          },
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: selectedItems.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: 8,
                                height: 8,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                  color: (_currentPage == i) ? Color(0XFF47C2E9): Colors.grey,
                                  borderRadius: BorderRadius.circular(8),
                                ),

                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 30),
                    PlansTile(isEnabled: (selectedOptions == "79.99"), text: '\$79.99/lifetime', name: "79.99", onSelect: this.onSelected,),
                    PlansTile(isEnabled: (selectedOptions == "9.99"), text: '\$9.99/month', name: "9.99", onSelect: this.onSelected),
                    PlansTile(isEnabled: (selectedOptions == "5.99"), text: '\$5.99/month', name: "5.99", onSelect: this.onSelected),
                    PlansTile(isEnabled: (selectedOptions == "current"), text: 'Current Plan', name: "current", onSelect: this.onSelected),
                    SizedBox(height: 30),
                    Container(
                      width: Apptheme.btnWidth,
                      height: Apptheme.btnHeight,
                      child: OutlinedButton(
                        onPressed: () {
                          print('dd');
                        },
                        child: Text('Purchase',
                            style: TextStyle(color: Apptheme.backgroundColor, fontSize: Apptheme.normalTextSize)),
                        style: OutlinedButton.styleFrom(
                          shape: StadiumBorder(),
                          backgroundColor: Apptheme.eventsColor,
                          side: BorderSide(color: Apptheme.eventsColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class PlansTile extends StatelessWidget{
  final bool isEnabled;
  final String text;
  final String name;
  final Function(String?)? onSelect;

  PlansTile({required this.isEnabled, required this.text, this.onSelect, required this.name});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool displayPercentIcon = false;
    bool displayBestOption = false;

    if(name == "79.99" && isEnabled) {
      displayPercentIcon = true;
      displayBestOption = false;
    }

    if(!isEnabled && name == "79.99") {
      displayPercentIcon = false;
      displayBestOption = true;
    }


    return GestureDetector(
      onTap: () {
        onSelect!(name);
      },
      child:Container(
        margin: const EdgeInsets.only(bottom: 10),
        height: 55,
        decoration: BoxDecoration(
          color: isEnabled == true
              ? Colors.white
              : Color(0XFFEDF9FD),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1, color: isEnabled ? Apptheme.eventsColor : Color(0XFFEDF9FD))
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 12.0,
            // bottom: 10,
            left: 10,
          ),
          child: Stack(
            clipBehavior: Clip.none,
              children:[
                Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        child: Image(
                          image: isEnabled ? AssetImage("assets/images/subscription-circle-checked.png") : AssetImage("assets/images/subscription-circle.png"),
                          height: 30,
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Container(
                        child: Text(
                          text,
                          style: Apptheme(context).normalText.copyWith(
                            fontSize: Apptheme.normalTextSize,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      )
                    ],
                  ),
                ),

                displayBestOption
                ?
                Positioned(
                    right: -15,
                    top: -30,
                    child: Container(
                      child: Image(
                        height: 45,
                        image: AssetImage("assets/images/great-price.png"),
                      ),
                    )
                )
                :
                    SizedBox(),
                displayPercentIcon
                    ?
                Positioned(
                    right: -3,
                    top: -14,
                    child: Container(
                      child: Image(
                        height: 45,
                        image: AssetImage("assets/icons/percent.png"),
                      ),
                    )
                )
                    : SizedBox()

              ]
          ),
        ),
      ) ,
    );
  }

}
