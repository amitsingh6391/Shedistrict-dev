import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shedistrict/providers/filters/filter_provider.dart';

import 'package:shedistrict/ui/core/custom_avartar.dart';
import 'package:shedistrict/ui/core/she_app_bar.dart';
import 'package:shedistrict/ui/routes/routes.gr.dart';

import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';
import 'package:shedistrict/utlis/constants/constants.dart';

class FilterResultsScreen extends ConsumerWidget{
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final filterWatcher = watch(filterProvider);
    return FilterResultsUI(users: filterWatcher.users);
  }
}

class FilterResultsUI extends StatefulWidget {
  final users;

  const FilterResultsUI({Key? key, this.users}) : super(key: key);

  @override
  _FilterResultsUIState createState() => _FilterResultsUIState();
}

class _FilterResultsUIState extends State<FilterResultsUI> {
  // bool _editPreference = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final isNeedSafeArea = MediaQuery.of(context).viewPadding.top > 20;

    List users = widget.users;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: isNeedSafeArea ? 50 : 30),
                  SheAppBar(
                      titleColor: Apptheme.filterColor,
                      hasBackAction: false,
                      actions: [
                        InkWell(
                            onTap: () {
                              AutoRouter.of(context).push(EditPreferencesScreen());
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 1),
                              child: Image(
                                image: AssetImage(filter),
                              ),
                            ),
                        ),
                        SizedBox(width: 10,)
                      ],
                      title: "Results based on your preferences"
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: widget.users.length > 0
                        ? Wrap(
                      children: users.map((user) =>  CustomAvartar(
                        size: (((size.width - 20) / 5) - 20) / 2,
                        user: user
                      )).toList()
                    )
                    :
                    Text('No users available for the selected filters.'),
                  )
                ]
            )
        )
    );
  }
}
