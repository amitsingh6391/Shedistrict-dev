import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shedistrict/stores/auth_store.dart';
import 'package:shedistrict/ui/core/app_logo.dart';
import 'package:shedistrict/ui/core/custum_textfield.dart';

import 'package:shedistrict/ui/routes/routes.gr.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/constants.dart';

class PasswordResetScreen extends StatefulWidget {
  _PasswordResetScreenState createState() => _PasswordResetScreenState();
}

  class _PasswordResetScreenState extends State<PasswordResetScreen>{
  bool isValidEmail = false;
  AuthStore authStore = AuthStore();
  TextEditingController email = TextEditingController();

  setIsValidEmail() {
    if(email.text.length > 0){
      setState(() {
        isValidEmail = true;
      });
    }
    else{
      setState(() {
        isValidEmail = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height,
      maxWidth: MediaQuery.of(context).size.width,
    ));
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 60),
              height: size.height > 800 ? size.height - 60 : 740,
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
                  children: [
                    Center(
                        child: Hero(
                          tag: "applogo",
                          child: Applogo(
                            height: 220,
                            width: 220,
                            // height: 220,
                            // width: 220,
                          ),
                        )),
                    SizedBox(height: 40),
                    Text(
                      "Reset password",
                      style: Apptheme(context).boldText.copyWith(
                        color: Apptheme.primaryColor,
                        fontSize: 20,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      height: Apptheme.inputHeight,
                      width: double.infinity,
                      child: InputField(
                          controller: email,
                          hintText: 'Enter Your Email',
                          hintTextColor: Apptheme.lightbuttonColor,
                          backgroundColor: Apptheme.secondaryColor,
                          keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                          // keyboardType: TextInputType.phone,
                          onChanged: (value) => setIsValidEmail()),
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: Apptheme.btnWidth,
                      height: Apptheme.btnHeight,
                      child: OutlinedButton(
                        onPressed: () async {
                          if(!isValidEmail){
                            return;
                          }

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
                          await authStore.resetPassword(email.text);
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          final snackBar = SnackBar(content: Text("Reset link has been sent."));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          await Future.delayed(Duration(milliseconds: 5000));
                          AutoRouter.of(context).replace(
                            SplashScreen(),
                          );
                        },
                        child: Text('Reset',
                            style: TextStyle(color: Colors.white, fontSize: Apptheme.normalTextSize)),
                        style: OutlinedButton.styleFrom(
                          shape: StadiumBorder(),
                          backgroundColor: isValidEmail ?  Color(0xffED60A9) : Apptheme.lightbuttonColor,
                          side: BorderSide(color: isValidEmail ?  Color(0xffED60A9) : Apptheme.lightbuttonColor),
                        ),
                      ),
                    ),
                    Spacer(),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "Don't have an account?   ",
                            style: Apptheme(context).normalText.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Apptheme.eventsColor,
                            ),
                          ),
                          TextSpan(
                            text: "Sign Up",
                            style: Apptheme(context).normalText.copyWith(
                              decoration: TextDecoration.underline,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            recognizer: new TapGestureRecognizer()
                              ..onTap = () => AutoRouter.of(context).replace(
                                RulesScreen(),
                              ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                  ],
                )
              )
            )
        )
      // body: Stack(
      //   children: [
      //     Container(
      //       height: 1000.h,
      //       width: MediaQuery.of(context).size.width,
      //       color: Apptheme.secondaryColor,
      //     ),
      //     Positioned(
      //       top: topPadding1 - 10,
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
      //         child: Column(
      //           children: [
      //             Padding(
      //               padding: EdgeInsets.only(
      //                 top: size.height * 0.13,
      //               ),
      //               child: Center(
      //                   child: Hero(
      //                 tag: "applogo",
      //                 child: Applogo(
      //                   height: size.height > 600 ? 220 : 180,
      //                   width: size.height > 600 ? 220 : 180,
      //                 ),
      //               )),
      //             ),
      //             SizedBox(height: 40.h),
      //             Text(
      //               "Please verify your phone number:",
      //               style: Apptheme(context).boldText.copyWith(
      //                     color: Apptheme.primaryColor,
      //                     fontSize: 17,
      //                   ),
      //             ),
      //             SizedBox(height: 30.h),
      //             Container(
      //               height: 40,
      //               width: size.width > 330 ? 348 : 300,
      //               child: InputField(
      //                   hintText: 'Enter Phone Number',
      //                   hintTextColor: Apptheme.lightbuttonColor,
      //                   backgroundColor: Apptheme.secondaryColor,
      //                   keyboardType: TextInputType.phone,
      //                   onChanged: (value) => context),
      //             ),
      //             SizedBox(height: 20.h),
      //             Container(
      //               width: 180,
      //               height: 45,
      //               child: OutlinedButton(
      //                 onPressed: () {
      //                   AutoRouter.of(context).push(EnterOtpScreen());
      //                 },
      //                 child: Text('Send Code',
      //                     style: TextStyle(color: Colors.white)),
      //                 style: OutlinedButton.styleFrom(
      //                   shape: StadiumBorder(),
      //                   backgroundColor: Apptheme.lightbuttonColor,
      //                   side: BorderSide(color: Apptheme.lightbuttonColor),
      //                 ),
      //               ),
      //             ),
      //             SizedBox(height: 150),
      //             RichText(
      //               textAlign: TextAlign.center,
      //               text: TextSpan(
      //                 children: <TextSpan>[
      //                   TextSpan(
      //                     text: "Don't have an account?  ",
      //                     style: TextStyle(
      //                       color: Apptheme.assentColor2,
      //                       fontSize: 14,
      //                       fontWeight: FontWeight.w400,
      //                     ),
      //                   ),
      //                   TextSpan(
      //                     text: "Sign Up",
      //                     style: Apptheme(context).normalText.copyWith(
      //                           decoration: TextDecoration.underline,
      //                           fontSize: 14,
      //                           fontWeight: FontWeight.w400,
      //                         ),
      //                     recognizer: new TapGestureRecognizer()
      //                       ..onTap = () => AutoRouter.of(context).replace(
      //                             RulesScreen(),
      //                           ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
