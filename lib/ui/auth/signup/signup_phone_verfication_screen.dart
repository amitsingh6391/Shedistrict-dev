import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shedistrict/storage.dart';
import 'package:shedistrict/stores/auth_store.dart';
import 'package:shedistrict/stores/user_store.dart';
import 'package:shedistrict/ui/core/app_logo.dart';
import 'package:shedistrict/ui/core/back_icon.dart';
import 'package:shedistrict/ui/core/custum_textfield.dart';
import 'package:shedistrict/ui/core/rounded_button.dart';
import 'package:shedistrict/ui/core/signup_bar.dart';
import 'package:shedistrict/ui/core/step_progress.dart';
import 'package:shedistrict/ui/routes/routes.gr.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/constants.dart';
import 'package:shedistrict/providers/auth/signup/signup_provider.dart';

class SignupPhoneVerficationScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final signUpWatcher = watch(signUpProvider);
    AuthStore authStore = AuthStore();
    UserStore userStore = UserStore();
    Storage storage = Storage();
    ScreenUtil.init(BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height,
      maxWidth: MediaQuery.of(context).size.width,
    ));

    Size size = MediaQuery.of(context).size;

    Future<void> sendOtp() async {
      final mobileNumber = signUpWatcher.userPhoneCode + signUpWatcher.userPhone;
     await authStore.sendOtp(mobileNumber, context, false);
    }

    final items = signUpWatcher.countryCodes;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Container(
                width: double.infinity,
                height: size.height - 60,
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
                          StepProgress(currentStep: 1),
                          SizedBox(height: 40,),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Please verify your phone number:",
                              style: Apptheme(context).boldText.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: Apptheme.primaryColor,
                              ),
                            ),
                          ),
                          SizedBox(height: 40,),
                          Row(
                            children: [
                              Container(
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Apptheme.secondaryColor,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: PopupMenuButton<String>(
                                    icon: Text(signUpWatcher.userPhoneCode, style: TextStyle(color: Apptheme.primaryColor,),),
                                    shape:RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    itemBuilder: (context) {
                                      return [
                                        PopupMenuItem(
                                          child: Container(
                                            height: 250,
                                            width: 250,
                                            decoration: ShapeDecoration(
                                                color: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10))),
                                            child: Scrollbar(
                                              child: ListView.builder(
                                                padding: EdgeInsets.only(top: 10),
                                                itemCount: items.length,
                                                itemBuilder: (context, index) {
                                                  final trans = items[index];
                                                  return ListTile(
                                                    dense: false,
                                                    title: Row(
                                                      children: [
                                                        SizedBox(width: 50, child: Text(trans['code']),),
                                                        SizedBox(width: 10),
                                                        Flexible(
                                                          child: Text(
                                                            trans['name'],
                                                            overflow: TextOverflow.ellipsis,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    onTap: () {
                                                      signUpWatcher.updateUserPhoneCode(trans['code']);
                                                      Navigator.pop(context);
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        )
                                      ];
                                    }
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                width: size.width - 150,
                                height: Apptheme.inputHeight,
                                child: InputField(
                                  hintText: 'Enter Phone Number',
                                  hintTextColor: Apptheme.lightbuttonColor,
                                  // keyboardType: TextInputType.phone,
                                  keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                                  backgroundColor: Apptheme.secondaryColor,
                                  onChanged: (value) =>
                                      signUpWatcher.changeUserPhone(value!),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          Center(
                            child: Container(
                              width: Apptheme.btnWidth,
                              height: Apptheme.btnHeight,
                              child: OutlinedButton(
                                onPressed: () async {
                                  await sendOtp();
                                },
                                child: Text('Send Code',
                                    style: TextStyle(color: Colors.white, fontSize: Apptheme.normalTextSize)),
                                style: OutlinedButton.styleFrom(
                                  shape: StadiumBorder(),
                                  backgroundColor: signUpWatcher.userPhone.length < 9
                                      ? Apptheme.lightbuttonColor
                                      : Apptheme.primaryColor,
                                  side: BorderSide(
                                      color: signUpWatcher.userPhone.length < 9
                                          ? Apptheme.lightbuttonColor
                                          : Apptheme.primaryColor),
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: "I have an account.  ",
                                  style: Apptheme(context).normalText.copyWith(
                                    fontSize: 14,
                                    color: Apptheme.assentColor2,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: "Log In",
                                  style: Apptheme(context).normalText.copyWith(
                                    decoration: TextDecoration.underline,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  recognizer: new TapGestureRecognizer()
                                    ..onTap = () => AutoRouter.of(context).replace(
                                      LoginOptionScreen(),
                                    ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20,)
                        ]
                    )
                )
            )
        )
    );

    // body: Stack(
    //   children: [
    //     Container(
    //       height: 1000.h,
    //       width: MediaQuery.of(context).size.width,
    //       color: Apptheme.secondaryColor,
    //     ),
    //     Positioned(
    //       top: topPadding1 - 2,
    //       child: Container(
    //         decoration: BoxDecoration(
    //           color: Apptheme.backgroundColor,
    //           borderRadius: BorderRadius.only(
    //             topRight: Radius.circular(40.0),
    //             topLeft: Radius.circular(40.0),
    //           ),
    //         ),
    //         height: 1000.h,
    //         width: MediaQuery.of(context).size.width,
    //         child: Padding(
    //           padding: EdgeInsets.only(
    //             left: leftPadding,
    //             right: leftPadding,
    //           ),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               SizedBox(height: 27),
    //               Row(
    //                 children: [
    //                   GestureDetector(
    //                     onTap: () {
    //                       Navigator.pop(context);
    //                     },
    //                     child: BackIcon(
    //                       icon: Icons.arrow_back_ios,
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     width: size.width * 0.20,
    //                   ),
    //                   Center(
    //                     child: Hero(
    //                       tag: "applogo",
    //                       child: Applogo(
    //                         height: 120,
    //                         width: 120,
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //               SizedBox(height: 60),
    //               Padding(
    //                 padding: const EdgeInsets.all(10.0),
    //                 child: FittedBox(
    //                   child: Row(
    //                     children: [
    //                       CircleAvatar(
    //                         backgroundColor: Color(0xFF60EDAc),
    //                         radius: 5,
    //                       ),
    //                       Image(
    //                         image: AssetImage(
    //                           "assets/images/line.png",
    //                         ),
    //                         width: size.width * 0.35,
    //                       ),
    //                       CircleAvatar(
    //                         backgroundColor: Apptheme.assentColor2,
    //                         radius: 5,
    //                       ),
    //                       Image(
    //                         image: AssetImage("assets/images/line.png"),
    //                         width: size.width * 0.35,
    //                       ),
    //                       CircleAvatar(
    //                         backgroundColor: Color(0xffEFF0FD),
    //                         radius: 5,
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //               Padding(
    //                 padding: EdgeInsets.only(
    //                   top: topPadding1,
    //                   bottom: 10,
    //                 ),
    //                 child: Text(
    //                   "Please verify your phone number:",
    //                   style: Apptheme(context).boldText.copyWith(
    //                         fontSize: 17,
    //                         color: Apptheme.primaryColor,
    //                       ),
    //                 ),
    //               ),
    //               SizedBox(height: 20),
    //               Container(
    //                 height: Apptheme.inputHeight,
    //                 child: InputField(
    //                   hintText: 'Enter Phone Number',
    //                   hintTextColor: Apptheme.lightbuttonColor,
    //                   keyboardType: TextInputType.phone,
    //                   backgroundColor: Apptheme.secondaryColor,
    //                   onChanged: (value) =>
    //                       signUpWatcher.changeUserPhone(value!),
    //                 ),
    //               ),
    //               SizedBox(height: 20.h),
    //               Center(
    //                 child: Container(
    //                   width: Apptheme.btnWidth,
    //                   height: Apptheme.btnHeight,
    //                   child: OutlinedButton(
    //                     onPressed: () {
    //                       AutoRouter.of(context).push(SignUpOtpVerfication());
    //                     },
    //                     child: Text('Send Code',
    //                         style: TextStyle(color: Colors.white, fontSize: Apptheme.normalTextSize)),
    //                     style: OutlinedButton.styleFrom(
    //                       shape: StadiumBorder(),
    //                       backgroundColor: signUpWatcher.userPhone.length < 9
    //                           ? Apptheme.lightbuttonColor
    //                           : Apptheme.primaryColor,
    //                       side: BorderSide(
    //                           color: signUpWatcher.userPhone.length < 9
    //                               ? Apptheme.lightbuttonColor
    //                               : Apptheme.primaryColor),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //     Positioned(
    //         bottom: 50,
    //         width: size.width,
    //       child: Center(
    //         child: RichText(
    //           textAlign: TextAlign.center,
    //           text: TextSpan(
    //             children: <TextSpan>[
    //               TextSpan(
    //                 text: "I have an account.  ",
    //                 style: Apptheme(context).normalText.copyWith(
    //                   fontSize: 14,
    //                   color: Apptheme.assentColor2,
    //                   fontWeight: FontWeight.w400,
    //                 ),
    //               ),
    //               TextSpan(
    //                 text: "Log In",
    //                 style: Apptheme(context).normalText.copyWith(
    //                   decoration: TextDecoration.underline,
    //                   fontSize: 14,
    //                   fontWeight: FontWeight.w400,
    //                 ),
    //                 recognizer: new TapGestureRecognizer()
    //                   ..onTap = () => AutoRouter.of(context).replace(
    //                     LoginOptionScreen(),
    //                   ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     )
    //   ],
    // ),
  }
}
