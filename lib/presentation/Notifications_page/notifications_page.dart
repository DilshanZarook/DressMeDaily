import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/presentation/Bookmark_page/bookmark_page.dart';
import 'package:sdgp_test01/presentation/Landing_page/landing_page.dart';
import 'package:sdgp_test01/presentation/User_profile/user_profile.dart';
import 'package:sdgp_test01/widgets/app_bar/appbar_subtitle_three.dart';
import 'package:sdgp_test01/widgets/app_bar/custom_app_bar.dart';
import 'package:sdgp_test01/widgets/custom_switch.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Notifications_page extends StatelessWidget {
  Notifications_page({Key? key})
      : super(
          key: key,
        );

  bool isSelectedSwitch = false;

  bool isSelectedSwitch1 = false;

  bool isSelectedSwitch2 = false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
        bottomNavigationBar: _buildBottomBar(context),

    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 13.h,
              right: 19.h,
            ),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20.v),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Navigate back to the previous screen
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 0.v, right: 0.h, left: 5.v), // Adjust the margin as needed
                      child: SvgPicture.asset(
                        ImageConstant.imgArrowDown, // Make sure this points to the correct SVG asset
                        height: 25.v,
                        width: 25.h,
                      ),
                    ),
                  ),
                ),

                AppbarSubtitleThree(
                  text: "Notifications",
                  margin: EdgeInsets.only(
                    left: 71.h,
                    top: 20.v,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 65.h,
                    top: 20.v,
                    bottom: 0.v,
                  ),
                  child: const Text(
                    "Save",
                    // You can add style to your text here if you want
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),

              ],
            ),
          ),
          SizedBox(height: 22.v),
          const SizedBox(
            width: double.maxFinite,
            child: Divider(),
          ),
        ],
      ),
      styleType: Style.bgFill_1,
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
          value: isSelectedSwitch,
          onChange: (value) {
            isSelectedSwitch = value;
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
          style: CustomTextStyles.bodyLargeGray50001.copyWith(fontSize: 20.0), // Changed fontSize to a double
        ),
        CustomSwitch(
          value: isSelectedSwitch2,
          onChange: (value) {
            isSelectedSwitch2 = value;
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
          style: CustomTextStyles.bodyLargeGray50001.copyWith(fontSize: 20.0), // Changed fontSize to a double
        ),
        CustomSwitch(
          value: isSelectedSwitch2,
          onChange: (value) {
            isSelectedSwitch2 = value;
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
                    MaterialPageRoute(builder: (context) => const LandingPage()),
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
                    MaterialPageRoute(builder: (context) => Bookmark_page()),
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
              ),InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Bookmark_page()),
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
              ),InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Bookmark_page()),
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
              ),InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const User_profile()),
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
