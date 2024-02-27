import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/widgets/app_bar/appbar_subtitle.dart';
import 'package:sdgp_test01/widgets/app_bar/appbar_title_image.dart';
import 'package:sdgp_test01/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Frame638Screen extends StatelessWidget {
  const Frame638Screen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: Column(
        children: [
          SizedBox(height: 20.v,),
          Padding(
            padding: EdgeInsets.only(right: 120.h),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // Navigate back when tapped
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10.v, right: 10.h,left:15.v), // Adjust the margin as needed
                    child: SvgPicture.asset(
                      ImageConstant.imgArrowDown, // Replace with your SVG asset path
                      height: 25.v,
                      width: 25.h,
                    ),
                  ),
                ),
                AppbarSubtitle(
                  text: "Notice",
                  margin: EdgeInsets.only(left: 85.h),
                ),
              ],
            ),
          ),
          SizedBox(height: 25.v),
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
      styleType: Style.bgFill_2,
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Divider(
              color: appTheme.gray80001,
            ),
          ),
          SizedBox(height: 16.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgUser,
                height: 35.v,
                width: 32.h,
                margin: EdgeInsets.only(bottom: 12.v),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgFrame373,
                height: 47.v,
                width: 239.h,
                margin: EdgeInsets.only(left: 32.h),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
