import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';

class RoundedBox extends StatelessWidget {
  final String? favpicPath;
  const RoundedBox({this.favpicPath});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.bottomRight,
      height: ((size.width - 70) / 2.2),
      width: ((size.width - 70) / 2.2),
      decoration: BoxDecoration(
        color: Apptheme.secondaryColor,
        border: Border.all(
          color: Apptheme.secondaryColor,
        ),
        borderRadius: BorderRadius.all(
          Radius.elliptical(20, 20),
        ),
      ),
      child: favpicPath == null
          ? SizedBox()
          : ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.elliptical(20, 20),
              ),
              child: Image.file(
                File(favpicPath!),
                fit: BoxFit.fill,
                height: 164,
                width: 162,
              ),
            ),
    );
  }
}




// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:shedistrict/ui/prefrences/widgets/device_permission_popup.dart';

// import 'package:shedistrict/ui/theme/apptheme.dart';

// import 'circleavatar.dart';

// class RoundedBox extends StatelessWidget {
//   final String? favpicPath;
//   const RoundedBox({this.favpicPath});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Stack(children: [
//       Container(
//         alignment: Alignment.bottomRight,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(
//             Radius.elliptical(20, 20),
//           ),
//         ),
//         child: ClipRRect(
//           borderRadius: BorderRadius.all(
//             Radius.elliptical(20, 20),
//           ),
//           child: Image.asset(
//             "assets/images/samplepic.png",
//             fit: BoxFit.cover,
//             height: 164,
//             width: 162,
//           ),
//         ),
//       ),
//       Positioned(
//         bottom: 0,
//         right: 0,
//         child: Row(
//           children: [
//             GestureDetector(
//               onTap: () {
//                 showGeneralDialog(
//                   barrierLabel: "Barrier",
//                   barrierDismissible: true,
//                   barrierColor: Colors.black.withOpacity(0.5),
//                   transitionDuration: Duration(milliseconds: 800),
//                   context: context,
//                   pageBuilder: (_, __, ___) {
//                     return DevicePermissionPopup(
//                       size: size,
//                       favPicno: "delte",
//                     );
//                   },
//                   transitionBuilder: (_, anim, __, child) {
//                     return SlideTransition(
//                       position: Tween(begin: Offset(1, 3), end: Offset(0, 0))
//                           .animate(anim),
//                       child: child,
//                     );
//                   },
//                 );
//               },
//               child: CustomCircleAvatar(
//                 icon: Icons.delete_outline,
//                 backgroundColor: Apptheme.assentColor2,
//               ),
//             ),
//             SizedBox(width: 10),
//             GestureDetector(
//               onTap: () {
//                 showGeneralDialog(
//                   barrierLabel: "Barrier",
//                   barrierDismissible: true,
//                   barrierColor: Colors.black.withOpacity(0.5),
//                   transitionDuration: Duration(milliseconds: 800),
//                   context: context,
//                   pageBuilder: (_, __, ___) {
//                     return DevicePermissionPopup(
//                       size: size,
//                       favPicno: "1pic",
//                     );
//                   },
//                   transitionBuilder: (_, anim, __, child) {
//                     return SlideTransition(
//                       position: Tween(begin: Offset(1, 3), end: Offset(0, 0))
//                           .animate(anim),
//                       child: child,
//                     );
//                   },
//                 );
//               },
//               child: CustomCircleAvatar(
//                 icon: Icons.edit_outlined,
//               ),
//             ),
//           ],
//         ),
//       )
//     ]);
//   }
// }
