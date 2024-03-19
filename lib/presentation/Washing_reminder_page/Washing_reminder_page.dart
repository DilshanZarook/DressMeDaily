import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:DressMeDaily/core/app_export.dart';
import 'package:DressMeDaily/presentation/Bookmark_page/bookmark_page.dart';
import 'package:DressMeDaily/presentation/Landing_page/landing_page.dart';
import 'package:DressMeDaily/presentation/Main_wardrobe/Main_wardrobe.dart';
import 'package:DressMeDaily/presentation/User_profile/user_profile.dart';
import 'package:DressMeDaily/presentation/new_file/addtowardrobe_screen.dart';
import 'package:DressMeDaily/widgets/app_bar/appbar_title.dart';
import 'package:DressMeDaily/widgets/app_bar/appbar_trailing_image.dart';
import 'package:DressMeDaily/widgets/app_bar/custom_app_bar.dart';
import 'package:DressMeDaily/widgets/custom_outlined_button.dart';

import 'widgets/thirtyseven_item_widget.dart';

// ignore_for_file: must_be_immutable
class Washing_reminder_page extends StatelessWidget {
  const Washing_reminder_page({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SizedBox(
        width: SizeUtils.width,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 0.h,
              vertical: 23.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // CustomOutlinedButton(
                //   height: 38.v,
                //   width: 199.h,
                //   text: "Search",
                //   buttonStyle: CustomButtonStyles.outlineBlackTL19,
                //   buttonTextStyle: theme.textTheme.headlineSmall!,
                //   alignment: Alignment.center,
                // ),
                SizedBox(height: 30.v),
                Divider(
                  color: appTheme.black900,
                ),
                SizedBox(height: 28.v),
                Padding(
                  padding: EdgeInsets.only(left: 13.h),
                  child: Text(
                    "Notification",
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
                SizedBox(height: 10.v),
                Container(
                  child: SvgPicture.asset(
                    ImageConstant.imgFrame1042,
                    height: 5.v,
                    width: 200.h,
                  ),
                  margin: EdgeInsets.only(left: 13.h),
                ),
                SizedBox(height: 40.v),
                _buildThirtySeven(context),
                SizedBox(height: 87.v),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:
          _buildBottomBar(context), // Fixed footer at the bottom
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: AppbarTitle(
        text: "DMD",
        margin: EdgeInsets.only(left: 31.h),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgMegaphone,
          margin: EdgeInsets.fromLTRB(36.h, 4.v, 36.h, 3.v),
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
              color: appTheme.black990,
              thickness: 2.h,
            ),
          ),
          SizedBox(height: 16.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // Adjusted for even spacing
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image button 1
              InkWell(
                onTap: () {
                  // Navigate to the corresponding screen for imgUser1
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const LandingPage()), // Replace with your actual screen widget
                  );
                },
                child: SvgPicture.asset(
                  ImageConstant.Home_footer_Unselected_101,
                  height: 35.v, // Adjust the height as needed
                  width: 35.v, // Adjust the width as needed
                  fit: BoxFit.cover,
                ),
              ),
              // Image button 2
              InkWell(
                onTap: () {
                  // Navigate to the corresponding screen for imgFrame373
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Bookmark_page()), // Replace with your actual screen widget
                  );
                },
                child: SvgPicture.asset(
                  ImageConstant.Search_footer,
                  height: 35.v, // Adjust the height as needed
                  width: 35.v, // Adjust the width as needed
                  fit: BoxFit.cover,
                ),
              ),
              InkWell(
                onTap: () {
                  // Navigate to the corresponding screen for imgFrame373
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const AddtowardrobeScreen()), // Replace with your actual screen widget
                  );
                },
                child: SvgPicture.asset(
                  ImageConstant.Camera_footer_101,
                  height: 30.v, // Adjust the height as needed
                  width: 30.v, // Adjust the width as needed
                  fit: BoxFit.cover,
                ),
              ),
              InkWell(
                onTap: () {
                  // Navigate to the corresponding screen for imgFrame373
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Main_wardrobe()), // Replace with your actual screen widget
                  );
                },
                child: SvgPicture.asset(
                  ImageConstant.Wardrobe_selected_footer_101,
                  height: 32.v, // Adjust the height as needed
                  width: 32.v, // Adjust the width as needed
                  fit: BoxFit.cover,
                ),
              ),
              InkWell(
                onTap: () {
                  // Navigate to the corresponding screen for imgFrame373
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                             User_profile()), // Replace with your actual screen widget
                  );
                },
                child: SvgPicture.asset(
                  ImageConstant.User_Footer_Unselected_101,
                  height: 35.v, // Adjust the height as needed
                  width: 35.v, // Adjust the width as needed
                  fit: BoxFit.cover,
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

  /// Section Widget
  Widget _buildThirtySeven(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (
        context,
        index,
      ) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0.v, horizontal: 120.v),
          child: SizedBox(
            width: double.maxFinite,
            child: Divider(
              height: 1.v,
              thickness: 1.v,
              color: appTheme.black900,
            ),
          ),
        );
      },
      itemCount: 4,
      itemBuilder: (context, index) {
        return ThirtysevenItemWidget();
      },
    );
  }
}
