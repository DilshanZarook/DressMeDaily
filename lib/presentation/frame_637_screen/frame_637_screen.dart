import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/widgets/app_bar/appbar_subtitle_four.dart';
import 'package:sdgp_test01/widgets/app_bar/appbar_title_image.dart';
import 'package:sdgp_test01/widgets/app_bar/custom_app_bar.dart';
import 'package:sdgp_test01/widgets/custom_radio_button.dart';

class Frame637Screen extends StatelessWidget {
  Frame637Screen({Key? key})
      : super(
          key: key,
        );

  String radioGroup = "";

  List<String> radioList = ["lbl_light_mode", "lbl_dark_mode"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 7.v),
          child: Column(
            children: [
              SizedBox(height: 84.v),
              _buildRadioGroup(context),
              Spacer(),
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
          Padding(
            padding: EdgeInsets.only(right: 155.h),
            child: Row(
              children: [
                AppbarTitleImage(
                  imagePath: ImageConstant.imgArrowDownGray90001,
                ),
                AppbarSubtitleFour(
                  text: "Themes",
                  margin: EdgeInsets.only(
                    left: 104.h,
                    top: 9.v,
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
              width: 359.h,
              child: Divider(
                color: theme.colorScheme.primary.withOpacity(1),
              ),
            ),
          ),
        ],
      ),
      styleType: Style.bgShadow_1,
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
              radioGroup = value;
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 23.v),
            child: CustomRadioButton(
              width: 275.h,
              text: "Dark mode",
              value: radioList[1],
              groupValue: radioGroup,
              isRightCheck: true,
              onChange: (value) {
                radioGroup = value;
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 359.h,
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
