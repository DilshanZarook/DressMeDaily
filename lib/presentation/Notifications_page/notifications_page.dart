import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:DressMeDaily/core/app_export.dart';
import 'package:DressMeDaily/new_file/addtowardrobe_screen.dart';
import 'package:DressMeDaily/presentation/Bookmark_page/bookmark_page.dart';
import 'package:DressMeDaily/presentation/Landing_page/landing_page.dart';
import 'package:DressMeDaily/presentation/Main_wardrobe/Main_wardrobe.dart';
import 'package:DressMeDaily/presentation/Searchbar_page/Searchbar_page.dart';
import 'package:DressMeDaily/presentation/User_profile/user_profile.dart';
import 'package:DressMeDaily/widgets/app_bar/appbar_subtitle_three.dart';
import 'package:DressMeDaily/widgets/app_bar/custom_app_bar.dart';
import 'package:DressMeDaily/widgets/custom_switch.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: camel_case_types
class Notifications_page extends StatefulWidget {
  const Notifications_page({Key? key})
      : super(
    key: key,
  );

  @override
  // ignore: library_private_types_in_public_api
  _Notifications_pageState createState() => _Notifications_pageState();
}

// ignore: camel_case_types
class _Notifications_pageState extends State<Notifications_page> {
  bool isSelectedSwitch = false;

  bool isSelectedSwitch1 = false;

  bool isSelectedSwitch2 = false;
  final String userName = 'Dilshan zarook';//need to be changed

  @override
  void initState() {
    super.initState();
    saveNotiStatus(userName);
  }

  Future<void> saveNotiStatus(
      String userName) async {
    // Save the notification status
    final firesstore = FirebaseFirestore.instance;
    await firesstore.collection('notification status').add({
      'userName': userName,
      'calendarNotificationAccess': isSelectedSwitch,
      'applicationUpdatesEnabled': isSelectedSwitch1,
      'fashionTrendUpdatesEnabled': isSelectedSwitch2,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.only(
          left: 21.h,
          top: 81.v,
          right: 21.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Calendar notification access",
              style: theme.textTheme.bodyLarge,
            ),
            SizedBox(height: 19.v),
            _buildCalendarNotificationAccess(context),
            SizedBox(height: 39.v),
            Text(
              "Application updates",
              style: theme.textTheme.bodyLarge,
            ),
            SizedBox(height: 17.v),
            _buildApplicationUpdates(context),
            SizedBox(height: 46.v),
            Text(
              "Fashion trend updates",
              style: theme.textTheme.bodyLarge,
            ),
            SizedBox(height: 19.v),
            _buildFashionTrendUpdates(context),
            SizedBox(height: 5.v),
          ],
        ),
      ),

    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 66.v,
      centerTitle: true,
      title: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 0.h),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context,
                        '/main_settings');
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 5.v, right: 10.h, left: 15.v),
                    child: SvgPicture.asset(
                      ImageConstant.imgArrowDown,
                      height: 25.v,
                      width: 25.h,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: 75.h, top: 5.v, bottom: 1.v, right: 1.v),
                  child: Text(
                    "Settings",
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 65.h,
                    top: 0.v,
                    bottom: 0.v,
                  ),   child: TextButton( // Change to TextButton
                  onPressed: () {
                    // Call function to save notification status
                    saveNotiStatus('John Doe'); // Replace with the user's name
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(fontSize: 18.0,color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
                )
              ],
            ),
          ),
          SizedBox(height: 15.v),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(width: double.maxFinite, child: Divider()),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildCalendarNotificationAccess(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 273.h,
          child: Text(
            "Allow to remind you for your daily outfits",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: CustomTextStyles.bodyLargeGray50001.copyWith(fontSize: 20.0),
          ),
        ),
        CustomSwitch(
          margin: EdgeInsets.symmetric(vertical: 3.v), // Make sure 'v' is defined or replace with actual value
          value: isSelectedSwitch1,
          onChange: (value) {
            setState(() {
              isSelectedSwitch1 = value; // Update the state when the switch is tapped
            });
          },
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildApplicationUpdates(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Email",
          style: CustomTextStyles.bodyLargeGray50001
              .copyWith(fontSize: 20.0), // Changed fontSize to a double
        ),
        CustomSwitch(
          margin: EdgeInsets.symmetric(vertical: 3.v), // Make sure 'v' is defined or replace with actual value
          value: isSelectedSwitch2,
          onChange: (value) {
            setState(() {
              isSelectedSwitch2 = value; // Update the state when the switch is tapped
            });
          },
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildFashionTrendUpdates(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Email",
          style: CustomTextStyles.bodyLargeGray50001
              .copyWith(fontSize: 20.0), // Changed fontSize to a double
        ),
        CustomSwitch(
          margin: EdgeInsets.symmetric(vertical: 3.v), // Make sure 'v' is defined or replace with actual value
          value: isSelectedSwitch,
          onChange: (value) {
            setState(() {
              isSelectedSwitch = value; // Update the state when the switch is tapped
            });
          },
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 0.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 360.h,
            height: 1.h,
            child: Divider(
              color: appTheme.black900,
              thickness: 4.h,
            ),
          ),
          SizedBox(height: 16.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image button 1
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LandingPage()),
                  );
                },
                child: SizedBox(
                  height: 30.v,
                  width: 30.h,
                  child: Image.asset(
                    ImageConstant.home_footer,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Image button 2
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Searchbar_page()),
                  );
                },
                child: SizedBox(
                  height: 30.v,
                  width: 21.h,
                  child: Image.asset(
                    ImageConstant.bookmark_footer,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddtowardrobeScreen()),
                  );
                },
                child: SizedBox(
                  height: 30.v,
                  width: 21.h,
                  child: Image.asset(
                    ImageConstant.camera_footer,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Main_wardrobe(

                    )),
                  );
                },
                child: SizedBox(
                  height: 30.v,
                  width: 21.h,
                  child: Image.asset(
                    ImageConstant.wardrobe_footer,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  User_profile()),
                  );
                },
                child: SizedBox(
                  height: 30.v,
                  width: 21.h,
                  child: Image.asset(
                    ImageConstant.profile_footer,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Add more buttons if needed
            ],
          ),
          SizedBox(height: 10.v),
        ],
      ),
    );
  }
}