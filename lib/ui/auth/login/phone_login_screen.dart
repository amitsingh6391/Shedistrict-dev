import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shedistrict/providers/auth/signup/signup_provider.dart';
import 'package:shedistrict/stores/auth_store.dart';
import 'package:shedistrict/ui/core/app_logo.dart';
import 'package:shedistrict/ui/core/custum_textfield.dart';

import 'package:shedistrict/ui/routes/routes.gr.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/constants.dart';

class PhoneLoginScreen extends ConsumerWidget{
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final signUpWatcher = watch(signUpProvider);

    return PhoneLoginScreenUI(countryCodes: signUpWatcher.countryCodes,);
  }

}

class PhoneLoginScreenUI extends StatefulWidget {
  final countryCodes;
  PhoneLoginScreenUI({this.countryCodes});
  _PhoneLoginScreenUIState createState() => _PhoneLoginScreenUIState();
}

  class _PhoneLoginScreenUIState extends State<PhoneLoginScreenUI>{
  bool isValidPhone = false;
  AuthStore authStore = AuthStore();
  TextEditingController phone = TextEditingController();
  String userPhoneCode = "+1";
  bool loading = false;

  setIsValidPhone() {
    print('phone.text.length ${phone.text.length}');
    if(phone.text.length == 10){
      setState(() {
        isValidPhone = true;
      });
    }
    else{
      setState(() {
        isValidPhone = false;
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
    final items = widget.countryCodes;

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
                      "Log In",
                      style: Apptheme(context).boldText.copyWith(
                        color: Apptheme.primaryColor,
                        fontSize: 20,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Container(
                          width: 80,
                          decoration: BoxDecoration(
                            color: Apptheme.secondaryColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: PopupMenuButton<String>(
                              icon: Text(userPhoneCode, style: TextStyle(color: Apptheme.primaryColor,),),
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
                                                setState(() {
                                                  userPhoneCode = trans['code'];
                                                });
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
                            controller: phone,
                            hintText: 'Enter Phone Number',
                            hintTextColor: Apptheme.lightbuttonColor,
                            // keyboardType: TextInputType.phone,
                            keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                            backgroundColor: Apptheme.secondaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: Apptheme.btnWidth,
                      height: Apptheme.btnHeight,
                      child: OutlinedButton(
                        onPressed: () async {
                          if(!isValidPhone){
                            return;
                          }

                          setState(() {
                            loading = true;
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
                          await authStore.sendOtp(userPhoneCode + phone.text, context, true);
                          setState(() {
                            loading = true;
                          });
                        },
                        child: loading
                            ?
                        SizedBox(
                          child: CircularProgressIndicator(strokeWidth: 1, color: Colors.white,),
                          height: 20.0,
                          width: 20.0,
                        )
                            :
                        Text('Send Code',
                            style: TextStyle(color: Colors.white, fontSize: Apptheme.normalTextSize)),
                        style: OutlinedButton.styleFrom(
                          shape: StadiumBorder(),
                          backgroundColor: isValidPhone ?  Color(0xffED60A9) : Apptheme.lightbuttonColor,
                          side: BorderSide(color: isValidPhone ?  Color(0xffED60A9) : Apptheme.lightbuttonColor),
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
