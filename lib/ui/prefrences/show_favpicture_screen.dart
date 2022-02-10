import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'package:line_icons/line_icons.dart';
import 'package:shedistrict/providers/prefrences/prefrences_provider.dart';
import 'package:shedistrict/stores/user_store.dart';
import 'package:shedistrict/ui/core/circleavatar.dart';
import 'package:shedistrict/ui/core/rounded_box.dart';
import 'package:shedistrict/ui/core/rounded_button.dart';
import 'package:shedistrict/ui/prefrences/widgets/device_permission_popup.dart';
import 'package:shedistrict/ui/prefrences/widgets/favpic_edit_row.dart';
import 'package:shedistrict/ui/routes/routes.gr.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/constants.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../storage.dart';

class ShowYourFavPictureScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    Size size = MediaQuery.of(context).size;
    UserStore userStore = UserStore();
    Storage storage = Storage();

    final prefrenceWatcher = watch(prefrencesProvider);

    Future<void> updateFavouritePicture() async {
      prefrenceWatcher.setLoading(true);
      // final loadingSnackbar = SnackBar(
      //     duration: const Duration(minutes: 5),
      //     content: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: <Widget>[
      //         Text("Please wait"),
      //         SizedBox(
      //           child: CircularProgressIndicator(strokeWidth: 1,),
      //           height: 20.0,
      //           width: 20.0,
      //         ),
      //       ],
      //     ));
      // ScaffoldMessenger.of(context).showSnackBar(loadingSnackbar);

      final uid = await storage.get('uid');
      final user = await storage.get('user');
      final picture1 = await userStore.uploadFile(File(prefrenceWatcher.user1favPic!.path), uid);
      final picture2 = await userStore.uploadFile(File(prefrenceWatcher.user2favPic!.path), uid);
      final picture3 = await userStore.uploadFile(File(prefrenceWatcher.user3favPic!.path), uid);
      final picture4 = await userStore.uploadFile(File(prefrenceWatcher.user4favPic!.path), uid);

      final favPics = [];
      favPics.add(picture1);
      favPics.add(picture2);
      favPics.add(picture3);
      favPics.add(picture4);

      user['favouritePictures'] = favPics;

      await userStore.updateProfile(uid, user);
      prefrenceWatcher.setLoading(false);

      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      (prefrenceWatcher.user1favPic != null &&
          prefrenceWatcher.user2favPic != null &&
          prefrenceWatcher.user3favPic != null &&
          prefrenceWatcher.user4favPic != null)
          ? AutoRouter.of(context).replace(
        UpdateAboutMeScreen(),
      )
          : debugPrint("pls uplod first");
    }

    final isNeedSafeArea = MediaQuery.of(context).viewPadding.top > 20;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: isNeedSafeArea ? 50 : 30),
              SizedBox(height: 30,),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  child: Hero(
                    tag: "applogo",
                    child: Image(
                      height: 32,
                      image: AssetImage("assets/images/shedistrictlogo.png"),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Align(
                child: Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                        children: [
                          Text(
                            "Show us your favorite pictures!",
                            style: Apptheme(context).boldText.copyWith(
                              color: Apptheme.primaryColor,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(
                            LineIcons.camera,
                            color: Apptheme.assentColor2,
                          ),
                        ],
                    ),
                )
              ),
              SizedBox(height: 30,),
             Container(
               child: Wrap(
                   children: [
                     PictureBox(picture: prefrenceWatcher.user1favPic != null ? prefrenceWatcher.user1favPic!.path : null, name: "1pic"),
                     PictureBox(picture: prefrenceWatcher.user2favPic != null ? prefrenceWatcher.user2favPic!.path : null, name: "2pic"),
                     PictureBox(picture: prefrenceWatcher.user3favPic != null ? prefrenceWatcher.user3favPic!.path : null, name: "3pic"),
                     PictureBox(picture: prefrenceWatcher.user4favPic != null ? prefrenceWatcher.user4favPic!.path : null, name: "4pic")
                   ],
               ),
             ),
              SizedBox(height: 50,),
              Container(
                width: Apptheme.btnWidth,
                height: Apptheme.btnHeight,
                child: OutlinedButton(
                  onPressed: () async{
                    await updateFavouritePicture();
                  },
                  child: prefrenceWatcher.loading
                      ?
                  SizedBox(
                    child: CircularProgressIndicator(strokeWidth: 1, color: Colors.white,),
                    height: 20.0,
                    width: 20.0,
                  )
                      : Text(
                      'Continue',
                      style: TextStyle(
                          color: Apptheme.backgroundColor,
                          fontSize: Apptheme.normalTextSize
                      )
                  ),
                  style: OutlinedButton.styleFrom(
                    shape: StadiumBorder(),
                    backgroundColor:  (prefrenceWatcher.user1favPic != null &&
                        prefrenceWatcher.user2favPic != null &&
                        prefrenceWatcher.user3favPic != null &&
                        prefrenceWatcher.user4favPic != null)
                        ? Apptheme.primaryColor
                        : Apptheme.lightbuttonColor,
                    side: BorderSide(color: Apptheme.lightbuttonColor),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Please upload 4 pictures. This step is required.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color.fromRGBO(16, 16, 16, 0.57), fontSize: 14),
                  ),
                ),
              )
            ],
          ),
        ),
      )
      // body: Container(
      //   child: Padding(
      //     padding: EdgeInsets.only(
      //       left: 20,
      //       right: 20,
      //       top: 44,
      //     ),
      //     child: Stack(
      //       children: [
      //         Align(
      //           alignment: Alignment.topCenter,
      //           child: Positioned(
      //             top: 200,
      //             child: Hero(
      //               tag: "applogo",
      //               child: Image(
      //                 height: size.height * 0.03,
      //                 image: AssetImage("assets/images/shedistrict.png"),
      //               ),
      //             ),
      //           ),
      //         ),
      //         Positioned(
      //           top: size.height * 0.08,
      //           child: Row(
      //             children: [
      //               Text(
      //                 "Show us your favorite pictures!",
      //                 style: TextStyle(
      //                   color: Apptheme.primaryColor,
      //                   fontSize: 15,
      //                   fontWeight: FontWeight.w300,
      //                 ),
      //               ),
      //               Icon(
      //                 LineIcons.camera,
      //                 color: Apptheme.assentColor2,
      //               ),
      //             ],
      //           ),
      //         ),
      //         Positioned(
      //           top: size.height * 0.17,
      //           child: RoundedBox(
      //             favpicPath: prefrenceWatcher.user1favPic == null
      //                 ? null
      //                 : prefrenceWatcher.user1favPic!.path,
      //           ),
      //         ),
      //         Positioned(
      //           top: size.height * 0.17,
      //           left: size.width * 0.46,
      //           child: RoundedBox(
      //             favpicPath: prefrenceWatcher.user2favPic == null
      //                 ? null
      //                 : prefrenceWatcher.user2favPic!.path,
      //           ),
      //         ),
      //         Positioned(
      //           top: size.height * 0.40,
      //           child: RoundedBox(
      //             favpicPath: prefrenceWatcher.user3favPic == null
      //                 ? null
      //                 : prefrenceWatcher.user3favPic!.path,
      //           ),
      //         ),
      //         Positioned(
      //           top: size.height * 0.40,
      //           left: size.width * 0.46,
      //           child: RoundedBox(
      //             favpicPath: prefrenceWatcher.user4favPic == null
      //                 ? null
      //                 : prefrenceWatcher.user4favPic!.path,
      //           ),
      //         ),
      //         prefrenceWatcher.user1favPic != null
      //             ? FavPic1RowEdit(size: size)
      //             : Positioned(
      //
      //           top: size.height > 570
      //               ? size.height==736?size.height * .33:size.height * 0.31
      //               : size.height * .32,
      //           left: size.width > 330
      //               ? size.width * 0.30
      //               : size.width * 0.26,
      //           child: GestureDetector(
      //             onTap: () {
      //               showGeneralDialog(
      //                 barrierLabel: "Barrier",
      //                 barrierDismissible: true,
      //                 barrierColor: Colors.black.withOpacity(0.5),
      //                 transitionDuration: Duration(milliseconds: 800),
      //                 context: context,
      //                 pageBuilder: (_, __, ___) {
      //                   return DevicePermissionPopup(
      //                     size: size,
      //                     favPicno: "1pic",
      //                   );
      //                 },
      //                 transitionBuilder: (_, anim, __, child) {
      //                   return SlideTransition(
      //                     position:
      //                     Tween(begin: Offset(1, 3), end: Offset(0, 0))
      //                         .animate(anim),
      //                     child: child,
      //                   );
      //                 },
      //               );
      //             },
      //             child: CustomCircleAvatar(),
      //           ),
      //         ),
      //         prefrenceWatcher.user2favPic != null
      //             ? FavPic2RowEdit(size: size)
      //             : Positioned(
      //           top: size.height > 570
      //               ? size.height==736?size.height * .33:size.height * 0.31
      //               : size.height * .32,
      //           // top: size.height > 570
      //           //     ? size.height * 0.31
      //           //     : size.height * .32,
      //           left:
      //           size.width > 320 ? size.width * 0.75 : size.width * 0.7,
      //           child: GestureDetector(
      //             onTap: () {
      //               showGeneralDialog(
      //                 barrierLabel: "Barrier",
      //                 barrierDismissible: true,
      //                 barrierColor: Colors.black.withOpacity(0.5),
      //                 transitionDuration: Duration(milliseconds: 800),
      //                 context: context,
      //                 pageBuilder: (_, __, ___) {
      //                   return DevicePermissionPopup(
      //                     size: size,
      //                     favPicno: "2pic",
      //                   );
      //                 },
      //                 transitionBuilder: (_, anim, __, child) {
      //                   return SlideTransition(
      //                     position:
      //                     Tween(begin: Offset(1, 3), end: Offset(0, 0))
      //                         .animate(anim),
      //                     child: child,
      //                   );
      //                 },
      //               );
      //             },
      //             child: CustomCircleAvatar(),
      //           ),
      //         ),
      //         prefrenceWatcher.user3favPic != null
      //             ? FavPic3RowEdit(size: size)
      //             : Positioned(
      //           top:
      //
      //           size.height > 570
      //               ? size.height==736? size.height *.56:size.height * 0.54
      //               : size.height * 0.56,
      //
      //           left: size.width > 330
      //               ? size.width * 0.30
      //               : size.width * 0.26,
      //           child: GestureDetector(
      //             onTap: () {
      //               showGeneralDialog(
      //                 barrierLabel: "Barrier",
      //                 barrierDismissible: true,
      //                 barrierColor: Colors.black.withOpacity(0.5),
      //                 transitionDuration: Duration(milliseconds: 800),
      //                 context: context,
      //                 pageBuilder: (_, __, ___) {
      //                   return DevicePermissionPopup(
      //                     size: size,
      //                     favPicno: "3pic",
      //                   );
      //                 },
      //                 transitionBuilder: (_, anim, __, child) {
      //                   return SlideTransition(
      //                     position:
      //                     Tween(begin: Offset(1, 3), end: Offset(0, 0))
      //                         .animate(anim),
      //                     child: child,
      //                   );
      //                 },
      //               );
      //             },
      //             child: CustomCircleAvatar(),
      //           ),
      //         ),
      //         prefrenceWatcher.user4favPic != null
      //             ? FavPic4RowEdit(size: size)
      //             : Positioned(
      //           top: size.height > 570
      //               ? size.height==736? size.height *.56:size.height * 0.54
      //               : size.height * 0.56,
      //           left:
      //           size.width > 320 ? size.width * 0.75 : size.width * 0.7,
      //           child: GestureDetector(
      //             onTap: () {
      //               showGeneralDialog(
      //                 barrierLabel: "Barrier",
      //                 barrierDismissible: true,
      //                 barrierColor: Colors.black.withOpacity(0.5),
      //                 transitionDuration: Duration(milliseconds: 800),
      //                 context: context,
      //                 pageBuilder: (_, __, ___) {
      //                   return DevicePermissionPopup(
      //                     size: size,
      //                     favPicno: "4pic",
      //                   );
      //                 },
      //                 transitionBuilder: (_, anim, __, child) {
      //                   return SlideTransition(
      //                     position:
      //                     Tween(begin: Offset(1, 3), end: Offset(0, 0))
      //                         .animate(anim),
      //                     child: child,
      //                   );
      //                 },
      //               );
      //             },
      //             child: CustomCircleAvatar(),
      //           ),
      //         ),
      //         Positioned(
      //           top: size.height * 0.65,
      //           left: size.width > 330 ? size.width * 0.23 : size.width * 0.2,
      //           child: InkWell(
      //             onTap: () {
      //               (prefrenceWatcher.user1favPic != null &&
      //                   prefrenceWatcher.user2favPic != null &&
      //                   prefrenceWatcher.user3favPic != null &&
      //                   prefrenceWatcher.user4favPic != null)
      //                   ? AutoRouter.of(context).replace(
      //                 UpdateAboutMeScreen(),
      //               )
      //                   : debugPrint("pls uplod first");
      //             },
      //             child: RoundedButton(
      //               isOutlined: false,
      //               text: "Continue",
      //               color: (prefrenceWatcher.user1favPic != null &&
      //                   prefrenceWatcher.user2favPic != null &&
      //                   prefrenceWatcher.user3favPic != null &&
      //                   prefrenceWatcher.user4favPic != null)
      //                   ? Apptheme.primaryColor
      //                   : Apptheme.lightbuttonColor,
      //               textColor: Apptheme.backgroundColor,
      //             ),
      //           ),
      //         ),
      //         SizedBox(height: 30,),
      //         Positioned(
      //           top: (size.height * 0.65) + 60,
      //           left: size.width > 330
      //               ? size.width * 0.30
      //               : size.width * 0.26,
      //           child: Align(
      //             alignment: Alignment.center,
      //             child: Text(
      //               "please, upload 4 pictures. This step is required.",
      //               textAlign: TextAlign.center,
      //               style: Apptheme(context).thinText,
      //             ),
      //           ),
      //         )
      //       ],
      //     ),
      //   )
      // )
    );
  }
}

