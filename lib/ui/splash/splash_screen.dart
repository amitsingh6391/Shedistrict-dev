import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:delayed_widget/delayed_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shedistrict/models/user.dart';
import 'package:shedistrict/providers/filters/filter_provider.dart';
import 'package:shedistrict/providers/tab_provider.dart';
import 'package:shedistrict/storage.dart';
import 'package:shedistrict/stores/auth_store.dart';
import 'package:shedistrict/stores/filter_store.dart';
import 'package:shedistrict/ui/core/app_logo.dart';
import 'package:shedistrict/ui/routes/routes.gr.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  double _height = 200.0;
  double _width = 200.0;
  bool shouldShowContainer = false;
  bool selected = false;
  String uid = "";
  // late Widget futureWidget;

  Storage storage = Storage();
  AuthStore authStore = AuthStore();
  FilterStore filterStore = FilterStore();

  @override
  void initState() {
    super.initState();
    checkIfLoggedIn();
  }

  Future<void> checkIfLoggedIn() async{
     final currentUser = FirebaseAuth.instance.currentUser;
     print(currentUser);
     if(currentUser == null) {
       await storage.set('user', {});
       await storage.set('uid', '');
       await initUser();
     }
     else{
       await initUser();
     }
  }


  Future<void> initUser() async {
    final userId = await storage.get('uid');
    final u = await storage.get('user');
    setState(() {
      uid = userId;
    });

    // AutoRouter.of(context).replace(ShowYourFavPictureScreen());

    await Future.delayed(const Duration(milliseconds: 500));
    // AutoRouter.of(context).replace(VerifyYourSelfScreen());
    if(userId!= "" && (u['phone'] == "" || u['phone']  == null)){
      AutoRouter.of(context).replace(SignupPhoneVerficationScreen());
    }
    else if(userId!= "" && (u['picture'] == "" || u['picture']  == null ) && (u['video'] == "" || u['video'] == null) ) {
      AutoRouter.of(context).replace(VerifyYourSelfScreen());
    }
    else if((u['picture'] != "" && u['picture']  != null ) || (u['video'] != "" && u['video'] != null)){
      context.read(tabprovider).updateBottomTab(0);
      authStore.currentUser = u;
      authStore.uid = userId;
      final userFilters = await filterStore.getCurrentFilters(userId);
      final users = await filterStore.getUsers(userFilters);
      print('users $users');

      context.read(filterProvider).updateUserFilters(userFilters);
      context.read(filterProvider).updateUsers(users);

      AutoRouter.of(context).replace(HomeScreen());
    }

  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      if(uid == "") {
        setState(() {
          _width = 200;
          _height = 200;
          selected = true;
        });
      }
    });



    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: <Widget>[
              AnimatedPositioned(
                  width: selected ? _width : 250.0,
                  height: selected ? _height : 250.0,
                  top: selected ? (((size.height - 200) / 2) - 150) : (size.height - 250) / 2,
                  left: selected ? (size.width - 200) / 2 : (size.width - 250) / 2,
                  duration: const Duration(seconds: 2),
                  curve: Curves.fastOutSlowIn,
                  child: Applogo(height: selected ? _height : 250.0, width: selected ? _width : 250.0)
              ),
              AnimatedPositioned(
                width: size.width,
                top: selected ? ((size.height - 200) / 2 + 100) : size.height,
                duration: const Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                child: Column(
                  children: [
                    Container(
                      width: Apptheme.btnWidth,
                      height: Apptheme.btnHeight,
                      child: OutlinedButton(
                        onPressed: () {
                          AutoRouter.of(context).push(SignupScreen());
                        },
                        child: Text('Sign Up',
                            style: Apptheme(context).normalText.copyWith(
                                color: Apptheme.primaryColor,
                                fontWeight: FontWeight.w400,
                                fontSize: Apptheme.normalTextSize
                            )
                          // TextStyle(color: Apptheme.primaryColor),
                        ),
                        style: OutlinedButton.styleFrom(
                          shape: StadiumBorder(),
                          side: BorderSide(color: Apptheme.primaryColor),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: Apptheme.btnWidth,
                      height: Apptheme.btnHeight,
                      child: OutlinedButton(
                        onPressed: () {
                          AutoRouter.of(context).push(LoginOptionScreen());
                        },
                        child: Text('Log In',
                            style: Apptheme(context).normalText.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: Apptheme.normalTextSize
                            )),
                        style: OutlinedButton.styleFrom(
                          shape: StadiumBorder(),
                          backgroundColor: Apptheme.primaryColor,
                          side: BorderSide(color: Apptheme.primaryColor),
                        ),
                      ),
                    ),
                    SizedBox(height: 65),
                    InkWell(
                      onTap: () {
                        AutoRouter.of(context).push(WhyJoinUsScreen());
                      },
                      child: Text(
                        "Why Join Us?",
                        style: Apptheme(context).boldText.copyWith(
                          color: Apptheme.primaryColor,
                          fontSize: Apptheme.labelTextSize,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
      ),
    );
  }
}
