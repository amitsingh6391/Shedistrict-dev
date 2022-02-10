import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import 'package:shedistrict/providers/auth/signup/signup_provider.dart';
import 'package:shedistrict/providers/prefrences/prefrences_provider.dart';
import 'package:shedistrict/providers/tab_provider.dart';
import 'package:shedistrict/services/auth/signup/signup_services.dart';
import 'package:shedistrict/storage.dart';
import 'package:shedistrict/ui/core/she_app_bar.dart';

import 'package:shedistrict/ui/routes/routes.gr.dart';
import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';
import 'package:shedistrict/utlis/constants/constants.dart';
import 'widgets/profile_menu_tile.dart';

class ProfileScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    Size size = MediaQuery.of(context).size;
    final isNeedSafeArea = MediaQuery.of(context).viewPadding.top > 20;
    final signUpWatcher = watch(signUpProvider);
    final prefrenceWatcher = watch(prefrencesProvider);
    final tabwatcher = watch(tabprovider);
    Storage storage = Storage();


    Future<void> logout() async {
      await storage.delete('uid');
      await storage.delete('user');
      AutoRouter.of(context).replace(
        SplashScreen(),
      );
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: isNeedSafeArea ? 50 : 30),
                  SheAppBar(
                      titleColor: Apptheme.assentColor2,
                      hasBackAction: false,
                      actions: [
                      ],
                      title: "Profile"
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Apptheme.eventCardColorlight,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(
                                      ceoDp,
                                    ),
                                    radius: 25,
                                  ),
                                ),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 20),
                                      Row(
                                        children: [
                                          Text(
                                            "Liily Rose",
                                            style: Apptheme(context).boldText.copyWith(
                                              fontSize: 17,
                                            ),
                                          ),
                                          Spacer(),
                                          IconButton(
                                            onPressed: () {
                                              AutoRouter.of(context).push(
                                                EditProfileScreen(),
                                              );
                                            },
                                            icon: Icon(
                                              Icons.edit_outlined,
                                              size: 25,
                                              color: Apptheme.assentColor2,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                AutoRouter.of(context).push(
                                  YourInfoScreen(),
                                );
                              },
                              child: ProfileMenuTile(
                                icon: Icons.supervisor_account,
                                title: "Your Info",
                              ),
                            ),
                            // ProfileMenuTile(
                            //   icon: Icons.info_outline_rounded,
                            //   title: "Help + FAQ",
                            // ),
                            InkWell(
                              onTap: () {
                                AutoRouter.of(context).push(
                                  SettingsScreen(),
                                );
                              },
                              child: ProfileMenuTile(
                                icon: Icons.settings_outlined,
                                title: "Settings",
                              ),
                            ),
                            // ProfileMenuTile(
                            //   icon: Icons.info_outline_rounded,
                            //   title: "Help + FAQ",
                            // ),
                            InkWell(
                              onTap: ()  async {
                                await signUpWatcher.resetForm();
                                await prefrenceWatcher.resetImages();
                                await logout();
                              },
                              child: ProfileMenuTile(
                                icon: Icons.logout,
                                title: "Log Out",
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ]
            )
        )
    );

    // return Padding(
    //   padding: EdgeInsets.only(top: 44, left: 20, right: 20),
    //   child: Container(
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text(
    //           "Profile",
    //           style: Apptheme(context).boldText.copyWith(
    //                 color: Apptheme.assentColor2,
    //                 fontSize: 26,
    //               ),
    //         ),
    //         SizedBox(height: 15,),
    //         Padding(
    //           padding: EdgeInsets.all(0),
    //           child: Container(
    //             decoration: BoxDecoration(
    //               color: Apptheme.eventCardColorlight,
    //               borderRadius: BorderRadius.circular(20.0),
    //             ),
    //             child: Row(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Padding(
    //                   padding: const EdgeInsets.all(20.0),
    //                   child: CircleAvatar(
    //                     backgroundImage: AssetImage(
    //                       ceoDp,
    //                     ),
    //                     radius: 25,
    //                   ),
    //                 ),
    //                 Flexible(
    //                   child: Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       SizedBox(height: 20),
    //                       Row(
    //                         children: [
    //                           Text(
    //                             "Liily Rose",
    //                             style: Apptheme(context).boldText.copyWith(
    //                                   fontSize: 17,
    //                                 ),
    //                           ),
    //                           Spacer(),
    //                           IconButton(
    //                             onPressed: () {
    //                               AutoRouter.of(context).push(
    //                                 EditProfileScreen(),
    //                               );
    //                             },
    //                             icon: Icon(
    //                               Icons.edit_outlined,
    //                               size: 25,
    //                               color: Apptheme.assentColor2,
    //                             ),
    //                           )
    //                         ],
    //                       ),
    //                       // Text(
    //                       //   "liily5061@gmail.com",
    //                       //   style: Apptheme(context).lightText.copyWith(
    //                       //         fontSize: 12,
    //                       //       ),
    //                       // ),
    //                       // SizedBox(height: 20),
    //                     ],
    //                   ),
    //                 ),
    //                 // Spacer(),
    //               ],
    //             ),
    //           ),
    //         ),
    //         SizedBox(height: 20),
    //
    //         Column(
    //           children: [
    //             InkWell(
    //               onTap: () {
    //                 AutoRouter.of(context).push(
    //                   SettingsScreen(),
    //                 );
    //               },
    //               child: ProfileMenuTile(
    //                 icon: Icons.settings_outlined,
    //                 title: "Settings",
    //               ),
    //             ),
    //             ProfileMenuTile(
    //               icon: Icons.info_outline_rounded,
    //               title: "Help + FAQ",
    //             ),
    //             InkWell(
    //               onTap: () {
    //                 AutoRouter.of(context).replace(
    //                   WelcomeScreen(),
    //                 );
    //               },
    //               child: ProfileMenuTile(
    //                 icon: Icons.logout,
    //                 title: "Log Out",
    //               ),
    //             )
    //           ],
    //         )
    //
    //         // InkWell(
    //         //   onTap: () {
    //         //     AutoRouter.of(context).push(
    //         //       SettingsScreen(),
    //         //     );
    //         //   },
    //         //   child: ProfileMenuTile(
    //         //     icon: Icons.settings_outlined,
    //         //     title: "Settings",
    //         //   ),
    //         // ),
    //         // ProfileMenuTile(
    //         //   icon: Icons.info_outline_rounded,
    //         //   title: "Help + FAQ",
    //         // ),
    //         // InkWell(
    //         //   onTap: () {
    //         //     AutoRouter.of(context).replace(
    //         //       WelcomeScreen(),
    //         //     );
    //         //   },
    //         //   child: ProfileMenuTile(
    //         //     icon: Icons.logout,
    //         //     title: "Log Out",
    //         //   ),
    //         // )
    //       ],
    //     ),
    //   ),
    // );
  }
}
