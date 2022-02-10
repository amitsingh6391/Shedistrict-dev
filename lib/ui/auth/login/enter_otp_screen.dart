import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shedistrict/providers/auth/login/login_provider.dart';
import 'package:shedistrict/storage.dart';
import 'package:shedistrict/stores/auth_store.dart';
import 'package:shedistrict/stores/user_store.dart';
import 'package:shedistrict/ui/core/app_logo.dart';

import 'package:shedistrict/ui/routes/routes.gr.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shedistrict/utlis/constants/constants.dart';

class EnterOtpScreen extends StatefulWidget {
  String vid = "";
  String number = "";
  String resendToken = "";

  @override
  EnterOtpScreen(this.vid, this.number, this.resendToken);

  @override
  _EnterOtpScreenState createState() => _EnterOtpScreenState();

}
class _EnterOtpScreenState extends State<EnterOtpScreen> {
  String userOtp = "";
  bool isValidOtp = false;
  AuthStore authStore = AuthStore();
  UserStore userStore = UserStore();
  Storage storage = Storage();
  bool loading = false;

  void changeOtp(otp) {
    print(otp.length);
    if(otp.length == 6){
      setState(() {
        isValidOtp = true;
      });
    }
    else{
      setState(() {
        isValidOtp = false;
      });
    }

    setState(() {
      userOtp = otp;
    });
  }

  Future<void> verifyOtp()  async {
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

    setState(() {
      loading = true;
    });

    final response = await authStore.verifyOtp(widget.vid, userOtp, true);

    setState(() {
      loading = false;
    });


    if(response['error'] == true) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      final snackBar = SnackBar(content: Text(response['message']));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    if(response['uid'] != null){
      await userStore.getUserProfile(response['uid']);
      var user = await storage.get('user');

      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      if(user == null){
        final snackBar = SnackBar(content: Text("No account associated with this number."));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return;
      }
      else{
        AutoRouter.of(context).replace(SplashScreen());
      }
    }
    else{
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    }
  }

