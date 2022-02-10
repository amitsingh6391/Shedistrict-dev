import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shedistrict/providers/auth/signup/signup_provider.dart';
import 'package:intl/intl.dart';
import 'package:shedistrict/stores/auth_store.dart';
import 'package:shedistrict/stores/user_store.dart';

import 'package:shedistrict/ui/core/app_logo.dart';
import 'package:shedistrict/ui/core/back_icon.dart';
import 'package:shedistrict/ui/core/custum_textfield.dart';
import 'package:shedistrict/ui/core/signup_bar.dart';
import 'package:shedistrict/ui/core/step_progress.dart';

import 'package:shedistrict/ui/routes/routes.gr.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';

import 'package:shedistrict/utlis/constants/constants.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class SignupScreen extends StatefulWidget {

  @override
  _SignupScreenState createState() => _SignupScreenState();

}

class _SignupScreenState extends State<SignupScreen> {
  final formKey = GlobalKey<FormState>();
  AuthStore authStore = AuthStore();
  UserStore userStore = UserStore();
  bool loading = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String dob = '';
  bool isValid = false;


  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height,
      maxWidth: MediaQuery.of(context).size.width,
    ));

    Size size = MediaQuery.of(context).size;

    Future<void> createAccount() async {
      if(!isValid){
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

      final response = await authStore.setupEmailAccount(emailController.text, passwordController.text);

      setState(() {
        loading = false;
      });

      if(response['error'] == true) {
        final snackBar = SnackBar(content: Text(response['message']));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }

      if(response['uid'] != null) {
        Map<String, dynamic> payload = {
          'uid' : response['uid'],
          'name' : nameController.text,
          'dob' : dob,
          'email' : emailController.text
        };

        print('paylaod $payload');
        await userStore.createAccount(payload);
        AutoRouter.of(context).replace(
          SignupPhoneVerficationScreen(),
        );
      }
    }

    void checkValidation() {
      if(dob.isNotEmpty &&
          emailController.text.length > 0 &&
          passwordConfirmController.text.length > 0 &&
          nameController.text.length > 0 &&
          passwordController.text.length > 0 &&
          passwordConfirmController.text == passwordController.text) {
        setState(() {
          isValid = true;
        });
      }
      else{
        setState(() {
          isValid = false;
        });
      }
    }


    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
            width: double.infinity,
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
                  StepProgress(currentStep: 0),
                  SizedBox(height: 40,),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Apptheme.primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 40,),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Container(
                          height: Apptheme.inputHeight,
                          child: InputField(
                            controller: nameController,
                            backgroundColor: Apptheme.secondaryColor,
                            hintText: 'Name *',
                            hintTextColor: Apptheme.lightbuttonColor,
                            onChanged: (value) {
                              checkValidation();
                            },
                          ),
                        ),
                        SizedBox(height: 15),
                        Platform.isIOS
                            ?
                        GestureDetector(
                          child: Container(
                            height: Apptheme.inputHeight,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Apptheme.secondaryColor,
                            ),
                            child: Container(
                                margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    dob != ""
                                        ?
                                    Text( dob,
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    )
                                        :
                                    Text('Birthday*',
                                      style: TextStyle(
                                        color: Apptheme.lightbuttonColor,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Container(
                                        margin: const EdgeInsets.only(right: 15),
                                        child: Icon(
                                          Icons.calendar_today_outlined,
                                          color: Apptheme.primaryColor,
                                          size: 20,
                                        )
                                    )
                                  ],
                                )
                            ),
                          ),
                          onTap: () {
                            DatePicker.showDatePicker(context,
                                showTitleActions: true,
                                maxTime: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
                                minTime: DateTime(1920, 01, 01),
                                theme: DatePickerTheme(
                                    headerColor: Color.fromRGBO(247, 247, 247, 1),
                                    backgroundColor: Colors.white,
                                    itemStyle: TextStyle(
                                      // color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: Apptheme.normalTextSize),
                                    doneStyle:
                                    TextStyle(color: Colors.green, fontSize: 16)),
                                onChanged: (date) {
                                  print('change $date in time zone ' +
                                      date.timeZoneOffset.inHours.toString());
                                }, onConfirm: (date) {
                                  final date2 = DateTime.now();
                                  final difference = date2.difference(date).inDays;
                                  final differenceInYears = (difference/365).floor();
                                  print('differenceInYears $differenceInYears');
                                  if(differenceInYears < 16) {
                                    final snackBar = SnackBar(content: Text("Sorry you cant join as you're under 16 years old."));
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                    setState(() {
                                      dob = "";
                                    });
                                    checkValidation();
                                    return;
                                  }

                                  setState(() {
                                    dob = DateFormat("MM/dd/yyyy").format(date);
                                  });
                                  checkValidation();
                                }, currentTime: DateTime.now(), locale: LocaleType.en);
                          },
                        )

                            :
                        Container(
                          height: Apptheme.inputHeight,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Apptheme.secondaryColor,
                          ),
                          child: DateTimePicker(
                            initialValue: '',
                            style: TextStyle(fontSize: Apptheme.normalTextSize),
                            textAlign: TextAlign.left,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                            dateLabelText: 'Date',
                            icon: Icon(Icons.event),
                            onChanged: (value) {
                              final birthday = DateTime.parse(value);
                              final date2 = DateTime.now();
                              final difference = date2.difference(birthday).inDays;
                              final differenceInYears = (difference/365).floor();
                              print('differenceInYears $differenceInYears');
                              // if(differenceInYears < 16) {
                              //   final snackBar = SnackBar(content: Text("Sorry you cant join as you're under 16 years old."));
                              //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              //   return;
                              // }
                              //
                              // setState(() {
                              //   dob = value;
                              // });
                              // checkValidation();
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                labelText: "Birthday *",
                                labelStyle:
                                Apptheme(context).normalText.copyWith(
                                  color: Apptheme.lightbuttonColor,
                                  fontSize: Apptheme.normalTextSize,
                                  fontWeight: FontWeight.w400,
                                ),
                                suffixIcon: Icon(
                                  Icons.calendar_today_outlined,
                                  color: Apptheme.primaryColor,
                                  size: 20,
                                )),
                            validator: (val) {
                              print(val);
                              return null;
                            },
                            onSaved: (val) => print(val),
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          height: Apptheme.inputHeight,
                          child: InputField(
                            controller: emailController,
                            backgroundColor: Apptheme.secondaryColor,
                            hintTextColor: Apptheme.lightbuttonColor,
                            hintText: 'E-mail *',
                            autocorrect: false,
                            textCapitalization: false,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) =>
                                checkValidation(),
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          height: Apptheme.inputHeight,
                          child: InputField(
                            hintText: 'Password *',
                            backgroundColor: Apptheme.secondaryColor,
                            hintTextColor: Apptheme.lightbuttonColor,
                            suffixIconColor: Apptheme.lightbuttonColor,
                            controller: passwordController,
                            autocorrect: false,
                            textCapitalization: false,
                            isPassword: true,
                            onChanged: (value) =>
                                checkValidation(),
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          height: Apptheme.inputHeight + 20,
                          child: InputField(
                            controller: passwordConfirmController,
                            hintText: 'Confirm Password *',
                            backgroundColor: Apptheme.secondaryColor,
                            hintTextColor: Apptheme.lightbuttonColor,
                            suffixIconColor: Apptheme.lightbuttonColor,
                            isPassword: true,
                            autocorrect: false,
                            textCapitalization: false,
                            onChanged: (value) => checkValidation(),
                            validator: (value) {
                              if (value != passwordController.text) {
                                return 'Please enter same Password';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 30),
                        Container(
                          width: Apptheme.btnWidth,
                          height: Apptheme.btnHeight,
                          child: OutlinedButton(
                            onPressed: () async {
                              if (isValid) {
                                await createAccount();
                              }
                            },
                            child: loading
                                ?
                            SizedBox(
                              child: CircularProgressIndicator(strokeWidth: 1, color: Colors.white,),
                              height: 20.0,
                              width: 20.0,
                            )
                                :
                            Text('Sign Up',
                                style: TextStyle(
                                    color: Apptheme.backgroundColor ,fontSize: Apptheme.normalTextSize)),
                            style: OutlinedButton.styleFrom(
                              shape: StadiumBorder(),
                              backgroundColor: (isValid)
                                  ? Apptheme.primaryColor
                                  : Apptheme.lightbuttonColor,
                              side: BorderSide(
                                  color: (isValid)
                                      ? Apptheme.primaryColor
                                      : Apptheme.lightbuttonColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height / 20),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "I have an account. ",
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
                  SizedBox(height: size.height * 0.1),
                ],
              ),
            )
        ),
      ),
    );
  }
}
