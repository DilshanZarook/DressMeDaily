import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/new_file/addtowardrobe_screen.dart';
import 'package:sdgp_test01/presentation/Bookmark_page/bookmark_page.dart';
import 'package:sdgp_test01/presentation/Landing_page/landing_page.dart';
import 'package:sdgp_test01/presentation/Main_wardrobe/Main_wardrobe.dart';
import 'package:sdgp_test01/presentation/User_profile/user_profile.dart';
import 'package:sdgp_test01/widgets/app_bar/appbar_subtitle.dart';
import 'package:sdgp_test01/widgets/app_bar/custom_app_bar.dart';
import 'package:sdgp_test01/widgets/custom_drop_down.dart';

class FAQ_Page extends StatelessWidget {
  const FAQ_Page({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 54.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomDropDown(
              icon: Container(
                margin: EdgeInsets.fromLTRB(30.h, 8.v, 11.h, 8.v),
                child: SizedBox(
                  height: 33.v,
                  width: 25.h,
                  child: Image.asset(
                    ImageConstant.imgCheckmarkGray90001,
                    color: Colors.black,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              hintText: "What is DressMeDaily ?",
              contentPadding: EdgeInsets.only(
                left: 11.h,
                top: 17.v,
                bottom: 17.v,
              ),
              onChanged: (value) {},
            ),
            SizedBox(height: 15.v),
            CustomDropDown(
              icon: Container(
                margin: EdgeInsets.fromLTRB(30.h, 8.v, 11.h, 8.v),
                child: SizedBox(
                  height: 33.v,
                  width: 25.h,
                  child: Image.asset(
                    ImageConstant.imgCheckmarkGray90001,
                    color: Colors.black,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              hintText: "What is DressMeDaily ?",
              contentPadding: EdgeInsets.only(
                left: 11.h,
                top: 17.v,
                bottom: 17.v,
              ),
              onChanged: (value) {},
            ),
            SizedBox(height: 15.v),
            CustomDropDown(
              icon: Container(
                margin: EdgeInsets.fromLTRB(30.h, 8.v, 11.h, 8.v),
                child: SizedBox(
                  height: 33.v,
                  width: 25.h,
                  child: Image.asset(
                    ImageConstant.imgCheckmarkGray90001,
                    color: Colors.black,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              hintText: "What is DressMeDaily ?",
              contentPadding: EdgeInsets.only(
                left: 11.h,
                top: 17.v,
                bottom: 17.v,
              ),
              onChanged: (value) {},
            ),
            SizedBox(height: 15.v),
            CustomDropDown(
              icon: Container(
                margin: EdgeInsets.fromLTRB(30.h, 8.v, 11.h, 8.v),
                child: SizedBox(
                  height: 33.v,
                  width: 25.h,
                  child: Image.asset(
                    ImageConstant.imgCheckmarkGray90001,
                    color: Colors.black,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              hintText: "What is DressMeDaily ?",
              contentPadding: EdgeInsets.only(
                left: 11.h,
                top: 17.v,
                bottom: 17.v,
              ),
              onChanged: (value) {},
            ),
            SizedBox(height: 14.v),
            CustomDropDown(
              icon: Container(
                margin: EdgeInsets.fromLTRB(30.h, 8.v, 11.h, 8.v),
                child: SizedBox(
                  height: 33.v,
                  width: 25.h,
                  child: Image.asset(
                    ImageConstant.imgCheckmarkGray90001,
                    color: Colors.black,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              hintText: "What is DressMeDaily ?",
              contentPadding: EdgeInsets.only(
                left: 11.h,
                top: 17.v,
                bottom: 17.v,
              ),
              onChanged: (value) {},
            ),
            SizedBox(height: 15.v),
            CustomDropDown(
              icon: Container(
                margin: EdgeInsets.fromLTRB(30.h, 8.v, 11.h, 8.v),
                child: SizedBox(
                  height: 33.v,
                  width: 25.h,
                  child: Image.asset(
                    ImageConstant.imgCheckmarkGray90001,
                    color: Colors.black,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              hintText: "What is DressMeDaily ?",
              contentPadding: EdgeInsets.only(
                left: 11.h,
                top: 17.v,
                bottom: 17.v,
              ),
              onChanged: (value) {},
            ),
            SizedBox(height: 15.v),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.h,
                vertical: 7.v,
              ),
              decoration: AppDecoration.outlinePrimary5.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      width: 186.h,
                      margin: EdgeInsets.symmetric(vertical: 1.v),
                      child: Text(
                        "Can I use the application without an internet connection?",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                  ),
                  Container(
                    height: 33.v,
                    width: 25.h,
                    margin: EdgeInsets.only(left: 17.h),
                    child: Image.asset(
                      ImageConstant.imgCheckmarkGray90001,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.v),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.h,
                vertical: 7.v,
              ),
              decoration: AppDecoration.outlinePrimary5.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      width: 186.h,
                      margin: EdgeInsets.symmetric(vertical: 1.v),
                      child: Text(
                        "Can I use the application without an internet connection?",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                  ),
                  Container(
                    height: 33.v,
                    width: 25.h,
                    margin: EdgeInsets.only(left: 17.h),
                    child: Image.asset(
                      ImageConstant.imgCheckmarkGray90001,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
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
                  text: "FAQ",
                  margin: EdgeInsets.only(left: 110.h),
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
                    MaterialPageRoute(
                        builder: (context) => AddtowardrobeScreen()),
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
                    MaterialPageRoute(builder: (context) => Main_wardrobe()),
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
                        builder: (context) => const User_profile()),
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
