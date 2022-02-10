import 'package:flutter/cupertino.dart';

class UserDp extends StatelessWidget {
  final double height;
  final double width;

  final String image;

  UserDp({
    required this.height,
    required this.width,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Image(
        image: AssetImage(image),
      ),
    );
  }
}