class PictureBox extends StatelessWidget{
  String? picture;
  final String name;

  PictureBox({this.picture, required this.name});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: ((size.width)/ 2) - 30,
      height:  ((size.width)/ 2) - 30,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Apptheme.secondaryColor,
        borderRadius: BorderRadius.all(
          Radius.elliptical(20, 20),
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          picture != null
              ?
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(
              height:  ((size.width)/ 2) - 30,
              width: ((size.width)/ 2) - 30,
              image: AssetImage(
                picture!,
              ),
              fit: BoxFit.cover,
            ),
          )
              :
          SizedBox(),
          Positioned(
            bottom: -20,
            right: -5,
            child:  picture != null
                ? Container(
              child: CustomCircleAvatar(
                icon: Icons.edit_outlined,
                backgroundColor:
                Apptheme.assentColor2,
              ),
            )
                : SizedBox(
              height: 50,
              width: 50,
              child: IconButton(
                icon: CircleAvatar(
                  backgroundColor:
                  Apptheme.primaryColor,
                  radius: size.width * 0.1,
                  child: Icon(
                    Icons.add_circle_outline,
                    size: 20,
                    color: Apptheme
                        .backgroundColor,
                  ),
                ),
                onPressed: () {
                  showGeneralDialog(
                    barrierLabel: "Barrier",
                    barrierDismissible: true,
                    barrierColor: Colors.black.withOpacity(0.5),
                    transitionDuration: Duration(milliseconds: 800),
                    context: context,
                    pageBuilder: (_, __, ___) {
                      return DevicePermissionPopup(
                        size: size,
                        favPicno: name,
                      );
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
