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
import 'package:shedistrict/ui/core/custum_textfield.dart';

import 'package:shedistrict/ui/routes/routes.gr.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/constants.dart';

class EmailLoginScreen extends StatefulWidget {
  @override
  _EmailLoginScreenState createState() => _EmailLoginScreenState();
}
class _EmailLoginScreenState extends State<EmailLoginScreen>{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool enableAction = false;
  AuthStore authStore = AuthStore();
  UserStore userStore = UserStore();
  Storage storage = Storage();
  bool _loading = false;

  void checkValidInput() {
    if(passwordController.text.length > 4 && emailController.text.length > 4) {
      setState(() {
        enableAction = true;
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

    void loginWithEmail() async {
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

      final response = await authStore.loginWithEmail(emailController.text, passwordController.text);
      setState(() {
        _loading = false;
      });

      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      print('response ${response['uid']}');
      if(response['error'] == true){
        final snackBar = SnackBar(content: Text(response['message']));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }


      if(response['uid'] != null){
        await userStore.getUserProfile(response['uid']);
        await Future.delayed(Duration(milliseconds: 200));
        final user = await storage.get('user');
        await Future.delayed(Duration(milliseconds: 200));
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        if(user == null){
          final snackBar = SnackBar(content: Text("No account associated with this email."));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          return;
        }
        else{
          AutoRouter.of(context).replace(SplashScreen());
        }
      }

    }

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
                            "Login",
                            style: Apptheme(context).boldText.copyWith(
                              color: Apptheme.primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                          SizedBox(height: 30),
                          Container(
                            height: Apptheme.inputHeight,
                            child: InputField(
                              controller: emailController,
                              hintText: 'E-mail',
                              textCapitalization: false,
                              autocorrect: false,
                              hintTextColor: Apptheme.lightbuttonColor,
                              keyboardType: TextInputType.emailAddress,
                              backgroundColor: Apptheme.secondaryColor,
                              onChanged: (value) {
                                checkValidInput();
                              },
                            ),
                          ),
                          SizedBox(height: 15.h),
                          Container(
                            height: Apptheme.inputHeight,
                            child: InputField(
                              controller: passwordController,
                              hintText: 'Password ',
                              textCapitalization: false,
                              autocorrect: false,
                              backgroundColor: Apptheme.secondaryColor,
                              hintTextColor: Apptheme.lightbuttonColor,
                              suffixIconColor: emailController.text.length > 4 &&
                                  passwordController.text.length > 4
                                  ? Apptheme.primaryColor
                                  : Apptheme.lightbuttonColor,
                              isPassword: true,
                              onChanged: (value) {
                                checkValidInput();
                              },
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              AutoRouter.of(context).push(PasswordResetScreen());
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                // left: 8.0.h,
                                // right: 20.h,
                                top: 10.h,
                              ),
                              child: Container(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  "Forgot Password?",
                                  style: Apptheme(context).normalText.copyWith(
                                    decoration: TextDecoration.underline,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 20.h),
                          Container(
                            width: Apptheme.btnWidth,
                            height: Apptheme.btnHeight,
                            child: OutlinedButton(
                              onPressed: () {
                                if(enableAction) {
                                  loginWithEmail();
                                }
                              },
                              child: _loading
                                  ? SizedBox(
                                child: CircularProgressIndicator(strokeWidth: 1, color: Colors.white,),
                                height: 20.0,
                                width: 20.0,
                              ) :
                              Text('Log In', style: TextStyle(color: Colors.white, fontSize: Apptheme.normalTextSize)),
                              style: OutlinedButton.styleFrom(
                                shape: StadiumBorder(),
                                backgroundColor: enableAction ? Color(0xffED60A9) : Apptheme.lightbuttonColor,
                                side: BorderSide(color: Apptheme.lightbuttonColor),
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
                        ]
                    )
                )
            )
        )
    );
  }
}
