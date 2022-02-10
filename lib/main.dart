import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:injectable/injectable.dart';
import 'package:shedistrict/injection.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';

import 'ui/core/app_widget.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Apptheme.secondaryColor,
    systemNavigationBarColor: Apptheme.backgroundColor,
  ));

  WidgetsFlutterBinding.ensureInitialized();

  configureInjection(Environment.prod);

  //  we are using firebase for backend so that we have to intialized first

  final _initialization = await Firebase.initializeApp();
  print(_initialization);

//we are using riverpod for state management in our project so that when our project will run then
// we have to provide "PROVIDERSCOPE" in our root widget;
//   runApp(ProviderScope(
//     // child: AppWidget(),
//     child: DevicePreview(
//       enabled: false,
//       builder: (BuildContext context) {
//         return AppWidget();
//       },
//     ),
//   )
//     // Wrap your app
//   );
  runApp(ProviderScope(
    child: AppWidget(),
    // child: DevicePreview(
    //   enabled: false,
    //   builder: (BuildContext context) {
    //     return AppWidget();
    //   },
    // ),
  )
    // Wrap your app
  );
}