  Future<void> resendOtp() async{
    await authStore.sendOtp(widget.number, context, "otp");
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
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Please enter the code that has been sent to:",
                              style: Apptheme(context).boldText.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Apptheme.primaryColor,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              countryCode + widget.number,
                              style: Apptheme(context).normalText.copyWith(
                                fontSize: Apptheme.normalTextSize,
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          PinCodeTextField(
                            length: 6,
                            obscureText: false,
                            animationType: AnimationType.fade,
                            keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(20),
                              fieldHeight: Apptheme.inputHeight,
                              fieldWidth: 45,
                              activeFillColor: Apptheme.secondaryColor,
                              activeColor: Apptheme.secondaryColor,
                              inactiveColor: Apptheme.secondaryColor,
                              selectedColor: Apptheme.secondaryColor,
                              disabledColor: Apptheme.secondaryColor,
                              selectedFillColor: Apptheme.secondaryColor,
                              inactiveFillColor: Apptheme.secondaryColor,
                            ),
                            animationDuration: Duration(milliseconds: 300),
                            // backgroundColor: Colors.blue.shade50,
                            enableActiveFill: true,
                            // errorAnimationController: errorController,
                            // controller: textEditingController,
                            onCompleted: (v) {
                              setState(() {
                                isValidOtp = true;
                              });
                            },
                            onChanged: (value) {
                              print(value);
                              // loginWatcher.changeOtp(value);
                              setState(() {
                                userOtp = value;
                              });
                            },
                            beforeTextPaste: (text) {
                              print("Allowing to paste $text");
                              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                              //but you can show anything you want here, like your pop up saying wrong paste format or etc
                              return true;
                            },
                            appContext: context,
                          ),
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {resendOtp();},
                                child: Text('Resend', style: TextStyle(fontWeight: FontWeight.w500),),
                              ),
                              Container(
                                width: Apptheme.btnWidth,
                                height: Apptheme.btnHeight,
                                child: OutlinedButton(
                                  onPressed: () async {
                                    await verifyOtp();
                                  },
                                  child: loading
                                      ?
                                  SizedBox(
                                    child: CircularProgressIndicator(strokeWidth: 1, color: Colors.white,),
                                    height: 20.0,
                                    width: 20.0,
                                  )
                                      :
                                  Text('Verify', style: TextStyle(color: Colors.white, fontSize: Apptheme.normalTextSize)),
                                  style: OutlinedButton.styleFrom(
                                    shape: StadiumBorder(),
                                    backgroundColor:  isValidOtp ?  Color(0xffED60A9) : Apptheme.lightbuttonColor,
                                    side: BorderSide(color: isValidOtp ?  Color(0xffED60A9) : Apptheme.lightbuttonColor),
                                  ),
                                ),
                              )
                            ],
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
    //       top: size.height / 10,
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
    //                 top: 30,
    //               ),
    //               child: Center(
    //                   child: Hero(
    //                 tag: "applogo",
    //                 child: Applogo(
    //                   height: 130,
    //                   width: 130,
    //                 ),
    //               )),
    //             ),
    //             SizedBox(height: 40.h),
    //             Padding(
    //               padding: EdgeInsets.only(left: 20.0.h),
    //               child: Container(
    //                 alignment: Alignment.centerLeft,
    //                 child: RichText(
    //                   textAlign: TextAlign.left,
    //                   text: TextSpan(
    //                     children: <TextSpan>[
    //                       TextSpan(
    //                         text: "Enter the code, that has been sent to:\n\n",
    //                         style: Apptheme(context).boldText.copyWith(
    //                               color: Apptheme.primaryColor,
    //                               fontSize: 15,
    //                             ),
    //                       ),
    //                       TextSpan(
    //                         text: "1 (845) 345-5678",
    //                         style: Apptheme(context).normalText.copyWith(
    //                               fontSize: 17,
    //                               fontWeight: FontWeight.w400,
    //                             ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             SizedBox(height: size.height * .05),
    //             Padding(
    //               padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w),
    //               child: PinCodeTextField(
    //                 length: 4,
    //                 obscureText: false,
    //                 animationType: AnimationType.fade,
    //
    //                 pinTheme: PinTheme(
    //                   shape: PinCodeFieldShape.box,
    //                   borderRadius: BorderRadius.circular(20),
    //                   fieldHeight: size.height * 0.06,
    //                   fieldWidth: size.width * 0.2,
    //                   activeFillColor: Apptheme.secondaryColor,
    //                   activeColor: Apptheme.secondaryColor,
    //                   inactiveColor: Apptheme.secondaryColor,
    //                   selectedColor: Apptheme.secondaryColor,
    //                   disabledColor: Apptheme.secondaryColor,
    //                   selectedFillColor: Apptheme.secondaryColor,
    //                   inactiveFillColor: Apptheme.secondaryColor,
    //                 ),
    //                 animationDuration: Duration(milliseconds: 300),
    //                 // backgroundColor: Colors.blue.shade50,
    //                 enableActiveFill: true,
    //                 // errorAnimationController: errorController,
    //                 // controller: textEditingController,
    //                 onCompleted: (v) {
    //                   print("Completed");
    //                 },
    //                 onChanged: (value) {
    //                   print(value);
    //                   loginWatcher.changeOtp(value);
    //                   // setState(() {
    //                   //   currentText = value;
    //                   // });
    //                 },
    //                 beforeTextPaste: (text) {
    //                   print("Allowing to paste $text");
    //                   //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
    //                   //but you can show anything you want here, like your pop up saying wrong paste format or etc
    //                   return true;
    //                 },
    //                 appContext: context,
    //               ),
    //             ),
    //             SizedBox(height: 30.h),
    //             Container(
    //               width: 170,
    //               height: 40,
    //               child: OutlinedButton(
    //                 onPressed: () {
    //                   AutoRouter.of(context).replace(HomeScreen());
    //                 },
    //                 child: Text('Verify', style: TextStyle(color: Colors.white)),
    //                 style: OutlinedButton.styleFrom(
    //                   shape: StadiumBorder(),
    //                   backgroundColor:  Apptheme.lightbuttonColor,
    //                   side: BorderSide(color: Apptheme.lightbuttonColor),
    //                 ),
    //               ),
    //             ),
    //             SizedBox(height: 120.h),
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
    //     )
    //   ],
    // ),

  }
}
