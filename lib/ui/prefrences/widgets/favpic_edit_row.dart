import 'package:flutter/material.dart';
import 'package:shedistrict/ui/core/circleavatar.dart';
import 'package:shedistrict/ui/prefrences/widgets/device_permission_popup.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';

class FavPic1RowEdit extends StatelessWidget {
  const FavPic1RowEdit({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: size.height > 570
                        ? size.height==736?size.height * .33:size.height * 0.31
                        : size.height * .32,
      
    
      left: size.width > 330 ? size.width * 0.2 : size.width * 0.1,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              showGeneralDialog(
                barrierLabel: "Barrier",
                barrierDismissible: true,
                barrierColor: Colors.black.withOpacity(0.5),
                transitionDuration: Duration(milliseconds: 800),
                context: context,
                pageBuilder: (_, __, ___) {
                  return DevicePermissionPopup(
                    size: size,
                    favPicno: "delte",
                  );
                },
                transitionBuilder: (_, anim, __, child) {
                  return SlideTransition(
                    position: Tween(begin: Offset(1, 3), end: Offset(0, 0))
                        .animate(anim),
                    child: child,
                  );
                },
              );
            },
            child: CustomCircleAvatar(
              icon: Icons.delete_outline,
              backgroundColor: Apptheme.assentColor2,
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              showGeneralDialog(
                barrierLabel: "Barrier",
                barrierDismissible: true,
                barrierColor: Colors.black.withOpacity(0.5),
                transitionDuration: Duration(milliseconds: 800),
                context: context,
                pageBuilder: (_, __, ___) {
                  return DevicePermissionPopup(
                    size: size,
                    favPicno: "1pic",
                  );
                },
                transitionBuilder: (_, anim, __, child) {
                  return SlideTransition(
                    position: Tween(begin: Offset(1, 3), end: Offset(0, 0))
                        .animate(anim),
                    child: child,
                  );
                },
              );
            },
            child: CustomCircleAvatar(
              icon: Icons.edit_outlined,
            ),
          ),
        ],
      ),
    );
  }
}

class FavPic2RowEdit extends StatelessWidget {
  const FavPic2RowEdit({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
     top: size.height > 570
                        ? size.height==736?size.height * .33:size.height * 0.31
                        : size.height * .32,
      left: size.width > 330 ? size.width * 0.63 : size.width * 0.55,
      // size.width * 0.63,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              showGeneralDialog(
                barrierLabel: "Barrier",
                barrierDismissible: true,
                barrierColor: Colors.black.withOpacity(0.5),
                transitionDuration: Duration(milliseconds: 800),
                context: context,
                pageBuilder: (_, __, ___) {
                  return DevicePermissionPopup(
                    size: size,
                    favPicno: "delete",
                  );
                },
                transitionBuilder: (_, anim, __, child) {
                  return SlideTransition(
                    position: Tween(begin: Offset(1, 3), end: Offset(0, 0))
                        .animate(anim),
                    child: child,
                  );
                },
              );
            },
            child: CustomCircleAvatar(
              icon: Icons.delete_outline,
              backgroundColor: Apptheme.assentColor2,
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              showGeneralDialog(
                barrierLabel: "Barrier",
                barrierDismissible: true,
                barrierColor: Colors.black.withOpacity(0.5),
                transitionDuration: Duration(milliseconds: 800),
                context: context,
                pageBuilder: (_, __, ___) {
                  return DevicePermissionPopup(
                    size: size,
                    favPicno: "2pic",
                  );
                },
                transitionBuilder: (_, anim, __, child) {
                  return SlideTransition(
                    position: Tween(begin: Offset(1, 3), end: Offset(0, 0))
                        .animate(anim),
                    child: child,
                  );
                },
              );
            },
            child: CustomCircleAvatar(
              icon: Icons.edit_outlined,
            ),
          ),
        ],
      ),
    );
  }
}

class FavPic3RowEdit extends StatelessWidget {
  const FavPic3RowEdit({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      // top: size.height > 570 ? size.height * 0.55 : size.height * 0.56,

         top: 

                size.height > 570
                        ? size.height==736? size.height *.56:size.height * 0.54
                      : size.height * 0.56,
      left: size.width > 330 ? size.width * 0.2 : size.width * 0.1,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              showGeneralDialog(
                barrierLabel: "Barrier",
                barrierDismissible: true,
                barrierColor: Colors.black.withOpacity(0.5),
                transitionDuration: Duration(milliseconds: 800),
                context: context,
                pageBuilder: (_, __, ___) {
                  return DevicePermissionPopup(
                    size: size,
                    favPicno: "delte",
                  );
                },
                transitionBuilder: (_, anim, __, child) {
                  return SlideTransition(
                    position: Tween(begin: Offset(1, 3), end: Offset(0, 0))
                        .animate(anim),
                    child: child,
                  );
                },
              );
            },
            child: CustomCircleAvatar(
              icon: Icons.delete_outline,
              backgroundColor: Apptheme.assentColor2,
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              showGeneralDialog(
                barrierLabel: "Barrier",
                barrierDismissible: true,
                barrierColor: Colors.black.withOpacity(0.5),
                transitionDuration: Duration(milliseconds: 800),
                context: context,
                pageBuilder: (_, __, ___) {
                  return DevicePermissionPopup(
                    size: size,
                    favPicno: "2pic",
                  );
                },
                transitionBuilder: (_, anim, __, child) {
                  return SlideTransition(
                    position: Tween(begin: Offset(1, 3), end: Offset(0, 0))
                        .animate(anim),
                    child: child,
                  );
                },
              );
            },
            child: CustomCircleAvatar(
              icon: Icons.edit_outlined,
            ),
          ),
        ],
      ),
    );
  }
}

class FavPic4RowEdit extends StatelessWidget {
  const FavPic4RowEdit({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
     top: 

                size.height > 570
                        ? size.height==736? size.height *.56:size.height * 0.54
                      : size.height * 0.56,
      left: size.width > 330 ? size.width * 0.63 : size.width * 0.55,
      // size.width * 0.63,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              showGeneralDialog(
                barrierLabel: "Barrier",
                barrierDismissible: true,
                barrierColor: Colors.black.withOpacity(0.5),
                transitionDuration: Duration(milliseconds: 800),
                context: context,
                pageBuilder: (_, __, ___) {
                  return DevicePermissionPopup(
                    size: size,
                    favPicno: "delete",
                  );
                },
                transitionBuilder: (_, anim, __, child) {
                  return SlideTransition(
                    position: Tween(begin: Offset(1, 3), end: Offset(0, 0))
                        .animate(anim),
                    child: child,
                  );
                },
              );
            },
            child: CustomCircleAvatar(
              icon: Icons.delete_outline,
              backgroundColor: Apptheme.assentColor2,
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              showGeneralDialog(
                barrierLabel: "Barrier",
                barrierDismissible: true,
                barrierColor: Colors.black.withOpacity(0.5),
                transitionDuration: Duration(milliseconds: 800),
                context: context,
                pageBuilder: (_, __, ___) {
                  return DevicePermissionPopup(
                    size: size,
                    favPicno: "4pic",
                  );
                },
                transitionBuilder: (_, anim, __, child) {
                  return SlideTransition(
                    position: Tween(begin: Offset(1, 3), end: Offset(0, 0))
                        .animate(anim),
                    child: child,
                  );
                },
              );
            },
            child: CustomCircleAvatar(
              icon: Icons.edit_outlined,
            ),
          ),
        ],
      ),
    );
  }
}
