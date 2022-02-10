import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shedistrict/ui/routes/routes.gr.dart';

class SignupBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            GestureDetector(
              child: Container(
                width: 37,
                height: 37,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(37),
                    color: Colors.transparent
                ),
                child: Align(
                  alignment: Alignment.center, // Align however you like (i.e .centerRight, centerLeft)
                  child: Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 17,
                      color: Color.fromRGBO(128, 141, 241, 1),) ,
                  ),
                ),
              ),
              onTap: () {
                AutoRouter.of(context).replace(SplashScreen());
              },
            ),
            Expanded(
                child: Container(
                  height: 3,
                  color: Colors.transparent,
                )
            ),
            Container(
                height: 120,
                width: 120,
                child: Image(
                  image: AssetImage(
                    "assets/images/applogo.png",
                  ),
                  fit: BoxFit.fill,
                )
            ),
            Expanded(
                child: Container(
                  height: 3,
                  color: Colors.transparent,
                )
            ),
            Container(
              width: 37,
              height: 37,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}