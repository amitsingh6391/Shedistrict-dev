import 'package:another_xlider/another_xlider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:searchfield/searchfield.dart';
import 'package:shedistrict/ui/core/custom_dropdown.dart';
import 'package:shedistrict/ui/core/custom_popup_menu.dart';
import 'package:shedistrict/ui/core/custum_dropdown_button.dart';
import 'package:shedistrict/ui/core/preferance_button.dart';
import 'package:shedistrict/ui/core/preferance_options.dart';
import 'package:shedistrict/ui/core/she_app_bar.dart';

import 'package:shedistrict/ui/theme/apptheme.dart';
import 'package:shedistrict/utlis/constants/app_icons.dart';
import 'package:shedistrict/utlis/constants/asset_path.dart';
import 'package:shedistrict/utlis/constants/constants.dart';

class YourInfoScreen extends StatefulWidget {
  @override
  _YourInfoScreenState createState() => _YourInfoScreenState();
}

class _YourInfoScreenState extends State<YourInfoScreen> {
  bool isAgeVisible = false;
  bool isDistanceVisible = false;
  bool isNationalityVisible = false;
  bool isLocationVisible = false;
  var options = {};
  var _selectedTest;
  var selectedOptions  = {};
  var visibleState = {};
  final _searchController = TextEditingController();


  void optionsSelected(name, value) {
    setState(() {
      selectedOptions[name] = value;
      this.selectedOptions = {...selectedOptions};
      print('selected option, $selectedOptions');
    });
  }

