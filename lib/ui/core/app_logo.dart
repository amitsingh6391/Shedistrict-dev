import 'package:flutter/cupertino.dart';

class Applogo extends StatelessWidget {
  final double height;
  final double width;

  Applogo({required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      // width: 200,
      height: height,
      width: width,
      child: Image(
        image: AssetImage(
          "assets/images/applogo.png",
        ),
        fit: BoxFit.fill,
      ),
    );
  }
}
