import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shedistrict/storage.dart';
import 'package:shedistrict/stores/user_store.dart';

import 'package:shedistrict/ui/core/custum_textfield.dart';
import 'package:shedistrict/ui/core/rounded_button.dart';
import 'package:shedistrict/ui/routes/routes.gr.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/constants.dart';

// ignore: must_be_immutable
class UpdateAboutMeScreen extends StatefulWidget {
  @override
  _UpdateAboutMeScreenState createState() => _UpdateAboutMeScreenState();
}

class _UpdateAboutMeScreenState extends State<UpdateAboutMeScreen> {
  TextEditingController aboutMe = TextEditingController();
  TextEditingController lookingFor = TextEditingController();
  bool isValidInput = false;
  UserStore userStore = UserStore();
  Storage storage = Storage();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    void validateInput() {
      if(aboutMe.text.length > 0 && lookingFor.text.length > 0){
        setState(() {
          isValidInput = true;
        });
      }
      else{
        setState(() {
          isValidInput = false;
        });
      }
    }

    Future<void> updateAboutUser() async {
      if(!isValidInput) {
        return;
      }

      final uid = await storage.get('uid');
      final user = await storage.get('user');
      user['aboutMe'] = aboutMe.text;
      user['lookingFor'] = lookingFor.text;
      await userStore.updateProfile(uid, user);

      AutoRouter.of(context).replace(HomeScreen());
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: leftPadding,
            right: rightpadding,
            top: topPadding1,
          ),
          child: Column(
            children: [
              Center(
                child: Image(
                  height: 32,
                  image: AssetImage(
                    "assets/images/shedistricttext.png",
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.1 / 2,
              ),
              Row(
                children: [
                  Text(
                    "About me",
                    style: Apptheme(context).boldText.copyWith(
                        color: Apptheme.primaryColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                    )
                  ),
                ],
              ),
              SizedBox(height: 20),
              InputField(
                controller: aboutMe,
                hintText: 'Tell others about yourself in 30-100 \nwords....',
                backgroundColor: Apptheme.secondaryColor,
                hintTextColor: Apptheme.lightbuttonColor,
                onChanged: (value) {
                  validateInput();
                },
                maxLines: 7,
              ),
              SizedBox(height: size.height * 0.04),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "I'm looking for:  ",
                  style: Apptheme(context).boldText.copyWith(
                      color: Apptheme.primaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
              SizedBox(height: 20),
              InputField(
                controller: lookingFor,
                hintText:
                    'Describe what kind of connections\n you are looking to make...',
                backgroundColor: Apptheme.secondaryColor,
                hintTextColor: Apptheme.lightbuttonColor,
                maxLines: 7,
                onChanged: (value) {
                  validateInput();
                },
              ),
              SizedBox(height: size.height * 0.13),
              Container(
                width: Apptheme.btnWidth,
                height: Apptheme.btnHeight,
                child: OutlinedButton(
                  onPressed: () async {
                    await updateAboutUser();
                  },
                  child: Text('Continue',
                      style: Apptheme(context).boldText.copyWith(color: Apptheme.backgroundColor, fontSize: Apptheme.normalTextSize)),
                  style: OutlinedButton.styleFrom(
                    shape: StadiumBorder(),
                    backgroundColor:(isValidInput)
                      ? Apptheme.primaryColor
                      : Apptheme.lightbuttonColor,
                    side: BorderSide(color: (isValidInput)
                        ? Apptheme.primaryColor
                        : Apptheme.lightbuttonColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