  void setVisible(name){
    visibleState[name] = visibleState[name] != null ? !visibleState[name] : true;

    setState(() {
      this.visibleState = {...visibleState};
    });
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final isNeedSafeArea = MediaQuery.of(context).viewPadding.top > 20;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: isNeedSafeArea ? 50 : 30),
                  SheAppBar(
                      titleColor: Apptheme.eventsColor,
                      hasBackAction: true,
                      actions: [],
                      title: "Your Info"
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap:(){
                            setState(() {
                              this.isAgeVisible = !this.isAgeVisible;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 6, bottom: 6),
                            decoration: BoxDecoration(
                                color: Color(0xffedeefd),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 20, right : 20),
                                  height: Apptheme.btnHeight,
                                  decoration: BoxDecoration(
                                    color:Color(0xffedeefd),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Age - You can't change this", style: TextStyle(fontSize: Apptheme.normalTextSize)),
                                      this.isAgeVisible
                                          ?
                                      Icon(FeatherIcons.chevronUp, size: 25, color: Apptheme.eventsColor)
                                          :
                                      Icon(FeatherIcons.chevronDown, size: 25, color: Apptheme.eventsColor)
                                    ],
                                  ),
                                ),
                                this.isAgeVisible
                                    ?
                                Container(
                                  transform: Matrix4.translationValues(0.0, -10.0, 0.0),
                                  padding: const EdgeInsets.only(left: 10, right : 10),
                                  decoration: BoxDecoration(
                                    color: Color(0xffedeefd),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: FlutterSlider(
                                    tooltip: FlutterSliderTooltip(
                                        format: (String value) {
                                          return value.split('.')[0];
                                        }
                                    ),
                                    handler: FlutterSliderHandler(
                                      decoration: BoxDecoration(),
                                      disabled: true,
                                      child: Material(
                                        type: MaterialType.canvas,
                                        elevation: 0,
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                            color: Apptheme.eventsColor,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    rightHandler: FlutterSliderHandler(
                                      decoration: BoxDecoration(),
                                      child: Material(
                                        type: MaterialType.canvas,
                                        elevation: 0,
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                            color: Apptheme.eventsColor,
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                    ),
                                    values: [16, 60],
                                    rangeSlider: true,
                                    max: 80,
                                    min: 1,
                                    trackBar: FlutterSliderTrackBar(
                                      activeTrackBar: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                    ),
                                    onDragging: (handlerIndex, lowerValue, upperValue) {
                                      // // setState(() {});
                                    },
                                  ),
                                )
                                    :
                                SizedBox()
                              ],
                            ),
                          ),
                        ),
                        PreferanceButton(
                          options: [
                            'Black',
                            'Hispanic/Latin',
                            'White',
                            "Asian",
                            'Middle Eastern',
                            'Multiracial',
                          ],
                          color: Color(0xffedeefd),
                          iconColor:  Apptheme.eventsColor,
                          hintText: "Ethnicity",
                          name: "ethnicity",
                          isVisible: visibleState["ethnicity"] != null ?  visibleState["ethnicity"] : false,
                          selected: this.selectedOptions["ethnicity"] != null ? this.selectedOptions["ethnicity"] : "Black",
                          onChanged: this.optionsSelected,
                          onVisible: this.setVisible,
                        ),

                        GestureDetector(
                          onTap:(){
                            setState(() {
                              this.isNationalityVisible = !this.isNationalityVisible;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 6, bottom: 6),
                            decoration: BoxDecoration(
                                color: Color(0xffedeefd),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 20, right : 20),
                                  height: Apptheme.btnHeight,
                                  decoration: BoxDecoration(
                                    color: Color(0xffedeefd),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Nationality", style: TextStyle(fontSize: Apptheme.normalTextSize)),
                                      this.isNationalityVisible
                                          ?
                                      Icon(FeatherIcons.chevronUp, size: 25, color: Apptheme.eventsColor)
                                          :
                                      Icon(FeatherIcons.chevronDown, size: 25, color: Apptheme.eventsColor)
                                    ],
                                  ),
                                ),
                                this.isNationalityVisible
                                    ?
                                Container(
                                  transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                  padding: const EdgeInsets.only(left: 10, right : 10, bottom: 10),
                                  decoration: BoxDecoration(
                                    color: Color(0xffedeefd),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      SearchField(
                                        controller: _searchController,
                                        suggestions: [
                                          'American',
                                          'British',
                                          'Indian',
                                          'Australian',
                                          "Italian"
                                        ],
                                        hint: 'Search',
                                        hasOverlay: false,
                                        searchStyle: TextStyle(
                                          fontSize: Apptheme.normalTextSize,
                                        ),
                                        searchInputDecoration: new InputDecoration(
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 0,
                                              style: BorderStyle.none,
                                            ),
                                            borderRadius: BorderRadius.circular(20.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              width: 0,
                                              style: BorderStyle.none,
                                            ),
                                            borderRadius: BorderRadius.circular(20.0),
                                          ),
                                          filled: true,
                                          contentPadding: EdgeInsets.only(bottom: 0.0, top: 0.0, left: 20.0, right: 20.0),
                                        ),
                                        maxSuggestionsInViewPort: 6,
                                        itemHeight: 40,
                                        suggestionItemDecoration: BoxDecoration(
                                          border: Border.all(
                                            width: 0, //                   <--- border width here
                                          ),
                                        ),
                                        suggestionsDecoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow:[
                                            BoxShadow(
                                              color: Color.fromRGBO(0, 0, 0, 0.1),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                          borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(10.0),
                                            bottomLeft: Radius.circular(10.0),
                                          ),
                                        ),
                                        onTap: (x) {
                                          print(x);
                                        },
                                      ),
                                      Positioned(
                                        right: 15,
                                        top: 10,
                                        child: Icon(FeatherIcons.search),
                                      )
                                    ],
                                  ),
                                )
                                    :
                                SizedBox()
                              ],
                            ),
                          ),
                        ),

                        PreferanceButton(
                          options: [
                            'Agnostic',
                            'Atheist',
                            'Buddhist',
                            'Christian',
                            'Hindu',
                            'Jain',
                            'Jewish',
                            'Muslim',
                            'Zoroastrian',
                            'Sikh',
                            'Spiritual',
                            'Other'
                          ],
                          color: Color(0xffedeefd),
                          iconColor:  Apptheme.eventsColor,
                          hintText: "Religion",
                          name: "religion",
                          isVisible: visibleState["religion"] != null ?  visibleState["religion"] : false,
                          selected: this.selectedOptions["religion"] != null ? this.selectedOptions["religion"] : "Agnostic",
                          onChanged: this.optionsSelected,
                          onVisible: this.setVisible,
                        ),
                        GestureDetector(
                          onTap:(){
                            setState(() {
                              this.isLocationVisible = !this.isLocationVisible;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 6, bottom: 6),
                            decoration: BoxDecoration(
                                color: Color(0xffedeefd),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(left: 20, right : 20),
                                  height: Apptheme.btnHeight,
                                  decoration: BoxDecoration(
                                    color: Color(0xffedeefd),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Location (zip code)", style: TextStyle(fontSize: Apptheme.normalTextSize)),
                                      this.isLocationVisible
                                          ?
                                      Icon(FeatherIcons.chevronUp, size: 25, color: Apptheme.eventsColor)
                                          :
                                      Icon(FeatherIcons.chevronDown, size: 25, color: Apptheme.eventsColor)
                                    ],
                                  ),
                                ),
                                this.isLocationVisible
                                    ?
                                Container(
                                  transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                  padding: const EdgeInsets.only(left: 10, right : 10, bottom: 10),
                                  decoration: BoxDecoration(
                                    color: Color(0xffedeefd),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: TextField(
                                    style: Apptheme(context).normalText.copyWith(
                                      fontSize: Apptheme.normalTextSize,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    // keyboardType: TextInputType.number,
                                    cursorColor: Color.fromRGBO(128, 141, 241, 1),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding: EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                        borderSide: BorderSide(
                                          width: 0,
                                          color: Apptheme.backgroundColor,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                          borderSide:
                                          BorderSide(width: 0, color: Apptheme.backgroundColor)),
                                    ),
                                  ),
                                )
                                    :
                                SizedBox()
                              ],
                            ),
                          ),
                        ),

                        PreferanceButton(
                          options: [
                            'In High School',
                            'Graduated HS',
                            'Dropped out of HS',
                            'Trade/Tech School',
                            'In college',
                            'Dropped out of college',
                            'Graduated college',
                            'In graduate school',
                            'Graduated post-graduate',
                            'Dropped out of graduate school',
                            'Taking a break'
                          ],
                          color: Color(0xffedeefd),
                          iconColor:  Apptheme.eventsColor,
                          hintText: "Education",
                          name: "education",
                          isVisible: visibleState["education"] != null ?  visibleState["education"] : false,
                          selected: this.selectedOptions["education"] != null ? this.selectedOptions["education"] : "In High School",
                          onChanged: this.optionsSelected,
                          onVisible: this.setVisible,
                        ),
                        PreferanceButton(
                          options: [
                            'Single',
                            'In a relationship',
                            'Married',
                            'Engaged',
                            'Widowed'
                          ],
                          color: Color(0xffedeefd),
                          iconColor:  Apptheme.eventsColor,
                          hintText: "Relationship Status",
                          name: "relationship",
                          isVisible: visibleState["relationship"] != null ?  visibleState["relationship"] : false,
                          selected: this.selectedOptions["relationship"] != null ? this.selectedOptions["relationship"] : "Single",
                          onChanged: this.optionsSelected,
                          onVisible: this.setVisible,
                        ),
                        PreferanceButton(
                          options: [
                            'Straight',
                            'Lesbian',
                            "Bisexual",
                            'Queer',
                            'Asexual',
                            'Unsure',
                            'Other'
                          ],
                          color: Color(0xffedeefd),
                          iconColor:  Apptheme.eventsColor,
                          hintText: "Sexual Orientation",
                          name: "orientation",
                          isVisible: visibleState["orientation"] != null ?  visibleState["orientation"] : false,
                          selected: this.selectedOptions["orientation"] != null ? this.selectedOptions["orientation"] : "Straight",
                          onChanged: this.optionsSelected,
                          onVisible: this.setVisible,
                        ),
                        PreferanceButton(
                          options: [
                            'Yes',
                            'No',
                            'Angel mom'
                          ],
                          color: Color(0xffedeefd),
                          iconColor:  Apptheme.eventsColor,
                          hintText: "Have kids?",
                          name: "kids",
                          isVisible: visibleState["kids"] != null ?  visibleState["kids"] : false,
                          selected: this.selectedOptions["kids"] != null ? this.selectedOptions["kids"] : "Yes",
                          onChanged: this.optionsSelected,
                          onVisible: this.setVisible,
                        ),
                        PreferanceButton(
                          options: [
                            'Often',
                            'Socially',
                            'Occasionally',
                            'Only under stress',
                            'Never',
                            'Rarely',
                            'Trying to quit'
                          ],
                          color: Color(0xffedeefd),
                          iconColor:  Apptheme.eventsColor,
                          hintText:  "Drinking Habits?",
                          name: "drinking",
                          isVisible: visibleState["drinking"] != null ?  visibleState["drinking"] : false,
                          selected: this.selectedOptions["drinking"] != null ? this.selectedOptions["drinking"] : "Often",
                          onChanged: this.optionsSelected,
                          onVisible: this.setVisible,
                        ),
                        PreferanceButton(
                          options: [
                            'Often',
                            'Socially',
                            'Occasionally',
                            'Only under stress',
                            'Never',
                            'Rarely',
                            'Trying to quit'
                          ],
                          color: Color(0xffedeefd),
                          iconColor:  Apptheme.eventsColor,
                          hintText: "Smoking Habits?",
                          name: "smoking",
                          isVisible: visibleState["smoking"] != null ?  visibleState["smoking"] : false,
                          selected: this.selectedOptions["smoking"] != null ? this.selectedOptions["smoking"] : "Often",
                          onChanged: this.optionsSelected,
                          onVisible: this.setVisible,
                        ),
                        PreferanceButton(
                          options: [
                            "Democrat",
                            'Republican',
                            "Libertarian",
                            'Independent',
                            'No affiliation',
                            'Other'
                          ],
                          color: Color(0xffedeefd),
                          iconColor:  Apptheme.eventsColor,
                          hintText: "Political Affiliation",
                          name: "political",
                          isVisible: visibleState["political"] != null ?  visibleState["political"] : false,
                          selected: this.selectedOptions["political"] != null ? this.selectedOptions["political"] : "Democrat",
                          onChanged: this.optionsSelected,
                          onVisible: this.setVisible,
                        ),
                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            height: Apptheme.btnHeight,
                            width: Apptheme.btnWidth,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Apptheme.eventbuttonColorlight,
                              border: Border.all(
                                color: Apptheme.eventbuttonColorlight,
                                width: 0,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Save",
                                style: TextStyle(
                                    color: Apptheme.backgroundColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                      ],
                    ),
                  )
                ]
            )
        )
    );

    // return Scaffold(
    //   body: Padding(
    //     padding: EdgeInsets.only(
    //       // left: 16,
    //       // right: 16,
    //       top: 44,
    //     ),
    //     child: SingleChildScrollView(
    //       physics: BouncingScrollPhysics(),
    //       child: Column(
    //         children: [
    //           Row(
    //             children: [
    //               IconButton(
    //                 onPressed: () {
    //                   AutoRouter.of(context).pop();
    //                 },
    //                 icon: back,
    //               ),
    //               Text(
    //                 "Preferences",
    //                 style: Apptheme(context).boldText.copyWith(
    //                       fontSize: 26,
    //                       color: Apptheme.filterColor,
    //                     ),
    //               )
    //             ],
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.all(0),
    //             child: Text(
    //               "Choose some filters for better matches!",
    //               style: Apptheme(context).normalText.copyWith(
    //                     fontSize: 17,
    //                     color: Apptheme.filterColor,
    //                   ),
    //             ),
    //           ),
    //           SizedBox(height: 20),
    //           Padding(
    //             padding: EdgeInsets.only(
    //               left: 16,
    //               right: 16,
    //             ),
    //             child: Column(
    //               children: [
    //                 GestureDetector(
    //                   onTap:(){
    //                     setState(() {
    //                       this.isAgeVisible = !this.isAgeVisible;
    //                     });
    //                   },
    //                   child: Container(
    //                     margin: const EdgeInsets.only(top: 6, bottom: 6),
    //                     decoration: BoxDecoration(
    //                         color: Apptheme.eventCardColor,
    //                         borderRadius: BorderRadius.circular(20)),
    //                     child: Column(
    //                       children: [
    //                         Container(
    //                           padding: const EdgeInsets.only(left: 20, right : 20),
    //                           height: Apptheme.btnHeight,
    //                           decoration: BoxDecoration(
    //                             color: Apptheme.eventCardColor,
    //                             borderRadius: BorderRadius.circular(20),
    //                           ),
    //                           child: Row(
    //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                             children: [
    //                               Text("Age", style: TextStyle(fontSize: Apptheme.normalTextSize)),
    //                               this.isAgeVisible
    //                                   ?
    //                               Icon(FeatherIcons.chevronUp, size: 25, color: Apptheme.eventsColor)
    //                                   :
    //                               Icon(FeatherIcons.chevronDown, size: 25, color: Apptheme.eventsColor)
    //                             ],
    //                           ),
    //                         ),
    //                         this.isAgeVisible
    //                             ?
    //                         Container(
    //                           transform: Matrix4.translationValues(0.0, -10.0, 0.0),
    //                           padding: const EdgeInsets.only(left: 10, right : 10),
    //                           decoration: BoxDecoration(
    //                             color: Apptheme.eventCardColor,
    //                             borderRadius: BorderRadius.only(
    //                               bottomLeft: Radius.circular(20),
    //                               bottomRight: Radius.circular(20),
    //                             ),
    //                           ),
    //                           child: FlutterSlider(
    //                             handler: FlutterSliderHandler(
    //                               decoration: BoxDecoration(),
    //                               child: Material(
    //                                 type: MaterialType.canvas,
    //                                 elevation: 0,
    //                                 child: Container(
    //                                   padding: EdgeInsets.all(5),
    //                                   width: 10,
    //                                   height: 10,
    //                                   decoration: BoxDecoration(
    //                                     color: Apptheme.filterColor,
    //                                     borderRadius: BorderRadius.circular(10),
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //                             rightHandler: FlutterSliderHandler(
    //                               decoration: BoxDecoration(),
    //                               child: Material(
    //                                 type: MaterialType.canvas,
    //                                 elevation: 0,
    //                                 child: Container(
    //                                   padding: EdgeInsets.all(5),
    //                                   width: 10,
    //                                   height: 10,
    //                                   decoration: BoxDecoration(
    //                                     color: Apptheme.filterColor,
    //                                     borderRadius: BorderRadius.circular(10),
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //                             values: [16, 80],
    //                             rangeSlider: true,
    //                             max: 80,
    //                             min: 16,
    //                             trackBar: FlutterSliderTrackBar(
    //                               activeTrackBar: BoxDecoration(
    //                                 color: Colors.white,
    //                               ),
    //                             ),
    //                             onDragging: (handlerIndex, lowerValue, upperValue) {
    //                               // // setState(() {});
    //                             },
    //                           ),
    //                         )
    //                             :
    //                         SizedBox()
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //                 PreferanceButton(
    //                   options: [
    //                     'Black',
    //                     'Hispanic/Latin',
    //                     'White',
    //                     "Asian",
    //                     'Middle Eastern',
    //                     'Multiracial',
    //                     'Other',
    //                   ],
    //                   hintText: "Ethnicity",
    //                   name: "ethnicity",
    //                   isVisible: visibleState["ethnicity"] != null ?  visibleState["ethnicity"] : false,
    //                   selected: this.selectedOptions["ethnicity"] != null ? this.selectedOptions["ethnicity"] : "Black",
    //                   onChanged: this.optionsSelected,
    //                   onVisible: this.setVisible,
    //                 ),
    //
    //                 GestureDetector(
    //                   onTap:(){
    //                     setState(() {
    //                       this.isNationalityVisible = !this.isNationalityVisible;
    //                     });
    //                   },
    //                   child: Container(
    //                     margin: const EdgeInsets.only(top: 6, bottom: 6),
    //                     decoration: BoxDecoration(
    //                         color: Apptheme.eventCardColor,
    //                         borderRadius: BorderRadius.circular(20)),
    //                     child: Column(
    //                       children: [
    //                         Container(
    //                           padding: const EdgeInsets.only(left: 20, right : 20),
    //                           height: Apptheme.btnHeight,
    //                           decoration: BoxDecoration(
    //                             color: Apptheme.eventCardColor,
    //                             borderRadius: BorderRadius.circular(20),
    //                           ),
    //                           child: Row(
    //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                             children: [
    //                               Text("Nationality", style: TextStyle(fontSize: Apptheme.normalTextSize)),
    //                               this.isNationalityVisible
    //                                   ?
    //                               Icon(FeatherIcons.chevronUp, size: 25, color: Apptheme.eventsColor)
    //                                   :
    //                               Icon(FeatherIcons.chevronDown, size: 25, color: Apptheme.eventsColor)
    //                             ],
    //                           ),
    //                         ),
    //                         this.isNationalityVisible
    //                             ?
    //                         Container(
    //                           transform: Matrix4.translationValues(0.0, 0.0, 0.0),
    //                           padding: const EdgeInsets.only(left: 10, right : 10, bottom: 10),
    //                           decoration: BoxDecoration(
    //                             color: Apptheme.eventCardColor,
    //                             borderRadius: BorderRadius.only(
    //                               bottomLeft: Radius.circular(20),
    //                               bottomRight: Radius.circular(20),
    //                             ),
    //                           ),
    //                           child: Stack(
    //                             children: [
    //                               SearchField(
    //                                 controller: _searchController,
    //                                 suggestions: [
    //                                   'American',
    //                                   'British',
    //                                   'Indian',
    //                                   'Australian',
    //                                   "Italian"
    //                                 ],
    //                                 hint: 'Search',
    //                                 hasOverlay: false,
    //                                 searchStyle: TextStyle(
    //                                   fontSize: Apptheme.normalTextSize,
    //                                 ),
    //                                 searchInputDecoration: new InputDecoration(
    //                                   fillColor: Colors.white,
    //                                   border: OutlineInputBorder(
    //                                     borderSide: BorderSide(
    //                                       width: 0,
    //                                       style: BorderStyle.none,
    //                                     ),
    //                                     borderRadius: BorderRadius.circular(20.0),
    //                                   ),
    //                                   focusedBorder: OutlineInputBorder(
    //                                     borderSide: BorderSide(
    //                                       width: 0,
    //                                       style: BorderStyle.none,
    //                                     ),
    //                                     borderRadius: BorderRadius.circular(20.0),
    //                                   ),
    //                                   filled: true,
    //                                   contentPadding: EdgeInsets.only(bottom: 0.0, top: 0.0, left: 20.0, right: 20.0),
    //                                 ),
    //                                 maxSuggestionsInViewPort: 6,
    //                                 itemHeight: 40,
    //                                 suggestionItemDecoration: BoxDecoration(
    //                                   border: Border.all(
    //                                     width: 0, //                   <--- border width here
    //                                   ),
    //                                 ),
    //                                 suggestionsDecoration: BoxDecoration(
    //                                   color: Colors.white,
    //                                   boxShadow:[
    //                                     BoxShadow(
    //                                       color: Color.fromRGBO(0, 0, 0, 0.1),
    //                                       spreadRadius: 5,
    //                                       blurRadius: 7,
    //                                       offset: Offset(0, 3),
    //                                     ),
    //                                   ],
    //                                   borderRadius: BorderRadius.only(
    //                                     bottomRight: Radius.circular(10.0),
    //                                     bottomLeft: Radius.circular(10.0),
    //                                   ),
    //                                 ),
    //                                 onTap: (x) {
    //                                   print(x);
    //                                 },
    //                               ),
    //                               Positioned(
    //                                 right: 15,
    //                                 top: 10,
    //                                 child: Icon(FeatherIcons.search),
    //                               )
    //                             ],
    //                           ),
    //                         )
    //                             :
    //                         SizedBox()
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //
    //                 PreferanceButton(
    //                   options: [
    //                     'Hindu',
    //                     'Muslim',
    //                   ],
    //                   hintText: "Religion",
    //                   name: "religion",
    //                   isVisible: visibleState["religion"] != null ?  visibleState["religion"] : false,
    //                   selected: this.selectedOptions["religion"] != null ? this.selectedOptions["religion"] : "Hindu",
    //                   onChanged: this.optionsSelected,
    //                   onVisible: this.setVisible,
    //                 ),
    //
    //                 GestureDetector(
    //                   onTap:(){
    //                     setState(() {
    //                       this.isDistanceVisible = !this.isDistanceVisible;
    //                     });
    //                   },
    //                   child: Container(
    //                     margin: const EdgeInsets.only(top: 6, bottom: 6),
    //                     decoration: BoxDecoration(
    //                         color: Apptheme.eventCardColor,
    //                         borderRadius: BorderRadius.circular(20)),
    //                     child: Column(
    //                       children: [
    //                         Container(
    //                           padding: const EdgeInsets.only(left: 20, right : 20),
    //                           height: Apptheme.btnHeight,
    //                           decoration: BoxDecoration(
    //                             color: Apptheme.eventCardColor,
    //                             borderRadius: BorderRadius.circular(20),
    //                           ),
    //                           child: Row(
    //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                             children: [
    //                               Text("Distance", style: TextStyle(fontSize: Apptheme.normalTextSize)),
    //                               this.isDistanceVisible
    //                                   ?
    //                               Icon(FeatherIcons.chevronUp, size: 25, color: Apptheme.eventsColor)
    //                                   :
    //                               Icon(FeatherIcons.chevronDown, size: 25, color: Apptheme.eventsColor)
    //                             ],
    //                           ),
    //                         ),
    //                         this.isDistanceVisible
    //                             ?
    //                         Container(
    //                           transform: Matrix4.translationValues(0.0, -10.0, 0.0),
    //                           padding: const EdgeInsets.only(left: 10, right : 10),
    //                           decoration: BoxDecoration(
    //                             color: Apptheme.eventCardColor,
    //                             borderRadius: BorderRadius.only(
    //                               bottomLeft: Radius.circular(20),
    //                               bottomRight: Radius.circular(20),
    //                             ),
    //                           ),
    //                           child: FlutterSlider(
    //                             tooltip: FlutterSliderTooltip(
    //                                 format: (String value) {
    //                                   return value == "100.0" ? "Anywhere" : value;
    //                                 }
    //                             ),
    //                             handler: FlutterSliderHandler(
    //                               decoration: BoxDecoration(),
    //                               child: Material(
    //                                 type: MaterialType.canvas,
    //                                 elevation: 0,
    //                                 child: Container(
    //                                   padding: EdgeInsets.all(5),
    //                                   width: 10,
    //                                   height: 10,
    //                                   decoration: BoxDecoration(
    //                                     color: Apptheme.filterColor,
    //                                     borderRadius: BorderRadius.circular(10),
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //                             rightHandler: FlutterSliderHandler(
    //                               decoration: BoxDecoration(),
    //                               child: Material(
    //                                 type: MaterialType.canvas,
    //                                 elevation: 0,
    //                                 child: Container(
    //                                   padding: EdgeInsets.all(5),
    //                                   width: 10,
    //                                   height: 10,
    //                                   decoration: BoxDecoration(
    //                                     color: Apptheme.filterColor,
    //                                     borderRadius: BorderRadius.circular(10),
    //                                   ),
    //                                 ),
    //                               ),
    //                             ),
    //                             values: [1, 100],
    //                             rangeSlider: true,
    //                             max: 100,
    //                             min: 1,
    //                             trackBar: FlutterSliderTrackBar(
    //                               activeTrackBar: BoxDecoration(
    //                                 color: Colors.white,
    //                               ),
    //                             ),
    //                             onDragging: (handlerIndex, lowerValue, upperValue) {
    //                               // // setState(() {});
    //                             },
    //                           ),
    //                         )
    //                             :
    //                         SizedBox()
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //                 PreferanceButton(
    //                   options: [
    //                     'Single',
    //                     'Coupled',
    //                     'Married',
    //                   ],
    //                   hintText: "Relationship Status",
    //                   name: "relationship",
    //                   isVisible: visibleState["relationship"] != null ?  visibleState["relationship"] : false,
    //                   selected: this.selectedOptions["relationship"] != null ? this.selectedOptions["relationship"] : "Single",
    //                   onChanged: this.optionsSelected,
    //                   onVisible: this.setVisible,
    //                 ),
    //                 PreferanceButton(
    //                   options: [
    //                     'Male',
    //                     'Female',
    //                     "Other",
    //                   ],
    //                   hintText: "Sexual Orientation",
    //                   name: "orientation",
    //                   isVisible: visibleState["orientation"] != null ?  visibleState["orientation"] : false,
    //                   selected: this.selectedOptions["orientation"] != null ? this.selectedOptions["orientation"] : "Male",
    //                   onChanged: this.optionsSelected,
    //                   onVisible: this.setVisible,
    //                 ),
    //                 PreferanceButton(
    //                   options: [
    //                     'Yes',
    //                     'No',
    //                   ],
    //                   hintText: "Have kids?",
    //                   name: "kids",
    //                   isVisible: visibleState["kids"] != null ?  visibleState["kids"] : false,
    //                   selected: this.selectedOptions["kids"] != null ? this.selectedOptions["kids"] : "No",
    //                   onChanged: this.optionsSelected,
    //                   onVisible: this.setVisible,
    //                 ),
    //                 PreferanceButton(
    //                   options: [
    //                     'Yes',
    //                     'No',
    //                   ],
    //                   hintText:  "Drinking Habits?",
    //                   name: "drinking",
    //                   isVisible: visibleState["drinking"] != null ?  visibleState["drinking"] : false,
    //                   selected: this.selectedOptions["drinking"] != null ? this.selectedOptions["drinking"] : "No",
    //                   onChanged: this.optionsSelected,
    //                   onVisible: this.setVisible,
    //                 ),
    //                 PreferanceButton(
    //                   options: [
    //                     'Yes',
    //                     'No',
    //                   ],
    //                   hintText: "Smoking Habits?",
    //                   name: "smoking",
    //                   isVisible: visibleState["smoking"] != null ?  visibleState["smoking"] : false,
    //                   selected: this.selectedOptions["smoking"] != null ? this.selectedOptions["smoking"] : "No",
    //                   onChanged: this.optionsSelected,
    //                   onVisible: this.setVisible,
    //                 ),
    //                 PreferanceButton(
    //                   options: [
    //                     "Others"
    //                     'Congress',
    //                     "BJp",
    //                   ],
    //                   hintText: "Political Affiliation",
    //                   name: "political",
    //                   isVisible: visibleState["political"] != null ?  visibleState["political"] : false,
    //                   selected: this.selectedOptions["political"] != null ? this.selectedOptions["political"] : "Others",
    //                   onChanged: this.optionsSelected,
    //                   onVisible: this.setVisible,
    //                 ),
    //                 SizedBox(height: 20),
    //                 GestureDetector(
    //                   onTap: () {
    //                     Navigator.of(context).pop();
    //                   },
    //                   child: Container(
    //                     height: Apptheme.btnHeight,
    //                     width: Apptheme.btnWidth,
    //                     decoration: BoxDecoration(
    //                       borderRadius: BorderRadius.circular(30),
    //                       color: Color(0xffAFF6D5),
    //                       border: Border.all(
    //                         color: Color(0xffAFF6D5),
    //                         width: 2,
    //                       ),
    //                     ),
    //                     child: Center(
    //                       child: Text(
    //                         "Save",
    //                         style: TextStyle(
    //                             color: Apptheme.backgroundColor,
    //                             fontSize: 16,
    //                             fontWeight: FontWeight.w400),
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //                 SizedBox(height: 40),
    //               ],
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );

  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
