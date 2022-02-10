import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shedistrict/providers/auth/signup/signup_provider.dart';
import 'package:shedistrict/storage.dart';
import 'package:shedistrict/stores/user_store.dart';
import 'package:shedistrict/ui/auth/signup/device_permission_forphotos_popup.dart';

import 'package:shedistrict/ui/core/app_logo.dart';
import 'package:shedistrict/ui/core/back_icon.dart';
import 'package:shedistrict/ui/core/circleavatar.dart';
import 'package:shedistrict/ui/core/signup_bar.dart';
import 'package:shedistrict/ui/core/step_progress.dart';

import 'package:shedistrict/ui/theme/apptheme.dart';

import 'package:shedistrict/utlis/constants/constants.dart';
import 'package:shedistrict/widgets/un_ordered_list.dart';

import 'device_permission_forcamera_popup.dart';
import 'profile_approval_confirmatation_popup.dart';

class TakePictureScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final signUpwatcher = watch(signUpProvider);
    UserStore userStore = UserStore();
    Storage storage = Storage();
    ScreenUtil.init(BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height,
      maxWidth: MediaQuery.of(context).size.width,
    ));
    Size size = MediaQuery.of(context).size;

    Future<void> updateUserProfile() async{
      final uid = await storage.get('uid');
      final user  = await storage.get('user');
      user['picture'] = signUpwatcher.userPicture;
      print('payload $user');
      await userStore.updateProfile(uid, user);

      signUpwatcher.fileUploaded == true
          ? showGeneralDialog(
        barrierLabel: "Barrier",
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration:
        Duration(milliseconds: 800),
        context: context,
        pageBuilder: (_, __, ___) {
          return ProfileApprovalConfirmatationPopup();
        },
        transitionBuilder: (_, anim, __, child) {
          return SlideTransition(
            position: Tween(
                begin: Offset(1, 3),
                end: Offset(0, 0))
                .animate(anim),
            child: child,
          );
        },
      )
          : debugPrint("pls allow us");
    }

    if(signUpwatcher.isFileUploading){
      final loadingSnackbar = SnackBar(
          duration: const Duration(minutes: 5),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Please wait"),
              SizedBox(
                child: CircularProgressIndicator(strokeWidth: 1,),
                height: 20.0,
                width: 20.0,
              ),
            ],
          ));
      ScaffoldMessenger.of(context).showSnackBar(loadingSnackbar);
    }
    else{
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Container(
                width: double.infinity,
                // height: size.height - 60,
                margin: const EdgeInsets.only(top: 60),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40.0),
                    topLeft: Radius.circular(40.0),
                  ),
                ),
                child: Container(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SignupBar(),
                          SizedBox(height: 40,),
                          StepProgress(currentStep: 2),
                          SizedBox(height: 40,),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Instructions",
                              style: Apptheme(context).boldText.copyWith(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Apptheme.primaryColor,
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              takePicInsTitle,
                              style: Apptheme(context).normalText.copyWith(
                                fontSize: Apptheme.normalTextSize,
                              ),
                            ),
                          ),
                          SizedBox(height: 30,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Container(
                                      width: ((size.width - 60)/ 2) - 5,
                                      height:  ((size.width - 60)/ 2) - 5,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.elliptical(20, 20),
                                        ),
                                      ),
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(20.0),
                                            child: Image(
                                              image: AssetImage(
                                                "assets/images/samplepic.png",
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Text('Example')
                                  ],
                                ),
                              ),
                              SizedBox(width: 10,),
                              Expanded(
                                child: Column(
                                  children: [
                                    Container(
                                      width: ((size.width - 60)/ 2) - 5,
                                      height:  ((size.width - 60)/ 2) - 5,
                                      decoration: BoxDecoration(
                                        color: Apptheme.secondaryColor,
                                        borderRadius: BorderRadius.all(
                                          Radius.elliptical(20, 20),
                                        ),
                                      ),
                                      child: Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          signUpwatcher.fileUploaded
                                              ?
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(20.0),
                                            child: Image.network(signUpwatcher.userPicture,
                                                fit: BoxFit.cover,
                                                width:  (((size.width)/ 2) - 30),
                                                height:  (((size.width)/ 2) - 30)
                                            ),
                                          )
                                              :
                                          SizedBox(),
                                          Positioned(
                                            bottom: -20,
                                            right: -5,
                                            child: signUpwatcher.fileUploaded
                                                ?
                                            SizedBox(
                                              height: 50,
                                              width: 50,
                                              child: IconButton(
                                                icon: CircleAvatar(
                                                  backgroundColor:
                                                  Apptheme.assentColor2,
                                                  radius: size.width * 0.1,
                                                  child: Icon(
                                                    Icons.edit_outlined,
                                                    size: 20,
                                                    color: Apptheme
                                                        .backgroundColor,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  showGeneralDialog(
                                                    barrierLabel: "Barrier",
                                                    barrierDismissible: true,
                                                    barrierColor: Colors.black
                                                        .withOpacity(0.5),
                                                    transitionDuration:
                                                    Duration(
                                                        milliseconds: 800),
                                                    context: context,
                                                    pageBuilder: (_, __, ___) {
                                                      return DevicePermissionForPhotos();
                                                    },
                                                    transitionBuilder:
                                                        (_, anim, __, child) {
                                                      return SlideTransition(
                                                        position: Tween(
                                                            begin: Offset(
                                                                1, 3),
                                                            end: Offset(
                                                                0, 0))
                                                            .animate(anim),
                                                        child: child,
                                                      );
                                                    },
                                                  );
                                                },
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
                                                    barrierColor: Colors.black
                                                        .withOpacity(0.5),
                                                    transitionDuration:
                                                    Duration(
                                                        milliseconds: 800),
                                                    context: context,
                                                    pageBuilder: (_, __, ___) {
                                                      return DevicePermissionForPhotos();
                                                    },
                                                    transitionBuilder:
                                                        (_, anim, __, child) {
                                                      return SlideTransition(
                                                        position: Tween(
                                                            begin: Offset(
                                                                1, 3),
                                                            end: Offset(
                                                                0, 0))
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
                                    ),
                                    SizedBox(height: 5,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          Container(
                              alignment: Alignment.bottomLeft,
                              child: UnorderedList([
                                "Make sure to have a good lighting",
                                "It should be easy to recognize you",
                                "Make sure your pose is the same as the example"
                              ])),
                          SizedBox(height: 30),
                          Container(
                            width: Apptheme.btnWidth,
                            height: Apptheme.btnHeight,
                            child: OutlinedButton(
                              onPressed: () async {
                                await updateUserProfile();
                              },
                              child: Text('Submit',
                                  style: TextStyle(color: Colors.white)),
                              style: OutlinedButton.styleFrom(
                                shape: StadiumBorder(),
                                backgroundColor: signUpwatcher.fileUploaded
                                    ? Apptheme.primaryColor
                                    : Apptheme.lightbuttonColor,
                                side: BorderSide(
                                    color: signUpwatcher.fileUploaded
                                        ? Apptheme.primaryColor
                                        : Apptheme.lightbuttonColor),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          Text(
                            disclaimer_msg,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: Color.fromRGBO(16, 16, 16, 0.57),
                            ),
                          ),
                          SizedBox(height: 30),
                        ]
                    )
                )
            )
        )
    );
    // child: Column(
    //   children: [
    //     SizedBox(height: 50),
    //     Container(
    //       decoration: BoxDecoration(
    //         color: Apptheme.backgroundColor,
    //         borderRadius: BorderRadius.only(
    //           topRight: Radius.circular(40.0),
    //           topLeft: Radius.circular(40.0),
    //         ),
    //       ),
    //       width: MediaQuery.of(context).size.width,
    //       child: Padding(
    //         padding: EdgeInsets.only(
    //           left: size.width > 330 ? 2 * leftPadding : leftPadding,
    //           right: size.width > 330 ? 2 * rightpadding : rightpadding,
    //           // left: 2 * leftPadding,
    //           // right: 2 * rightpadding,
    //         ),
    //         child: Column(
    //           children: [
    //             SizedBox(height: size.height * 0.05),
    //             Row(
    //               children: [
    //                 GestureDetector(
    //                   onTap: () {
    //                     Navigator.pop(context);
    //                   },
    //                   child: BackIcon(
    //                     icon: Icons.arrow_back_ios,
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   width: size.width * 0.14,
    //                 ),
    //                 Center(
    //                   child: Hero(
    //                     tag: "applogo",
    //                     child: Applogo(
    //                       height: 120,
    //                       width: 120,
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //             SizedBox(height: size.height * 0.05),
    //             FittedBox(
    //               child: Row(
    //                 children: [
    //                   CircleAvatar(
    //                     backgroundColor: Color(0xFF60EDAc),
    //                     radius: 5,
    //                   ),
    //                   Image(
    //                     image: AssetImage(
    //                       "assets/images/line.png",
    //                     ),
    //                     width: size.width * 0.35,
    //                   ),
    //                   CircleAvatar(
    //                     backgroundColor: Color(0xFF60EDAc),
    //                     radius: 5,
    //                   ),
    //                   Image(
    //                     image: AssetImage("assets/images/line.png"),
    //                     width: size.width * 0.35,
    //                   ),
    //                   CircleAvatar(
    //                     backgroundColor: Apptheme.assentColor2,
    //                     radius: 5,
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             SizedBox(height: 30.h),
    //             Container(
    //               alignment: Alignment.bottomLeft,
    //               child: Text("Instructions ",
    //                   style: Apptheme(context).normalText.copyWith(
    //                         fontWeight: FontWeight.w500,
    //                         color: Apptheme.primaryColor,
    //                         fontSize: 17,
    //                       )),
    //             ),
    //             SizedBox(height: 10.h),
    //             Text(
    //               takePicInsTitle,
    //               style: TextStyle(
    //                 fontSize: 16,
    //                 fontWeight: FontWeight.w300,
    //               ),
    //             ),
    //             SizedBox(height: 20.h),
    //             Row(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Expanded(
    //                   child: Column(
    //                     children: [
    //                       FittedBox(
    //                         child: ClipRRect(
    //                           borderRadius: BorderRadius.circular(20),
    //                           child: Container(
    //                             width: 150,
    //                             height: 150,
    //                             decoration: BoxDecoration(
    //                               borderRadius: BorderRadius.all(
    //                                 Radius.elliptical(20, 20),
    //                               ),
    //                             ),
    //                             child: Image(
    //                               image: AssetImage(
    //                                 "assets/images/samplepic.png",
    //                               ),
    //                               fit: BoxFit.cover,
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                       SizedBox(height: 5),
    //                       Text(
    //                         "Example",
    //                         style: Apptheme(context).lightText.copyWith(
    //                               fontSize: 13,
    //                             ),
    //                       )
    //                     ],
    //                   ),
    //                 ),
    //                 SizedBox(width: size.width * 0.05),
    //                 Expanded(
    //                   child: FittedBox(
    //                     child: Container(
    //                       height: 150,
    //                       width: 150,
    //                       alignment: Alignment.topCenter,
    //                       child: Stack(
    //                         clipBehavior: Clip.none,
    //                         children: [
    //                           Container(
    //                             alignment: Alignment.topCenter,
    //                             decoration: BoxDecoration(
    //                               color: Apptheme.secondaryColor,
    //                               border: Border.all(
    //                                 color: Apptheme.secondaryColor,
    //                               ),
    //                               borderRadius: BorderRadius.all(
    //                                 Radius.elliptical(20, 20),
    //                               ),
    //                             ),
    //                             child: signUpwatcher.videoUploaded
    //                                 ? Image(
    //                                     image: AssetImage(
    //                                       "assets/images/samplepic.png",
    //                                     ),
    //                                     fit: BoxFit.fill,
    //                                   )
    //                                 : SizedBox(),
    //                           ),
    //                           Positioned(
    //                             bottom: -20,
    //                             right: -5,
    //                             child: signUpwatcher.videoUploaded
    //                                 ? Container(
    //                                     child: CustomCircleAvatar(
    //                                       icon: Icons.edit_outlined,
    //                                       backgroundColor:
    //                                           Apptheme.assentColor2,
    //                                     ),
    //                                   )
    //                                 : SizedBox(
    //                                     height: 50,
    //                                     width: 50,
    //                                     child: IconButton(
    //                                       icon: CircleAvatar(
    //                                         backgroundColor:
    //                                             Apptheme.primaryColor,
    //                                         radius: size.width * 0.1,
    //                                         child: Icon(
    //                                           Icons.add_circle_outline,
    //                                           size: 20,
    //                                           color: Apptheme
    //                                               .backgroundColor,
    //                                         ),
    //                                       ),
    //                                       onPressed: () {
    //                                         showGeneralDialog(
    //                                           barrierLabel: "Barrier",
    //                                           barrierDismissible: true,
    //                                           barrierColor: Colors.black
    //                                               .withOpacity(0.5),
    //                                           transitionDuration:
    //                                               Duration(
    //                                                   milliseconds: 800),
    //                                           context: context,
    //                                           pageBuilder: (_, __, ___) {
    //                                             return DevicePermissionForCamera();
    //                                           },
    //                                           transitionBuilder:
    //                                               (_, anim, __, child) {
    //                                             return SlideTransition(
    //                                               position: Tween(
    //                                                       begin: Offset(
    //                                                           1, 3),
    //                                                       end: Offset(
    //                                                           0, 0))
    //                                                   .animate(anim),
    //                                               child: child,
    //                                             );
    //                                           },
    //                                         );
    //                                       },
    //                                     ),
    //                                   ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //             SizedBox(height: 23.h),
    //             Container(
    //                 alignment: Alignment.bottomLeft,
    //                 child: UnorderedList([
    //                   "Make sure to have a good lighting",
    //                   "It should be easy to recognize you",
    //                   "Make sure your pose is the same as the example"
    //                 ])),
    //             SizedBox(height: 23.h),
    //             Container(
    //               width: 170,
    //               height: 40,
    //               child: OutlinedButton(
    //                 onPressed: () {
    //                   signUpwatcher.videoUploaded == true
    //                       ? showGeneralDialog(
    //                           barrierLabel: "Barrier",
    //                           barrierDismissible: true,
    //                           barrierColor: Colors.black.withOpacity(0.5),
    //                           transitionDuration:
    //                               Duration(milliseconds: 800),
    //                           context: context,
    //                           pageBuilder: (_, __, ___) {
    //                             return ProfileApprovalConfirmatationPopup();
    //                           },
    //                           transitionBuilder: (_, anim, __, child) {
    //                             return SlideTransition(
    //                               position: Tween(
    //                                       begin: Offset(1, 3),
    //                                       end: Offset(0, 0))
    //                                   .animate(anim),
    //                               child: child,
    //                             );
    //                           },
    //                         )
    //                       : debugPrint("pls allow us");
    //                 },
    //                 child: Text('Submit',
    //                     style: TextStyle(color: Colors.white)),
    //                 style: OutlinedButton.styleFrom(
    //                   shape: StadiumBorder(),
    //                   backgroundColor: signUpwatcher.videoUploaded
    //                       ? Apptheme.primaryColor
    //                       : Apptheme.lightbuttonColor,
    //                   side: BorderSide(
    //                       color: signUpwatcher.videoUploaded
    //                           ? Apptheme.primaryColor
    //                           : Apptheme.lightbuttonColor),
    //                 ),
    //               ),
    //             ),
    //             SizedBox(height: size.height * 0.02),
    //             Text(
    //               disclaimer_msg,
    //               textAlign: TextAlign.center,
    //               style: TextStyle(
    //                 fontSize: 12,
    //                 fontWeight: FontWeight.w300,
    //                 color: Apptheme.lightColor,
    //               ),
    //             ),
    //             SizedBox(height: size.height * 0.02),
    //           ],
    //         ),
    //       ),
    //     )
    //   ],
    // ),
    // ));
  }
}
