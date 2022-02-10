import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shedistrict/storage.dart';
import 'package:shedistrict/stores/auth_store.dart';
import 'package:shedistrict/stores/user_store.dart';
import 'package:shedistrict/ui/core/app_logo.dart';
import 'package:shedistrict/ui/core/back_icon.dart';
import 'package:shedistrict/ui/core/signup_bar.dart';
import 'package:shedistrict/ui/core/step_progress.dart';

import 'package:shedistrict/ui/routes/routes.gr.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shedistrict/utlis/constants/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shedistrict/providers/auth/signup/signup_provider.dart';

class SignUpOtpVerfication extends StatefulWidget {
  String vid = "";
  String number = "";
  String resendToken = "";

  SignUpOtpVerfication(this.vid, this.number, this.resendToken);

  @override
  _SignUpOtpVerficationState createState() => _SignUpOtpVerficationState();
}
class _SignUpOtpVerficationState extends State<SignUpOtpVerfication> {
  String userOtp = "";
  bool isValidOtp = false;
  AuthStore authStore = AuthStore();
  UserStore userStore = UserStore();
  Storage storage = Storage();
  bool _loading = false;

  void changeOtp(otp) {
    setState(() {
      userOtp = otp;
    });
  }

  Future<void> verifyOtp()  async {
    setState(() {
      _loading = true;
    });
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


     final response = await authStore.verifyOtp(widget.vid, userOtp, false);

    ScaffoldMessenger.of(context).hideCurrentSnackBar();

     if(response['error'] == true) {
       final snackBar = SnackBar(content: Text(response['message']));
       ScaffoldMessenger.of(context).showSnackBar(snackBar);
     }

     if(response['success'] == true){
       final user = await storage.get('user');
       user['phone'] = widget.number;
       final uid = await storage.get('uid');
       await userStore.updateProfile(uid, user);
       AutoRouter.of(context)
           .replace(VerifyYourSelfScreen());
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
                              "Please enter the code that has been sent to:",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: Apptheme.primaryColor,
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                             widget.number,
                              style: Apptheme(context).normalText.copyWith(
                                fontSize: Apptheme.normalTextSize,
                              ),
                            ),
                          ),
                          // Container(
                          //   alignment: Alignment.centerLeft,
                          //   child: RichText(
                          //     textAlign: TextAlign.left,
                          //     text: TextSpan(
                          //       children: <TextSpan>[
                          //         TextSpan(
                          //           text:
                          //           "Please Enter the code that has been sent to:\n\n",
                          //           style: Apptheme(context).normalText.copyWith(
                          //             color: Apptheme.primaryColor,
                          //             fontSize: Apptheme.labelTextSize,
                          //             fontWeight: FontWeight.w500,
                          //           ),
                          //         ),
                          //         TextSpan(
                          //           text: "1 (845) 345-5678",
                          //           style: Apptheme(context).normalText.copyWith(
                          //             fontSize: Apptheme.labelTextSize,
                          //             fontWeight: FontWeight.w400,
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          SizedBox(height: 40,),
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
                              changeOtp(value);
                            },
                            beforeTextPaste: (text) {
                              print("Allowing to paste $text");
                              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                              //but you can show anything you want here, like your pop up saying wrong paste format or etc
                              return true;
                            },
                            appContext: context,
                          ),
                          SizedBox(height: 20),
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
                                    // AutoRouter.of(context)
                                    //     .replace(VerifyYourSelfScreen());
                                  },
                                  child: _loading ? CircularProgressIndicator() : Text('Verify',
                                      style: TextStyle(color: Colors.white, fontSize: Apptheme.normalTextSize)),
                                  style: OutlinedButton.styleFrom(
                                    shape: StadiumBorder(),
                                    backgroundColor: isValidOtp
                                        ? Apptheme.primaryColor
                                        : Apptheme.lightbuttonColor,
                                    side: BorderSide(
                                      color: isValidOtp
                                          ? Apptheme.primaryColor
                                          : Apptheme.lightbuttonColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
      //               SizedBox(height: size.height * 0.05),
      //               Padding(
      //                 padding: const EdgeInsets.all(11.0),
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
      //               SizedBox(height: 30.h),
      //               Padding(
      //                 padding: EdgeInsets.only(
      //                   left: 10.0,
      //                   right: 10,
      //                 ),
      //                 child: Container(
      //                   alignment: Alignment.centerLeft,
      //                   child: RichText(
      //                     textAlign: TextAlign.left,
      //                     text: TextSpan(
      //                       children: <TextSpan>[
      //                         TextSpan(
      //                           text:
      //                               "Please Enter the code that has been sent to:\n\n",
      //                           style: Apptheme(context).normalText.copyWith(
      //                                 color: Apptheme.primaryColor,
      //                                 fontSize: Apptheme.normalTextSize,
      //                                 fontWeight: FontWeight.w500,
      //                               ),
      //                         ),
      //                         TextSpan(
      //                           text: "1 (845) 345-5678",
      //                           style: Apptheme(context).normalText.copyWith(
      //                                 fontSize: Apptheme.labelTextSize,
      //                                 fontWeight: FontWeight.w400,
      //                               ),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //               SizedBox(height: 30),
      //               Padding(
      //                 padding: const EdgeInsets.all(2),
      //                 child: PinCodeTextField(
      //                   length: 4,
      //                   obscureText: false,
      //                   animationType: AnimationType.fade,
      //
      //                   pinTheme: PinTheme(
      //                     shape: PinCodeFieldShape.box,
      //                     borderRadius: BorderRadius.circular(20),
      //                     fieldHeight: Apptheme.inputHeight,
      //                     fieldWidth: size.width > 330 ? 75 : 60,
      //                     activeFillColor: Apptheme.secondaryColor,
      //                     activeColor: Apptheme.secondaryColor,
      //                     inactiveColor: Apptheme.secondaryColor,
      //                     selectedColor: Apptheme.secondaryColor,
      //                     disabledColor: Apptheme.secondaryColor,
      //                     selectedFillColor: Apptheme.secondaryColor,
      //                     inactiveFillColor: Apptheme.secondaryColor,
      //                   ),
      //                   animationDuration: Duration(milliseconds: 300),
      //                   // backgroundColor: Colors.blue.shade50,
      //                   enableActiveFill: true,
      //                   // errorAnimationController: errorController,
      //                   // controller: textEditingController,
      //                   onCompleted: (v) {
      //                     print("Completed");
      //                   },
      //                   onChanged: (value) {
      //                     print(value);
      //
      //                     signupWatcher.changeOtp(value);
      //                     // setState(() {
      //                     //   currentText = value;
      //                     // });
      //                   },
      //                   beforeTextPaste: (text) {
      //                     print("Allowing to paste $text");
      //                     //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
      //                     //but you can show anything you want here, like your pop up saying wrong paste format or etc
      //                     return true;
      //                   },
      //                   appContext: context,
      //                 ),
      //               ),
      //               SizedBox(height: 20),
      //               Container(
      //                 width: Apptheme.btnWidth,
      //                 height: Apptheme.btnHeight,
      //                 child: OutlinedButton(
      //                   onPressed: () {
      //                     AutoRouter.of(context)
      //                         .replace(VerifyYourSelfScreen());
      //                   },
      //                   child: Text('Verify',
      //                       style: TextStyle(color: Colors.white, fontSize: Apptheme.normalTextSize)),
      //                   style: OutlinedButton.styleFrom(
      //                     shape: StadiumBorder(),
      //                     backgroundColor: signupWatcher.userOtp.length != 4
      //                         ? Apptheme.lightbuttonColor
      //                         : Apptheme.primaryColor,
      //                     side: BorderSide(
      //                       color: signupWatcher.userOtp.length != 4
      //                           ? Apptheme.lightbuttonColor
      //                           : Apptheme.primaryColor,
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
      //       bottom: 50,
      //       width: size.width,
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
    );
  }
}
