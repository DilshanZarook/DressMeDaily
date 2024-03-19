import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:DressMeDaily/core/app_export.dart';
import 'package:DressMeDaily/presentation/Bookmark_page/bookmark_page.dart';
import 'package:DressMeDaily/presentation/Landing_page/landing_page.dart';
import 'package:DressMeDaily/presentation/User_profile/user_profile.dart';
import 'package:DressMeDaily/widgets/app_bar/appbar_subtitle.dart';
import 'package:DressMeDaily/widgets/app_bar/custom_app_bar.dart';

class Notice_page extends StatelessWidget {
  const Notice_page({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          horizontal: 7.h,
          vertical: 33.v,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 340.h,
              margin: EdgeInsets.symmetric(horizontal: 10.h),
              child: Text(
                "Greetings!, This is the initial stage of our application. (Version 1.0)",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.bodyLarge16,
              ),
            ),
            SizedBox(height: 15.v),
            Container(
              width: 286.h,
              margin: EdgeInsets.symmetric(horizontal: 10.h),
              child: Text(
                "There are multiple features which are being added in the future of our application. Stay tuned~",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles.bodyMediumGray70002,
              ),
            ),
            SizedBox(height: 5.v),
          ],
        ),
      ),

    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 70.v,
      centerTitle: true,
      title: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 100.h),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20.v),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(
                          context); // Navigate back to the previous screen
                    },
                    child: Container(
                      margin:
                          EdgeInsets.only(bottom: 20.v, right: 0.h, left: 15.v),
                      // Adjust the margin as needed
                      child: SvgPicture.asset(
                        ImageConstant.imgArrowDown,
                        // Make sure this points to the correct SVG asset
                        height: 25.v,
                        width: 25.h,
                      ),
                    ),
                  ),
                ),
                AppbarSubtitle(
                  text: "Notice",
                  margin: EdgeInsets.only(left: 100.h),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: double.maxFinite,
              child: Divider(
                color: theme.colorScheme.primary.withOpacity(1),
              ),
            ),
          ),
        ],
      ),
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
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Bookmark_page()),
                  );
                },
                child: SizedBox(
                  height: 30.v,
                  width: 30.h,
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
                    MaterialPageRoute(builder: (context) => Bookmark_page()),
                  );
                },
                child: SizedBox(
                  height: 30.v,
                  width: 30.h,
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
                  width: 30.h,
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
