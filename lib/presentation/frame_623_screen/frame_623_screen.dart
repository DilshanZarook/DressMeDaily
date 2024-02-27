import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:sdgp_test01/widgets/app_bar/appbar_title_image.dart';
import 'package:sdgp_test01/widgets/app_bar/custom_app_bar.dart';
import 'package:sdgp_test01/widgets/custom_icon_button.dart';
import 'package:sdgp_test01/widgets/custom_outlined_button.dart';

class Frame623Screen extends StatelessWidget {
  const Frame623Screen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 54.v),
              SizedBox(
                height: 66.v,
                width: 286.h,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Opacity(
                      opacity: 0.8,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: EdgeInsets.only(left: 232.h),
                          padding: EdgeInsets.symmetric(
                            horizontal: 7.h,
                            vertical: 8.v,
                          ),
                          decoration: AppDecoration.outlinePrimary.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder20,
                          ),
                          child: Container(
                            height: 43.v,
                            width: 40.h,
                            padding: EdgeInsets.all(4.h),
                            decoration: AppDecoration.fillOnError.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder15,
                            ),
                            child: CustomImageView(
                              imagePath: ImageConstant.imgCalendar,
                              height: 35.v,
                              width: 32.h,
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(right: 13.h),
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.h,
                          vertical: 4.v,
                        ),
                        decoration: AppDecoration.outlinePrimary1.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 4.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 169.h,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 1.v),
                                          child: Text(
                                            "Tue",
                                            style: CustomTextStyles
                                                .bodyMediumPrimary,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 1.v),
                                          child: Text(
                                            "Dec",
                                            style: CustomTextStyles
                                                .bodyMediumGray60003,
                                          ),
                                        ),
                                        Container(
                                          width: 53.h,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 9.h,
                                            vertical: 1.v,
                                          ),
                                          decoration: AppDecoration
                                              .fillDeepOrange
                                              .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .circleBorder10,
                                          ),
                                          child: Text(
                                            "Today",
                                            style: theme.textTheme.bodySmall,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 12.v),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 4.v),
                                        child: Text(
                                          "29 / 20",
                                          style: CustomTextStyles
                                              .bodyMediumPrimary,
                                        ),
                                      ),
                                      Container(
                                        height: 4.adaptSize,
                                        width: 4.adaptSize,
                                        margin: EdgeInsets.only(
                                          left: 5.h,
                                          bottom: 19.v,
                                        ),
                                        decoration: BoxDecoration(
                                          color: appTheme.blueGray100,
                                          borderRadius: BorderRadius.circular(
                                            2.h,
                                          ),
                                          border: Border.all(
                                            color: theme.colorScheme.primary
                                                .withOpacity(1),
                                            width: 1.h,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 5.h,
                                          bottom: 4.v,
                                        ),
                                        child: Text(
                                          "C",
                                          style: CustomTextStyles
                                              .bodyMediumPrimary,
                                        ),
                                      ),
                                      CustomImageView(
                                        imagePath: ImageConstant.imgCloudsnow,
                                        height: 23.v,
                                        width: 25.h,
                                        margin: EdgeInsets.only(left: 5.h),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            CustomIconButton(
                              height: 55.v,
                              width: 53.h,
                              padding: EdgeInsets.all(5.h),
                              child: CustomImageView(
                                imagePath: ImageConstant.imgCalendar,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 39.v),
              Card(
                clipBehavior: Clip.antiAlias,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusStyle.roundedBorder100,
                ),
                child: Container(
                  height: 279.v,
                  width: 250.h,
                  decoration: AppDecoration.outlinePrimary2.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder100,
                  ),
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: 279.v,
                          width: 103.h,
                          decoration: BoxDecoration(
                            color: appTheme.blueGray100,
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(100.h),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.h),
                          child: Row(
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgVecteezyCoolM,
                                height: 228.v,
                                width: 88.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 34.h,
                                  top: 48.v,
                                  bottom: 48.v,
                                ),
                                child: Column(
                                  children: [
                                    CustomOutlinedButton(
                                      width: 58.h,
                                      text: "Plan",
                                    ),
                                    SizedBox(height: 36.v),
                                    CustomOutlinedButton(
                                      width: 58.h,
                                      text: "Weather",
                                    ),
                                    SizedBox(height: 36.v),
                                    CustomOutlinedButton(
                                      width: 58.h,
                                      text: "Avatar",
                                      buttonTextStyle:
                                          CustomTextStyles.bodySmallGray700,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 26.v),
              Container(
                margin: EdgeInsets.only(
                  left: 68.h,
                  right: 62.h,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 27.h,
                  vertical: 37.v,
                ),
                decoration: AppDecoration.outlinePrimary3.copyWith(
                  borderRadius: BorderRadiusStyle.customBorderTL100,
                ),
                child: SizedBox(
                  width: 176.h,
                  child: Text(
                    "Trending local\nrecommendations:",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleLarge,
                  ),
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgRectangle10,
                height: 69.v,
                width: 357.h,
              ),
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
            padding: EdgeInsets.only(
              left: 18.h,
              right: 12.h,
            ),
            child: Row(
              children: [
                AppbarSubtitleOne(
                  text: "DMD",
                  margin: EdgeInsets.only(bottom: 1.v),
                ),
                AppbarTitleImage(
                  imagePath: ImageConstant.imgMegaphone,
                  margin: EdgeInsets.only(left: 258.h),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.v),
          SizedBox(
            width: 357.h,
            child: Divider(
              color: appTheme.gray80001,
            ),
          ),
        ],
      ),
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 3.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 357.h,
            child: Divider(
              color: theme.colorScheme.primary.withOpacity(1),
            ),
          ),
          SizedBox(height: 10.v),
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
