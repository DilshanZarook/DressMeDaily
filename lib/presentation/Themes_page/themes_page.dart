import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/widgets/app_bar/appbar_subtitle_four.dart';
import 'package:sdgp_test01/widgets/app_bar/custom_app_bar.dart';
import 'package:sdgp_test01/widgets/custom_radio_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sdgp_test01/presentation/Bookmark_page/bookmark_page.dart';
import 'package:sdgp_test01/presentation/User_profile/user_profile.dart';
import 'package:sdgp_test01/presentation/Landing_page/landing_page.dart';


class Themes_page extends StatefulWidget {
  const Themes_page({Key? key}) : super(key: key);

  @override
  _Themes_pageState createState() => _Themes_pageState();
}

class _Themes_pageState extends State<Themes_page> {
  String radioGroup = "lbl_light_mode"; // Initial group value
  List<String> radioList = ["lbl_light_mode", "lbl_dark_mode"]; // List of radio button values

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 7.v),
          child: Column(
            children: [
              SizedBox(height: 84.v),
              _buildRadioGroup(context),
              const Spacer(),
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
            padding: EdgeInsets.only(right: 120.h),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // Navigate back when tapped
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10.v, right: 10.h,left:25.v), // Adjust the margin as needed
                    child: SvgPicture.asset(
                      ImageConstant.imgArrowDown, // Replace with your SVG asset path
                      height: 25.v,
                      width: 25.h,
                    ),
                  ),
                ),
                AppbarSubtitleFour(
                  text: "Themes",
                  margin: EdgeInsets.only(
                    left: 80.h,
                    top: 15.v,
                    bottom: 7.v,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: 360.h,
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
  Widget _buildRadioGroup(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 42.h),
      child: Column(
        children: [
          CustomRadioButton(
            width: 275.h,
            text: "Light Mode",
            value: radioList[0],
            groupValue: radioGroup,
            isRightCheck: true,
            onChange: (value) {
              setState(() {
                radioGroup = value;
              });
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 23.v),
            child: CustomRadioButton(
              width: 275.h,
              text: "Dark Mode",
              value: radioList[1],
              groupValue: radioGroup,
              isRightCheck: true,
              onChange: (value) {
                setState(() {
                  radioGroup = value;
                });
              },
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
