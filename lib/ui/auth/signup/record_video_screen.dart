import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shedistrict/providers/auth/signup/signup_provider.dart';
import 'package:shedistrict/storage.dart';
import 'package:shedistrict/stores/user_store.dart';
import 'package:shedistrict/ui/auth/signup/device_permission_forvideos_popup.dart';
import 'package:shedistrict/ui/core/app_logo.dart';
import 'package:shedistrict/ui/core/back_icon.dart';
import 'package:shedistrict/ui/core/circleavatar.dart';
import 'package:shedistrict/ui/core/rounded_button.dart';
import 'package:shedistrict/ui/core/signup_bar.dart';
import 'package:shedistrict/ui/core/step_progress.dart';

import 'package:shedistrict/ui/routes/routes.gr.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';
import 'package:shedistrict/utlis/constants/constants.dart';
import 'package:shedistrict/widgets/un_ordered_list.dart';

import 'device_permission_forcamera_popup.dart';
import 'profile_approval_confirmatation_popup.dart';
import 'package:video_player/video_player.dart';

class RecordVideoScreen extends ConsumerWidget {

  @override
  Widget build(BuildContext context, watch) {
    final signupWatcher = watch(signUpProvider);
    UserStore userStore = UserStore();
    Storage storage = Storage();
    ScreenUtil.init(BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height,
      maxWidth: MediaQuery.of(context).size.width,
    ));
    Size size = MediaQuery.of(context).size;

    Future<void> submitVideo() async{
      if(signupWatcher.userVideo == ""){
        return;
      }

      final uid = await storage.get('uid');
      final user = await storage.get('user');

      user['video'] = signupWatcher.userVideo;
      await userStore.updateProfile(uid, user);

      showGeneralDialog(
        barrierLabel: "Barrier",
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: Duration(milliseconds: 800),
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
      );
    }

    if(signupWatcher.isFileUploading){
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
                // height: size.height > 800 ? size.height - 60 : 740,
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
                              "Instructions:",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: Apptheme.assentColor2,
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: UnorderedList([
                              "State your name, age, and location",
                              "Choose one of the topics below (or come up with your own!)"
                            ]),
                          ),
                          SizedBox(height: 15,),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Suggestions:",
                              style: Apptheme(context).boldText.copyWith(
                                fontSize: 17,
                                color: Apptheme.assentColor2,
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: UnorderedList([
                              "Why did you join SheDistrict?",
                              "What are you hoping to gain from SheDistrict?",
                              " Who is your favorite singer? "
                            ]),
                          ),
                          SizedBox(height: 20),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              signupWatcher.fileUploaded
                                  ?
                              VideoPlayerWidget(signupWatcher.userVideo)
                                  :
                              Container(
                                alignment: Alignment.center,
                                height: 166,
                                width: 277,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(
                                    128,
                                    141,
                                    241,
                                    0.1,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.elliptical(20, 20),
                                  ),
                                ),
                                child: IconButton(
                                  icon: CircleAvatar(
                                    backgroundColor: Apptheme.eventsColor,
                                    child: Icon(
                                      signupWatcher.fileUploaded == false
                                          ? Icons.add_circle_outline
                                          : Icons.play_arrow,
                                      color: Apptheme.backgroundColor,
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
                                        return DevicePermissionForVideos();
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
                                    );
                                  },
                                ),
                              ),
                              signupWatcher.fileUploaded == true
                                  ? Positioned(
                                bottom: -10,
                                right: 0,
                                child: IconButton(
                                  icon: CircleAvatar(
                                    backgroundColor: Apptheme.assentColor2,
                                    child: Icon(Icons.edit_outlined),
                                  ),
                                  onPressed: () {
                                    showGeneralDialog(
                                      barrierLabel: "Barrier",
                                      barrierDismissible: true,
                                      barrierColor: Colors.black.withOpacity(0.5),
                                      transitionDuration: Duration(milliseconds: 800),
                                      context: context,
                                      pageBuilder: (_, __, ___) {
                                        return DevicePermissionForVideos();
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
                                    );
                                  },
                                ),
                              )
                                  : SizedBox(),
                            ],
                          ),
                          SizedBox(height: 40),
                          Container(
                            width: Apptheme.btnWidth,
                            height: Apptheme.btnHeight,
                            child: OutlinedButton(
                              onPressed: () async {
                                await submitVideo();
                              },
                              child: Text('Submit!', style: TextStyle(color: Colors.white)),
                              style: OutlinedButton.styleFrom(
                                shape: StadiumBorder(),
                                backgroundColor: signupWatcher.fileUploaded == false
                                    ? Apptheme.lightbuttonColor
                                    : Apptheme.primaryColor,
                                side: BorderSide(color: signupWatcher.fileUploaded == false
                                    ? Apptheme.lightbuttonColor
                                    : Apptheme.primaryColor,),
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
                        ]
                    )
                )
            )
        )
    );
    // bool uploadVideoWatcher.videoUploaded = false;
  }
}

class VideoPlayerWidget extends StatefulWidget{
  String url;
  VideoPlayerWidget(this.url);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _playerController;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _playerController = VideoPlayerController.network(
        widget.url)
      ..initialize().then((value) {
        _playerController.addListener(() {                       //custom Listner
          setState(() {
            if (!_playerController.value.isPlaying &&
                (_playerController.value.duration ==_playerController.value.position)) { //checking the duration and position every time
              print('completed cideo');
              isPlaying = false;
            }
          });
        });
      });
  }

  @override
  void dispose() {
    _playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Center(
              child: _playerController.value.isInitialized
                  ? AspectRatio(
                aspectRatio: _playerController.value.aspectRatio,
                child: VideoPlayer(_playerController),
              )
                  : Container(),
            )
        ),
        Align(
            child: IconButton(
              icon: CircleAvatar(
                backgroundColor: Apptheme.eventsColor,
                child: isPlaying ? Icon(Icons.pause, color: Apptheme.backgroundColor) : Icon(Icons.play_arrow, color: Apptheme.backgroundColor,
                ),
              ),
              onPressed: () {
                setState(() {
                  isPlaying =  !_playerController.value.isPlaying;
                });
                _playerController.value.isPlaying ? _playerController.pause() : _playerController.play();
              },
            )
        )
      ],
    );
  }
}
