import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shedistrict/storage.dart';
import 'package:shedistrict/stores/conversation_store.dart';
import 'package:shedistrict/ui/core/my_dropdown.dart';

import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';

import 'widgets/post_confirmatation_popup.dart';
import  'package:keyboard_actions/keyboard_actions.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geocoding/geocoding.dart';

class CreateNewPostScreen extends StatefulWidget {
  final currentPost;
  const CreateNewPostScreen(this.currentPost);

  @override
  _CreateNewPostScreenState createState() => _CreateNewPostScreenState();
}

class _CreateNewPostScreenState extends State<CreateNewPostScreen> {
  bool isOff = false;
  String categoryText = 'Category';
  late List<DropdownMenuItem> _dropdownMenuItems;
  late String _selectedCompany;
  final FocusNode _nodeText1 = FocusNode();
  ConversationStore conversationStore = ConversationStore();
  Storage storage = Storage();

  TextEditingController heading = TextEditingController();
  TextEditingController body = TextEditingController();

  @override
  void initState() {
    super.initState();
    if(widget.currentPost['id'] != null) {
      body.text = widget.currentPost['content'];
      heading.text = widget.currentPost['title'];
      setState(() {
        categoryText = widget.currentPost['category'];
        isOff = true;
      });
    }
  }

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.grey[200],
      nextFocus: true,
      actions: [
        KeyboardActionsItem(
          focusNode: _nodeText1,
        ),
      ],
    );
  }


  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
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

  Future<void> savePost() async {

    String city = "";

    if(heading.text.length == 0) {
      final snackBar = SnackBar(content: Text("Please enter valid heading."));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    if(body.text.length == 0) {
      final snackBar = SnackBar(content: Text("Please enter valid details."));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    if(!isOff) {
      final snackBar = SnackBar(content: Text("Please turn on the location."));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    var status = await Permission.locationWhenInUse.request().isGranted;
    if(status) {
      final position = await _determinePosition();
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      city = "${placemarks[0].locality}, ${placemarks[0].administrativeArea}";
    }

    final user = await storage.get('user');
    final uid = await storage.get('uid');

    final payload = {
      'city' : city,
      'category' : categoryText,
      'title' : heading.text,
      'content' : body.text,
      'user' : user,
      'uid' : uid,
      'createdAt' : DateTime.now()
    };

    if(widget.currentPost['id'] != null) {
      await conversationStore.updatePost(widget.currentPost['id'], payload);
    }
    else{
      await conversationStore.addPost(payload);
    }


    heading.text = "";
    body.text = "";
    setState(() {
      categoryText = "Category";
      isOff = true;
    });


    if(widget.currentPost['id'] != null) {
      AutoRouter.of(context).pop();
    }
    else{
      AutoRouter.of(context).pop().then(
            (value) {
          showGeneralDialog(
            barrierLabel: "Barrier",
            barrierDismissible: true,
            barrierColor: Colors.black.withOpacity(0.5),
            transitionDuration: Duration(milliseconds: 800),
            context: context,
            pageBuilder: (_, __, ___) {
              return PostConfirmatationPopup(selectedCategory: categoryText);
            },
            transitionBuilder: (_, anim, __, child) {
              return SlideTransition(
                position:
                Tween(begin: Offset(1, 3), end: Offset(0, 0))
                    .animate(anim),
                child: child,
              );
            },
          );
        },
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 650,
        child:KeyboardActions(
            config: _buildConfig(context),
            isDialog: true,
            autoScroll: true,
            bottomAvoiderScrollPhysics: BouncingScrollPhysics(),
            child: Container(
              // padding: const EdgeInsets.all(16.0),
              child: Column(children: [
                SizedBox(height: 15,),
                Container(
                  padding: const EdgeInsets.only(right: 15),
                  child: Align(
                    child: GestureDetector(
                      onTap: () {
                        AutoRouter.of(context).pop();
                      },
                      child: Container(
                        height: 20,
                        alignment: Alignment.topRight,
                        child: Image(
                          image: AssetImage(closeIcon),
                          color: Apptheme.conversattionColor,
                        ),
                      ),
                    ),
                  ),
                ),

                // Padding(
                //   padding: EdgeInsets.only(
                //     right: 0,
                //     top: 0,
                //   ),
                //   child: Container(
                //     margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                //     alignment: Alignment.topRight,
                //     child: IconButton(
                //       onPressed: () {
                //         AutoRouter.of(context).pop();
                //       },
                //       icon: Image(
                //         image: AssetImage(closeIcon),
                //         color: Apptheme.conversattionColor,
                //       ),
                //     ),
                //   ),
                // ),
                Container(
                  alignment: Alignment.center,
                  child: Text(widget.currentPost['id'] != null ? "Update Post" : "New Post",
                      style: Apptheme(context).boldText.copyWith(
                        color: Apptheme.conversattionColor,
                        fontSize: 25,
                      )),
                ),
                SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                          return <String>[
                            'My Conversations',
                            'Shameless Plugs',
                            'Friends(s) Needed',
                            'Help Wanted',
                            "Just chattin"
                          ].map((str) {
                            return PopupMenuItem(
                              height: 35,
                              value: str,
                              child: Text(
                                str,
                                style: Apptheme(context).normalText.copyWith(
                                  fontSize: Apptheme.normalTextSize,
                                ),
                              ),
                            );
                          }).toList();
                        },
                        child:Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              categoryText,
                              style: Apptheme(context).normalText.copyWith(
                                fontSize: 17.sp,
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Apptheme.conversattionColor,
                            ),
                          ],
                        ),
                        onSelected: (v) {
                          this.setState(() {
                            categoryText = v;
                          });
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    style: Apptheme(context).boldText.copyWith(
                      fontSize: Apptheme.normalTextSize,
                    ),
                    controller: heading,
                    decoration: InputDecoration(
                      hintText: "Heading",
                      hintStyle:
                      Apptheme(context).lightText.copyWith(fontSize: Apptheme.normalTextSize),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(
                          width: 0,
                          color: Apptheme.backgroundColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide:
                          BorderSide(width: 0, color: Apptheme.backgroundColor)),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 3,
                  color: Color.fromRGBO(128, 141, 241, 0.12),
                  child: Text(''),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    maxLines: 10,
                    style: Apptheme(context).normalText.copyWith(
                      fontSize: Apptheme.normalTextSize,
                    ),
                    focusNode: _nodeText1,
                    controller: body,
                    decoration: InputDecoration(
                      hintText: "What would you like to share? ",
                      hintStyle: Apptheme(context).lightText.copyWith(fontSize: Apptheme.normalTextSize),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(
                          width: 0,
                          color: Apptheme.backgroundColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide:
                          BorderSide(width: 0, color: Apptheme.backgroundColor)),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Row(children: [
                    SizedBox(width: 18.w),
                    Text(
                      isOff ? "Location  On" : "Location Off",
                      style: Apptheme(context).normalText.copyWith(
                        fontSize: Apptheme.normalTextSize,
                      ),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    FlutterSwitch(
                      width: 30.0.w,
                      height: 14.0.h,
                      valueFontSize: 15.0,
                      toggleSize: 15.0,
                      value: isOff,
                      borderRadius: 30.0,
                      padding: 2.0,
                      showOnOff: false,
                      activeColor: Apptheme.conversattionColor,
                      onToggle: (val) => this.setState(() {
                        isOff = !isOff;
                      }),
                    ),
                  ]),
                ),

                SizedBox(
                  height: 40.0,
                ),
                GestureDetector(
                  onTap: () async{
                    await savePost();
                  },
                  child: Container(
                      height: Apptheme.btnHeight,
                      width: Apptheme.btnWidth,
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: Apptheme.btnHeight,
                        width: Apptheme.btnWidth,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: (heading.text.length > 1 &&
                                body.text.length > 1 &&
                                isOff)
                                ? Apptheme.conversattionColor
                                : Apptheme.conversattionlightColor,
                            border: Border.all(
                              color: Apptheme.conversattionlightColor,
                              width: 2,
                            )),
                        child: Center(
                          child: Text(
                            widget.currentPost['id'] != null ? "Update" : "Post",
                            style: TextStyle(
                              color: (heading.text.length > 1 &&
                                  body.text.length > 1 &&
                                  isOff)
                                  ? Apptheme.assentColor
                                  : Color(0xff101010).withAlpha(100),
                              fontSize: Apptheme.normalTextSize,
                            ),
                          ),
                        ),
                      )),
                ),
                SizedBox(height: 24,)
              ]),
            )
        )
    );
  }
}
