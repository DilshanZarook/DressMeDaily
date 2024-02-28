import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/widgets/app_bar/appbar_subtitle_four.dart';
import 'package:sdgp_test01/widgets/app_bar/appbar_title_image.dart';
import 'package:sdgp_test01/widgets/app_bar/custom_app_bar.dart';
import 'package:sdgp_test01/widgets/custom_outlined_button.dart';
import 'package:sdgp_test01/presentation/frame_647_dialog/frame_647_dialog.dart';

class Frame642Screen extends StatelessWidget {
  const Frame642Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 31.v),
                child: Column(children: [
                  SizedBox(height: 5.v),
                  Text("Select your plan",
                      style: theme.textTheme.headlineSmall),
                  SizedBox(height: 77.v),
                  _buildSelectYourPlan(context),
                  SizedBox(height: 17.v),
                  Text("7 days free trial, Cancel anytime",
                      style: CustomTextStyles.bodyMediumGray60001),
                  SizedBox(height: 16.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 26.h),
                      child: OutlineGradientButton(
                          padding: EdgeInsets.only(
                              left: 1.h, top: 1.v, right: 1.h, bottom: 1.v),
                          strokeWidth: 1.h,
                          gradient: LinearGradient(
                              begin: Alignment(0.02, 0),
                              end: Alignment(0.98, 1),
                              colors: [
                                appTheme.gray300,
                                theme.colorScheme.primary
                              ]),
                          corners: Corners(
                              topLeft: Radius.circular(29),
                              topRight: Radius.circular(29),
                              bottomLeft: Radius.circular(29),
                              bottomRight: Radius.circular(29)),
                          child: CustomOutlinedButton(
                              height: 59.v,
                              text: "Subscribe",
                              buttonStyle: CustomButtonStyles.none,
                              decoration: CustomButtonStyles
                                  .gradientAmberToWhiteADecoration,
                              buttonTextStyle:
                                  CustomTextStyles.bodySmallBlack900,
                              onPressed: () {
                                onTapSubscribe(context);
                              })))
                ])),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        centerTitle: true,
        title: Column(children: [
          Padding(
              padding: EdgeInsets.only(right: 143.h),
              child: Row(children: [
                AppbarTitleImage(
                    imagePath: ImageConstant.imgArrowDown,
                    onTap: () {
                      onTapArrowDown(context);
                    }),
                AppbarSubtitleFour(
                    text: "Subscription",
                    margin: EdgeInsets.only(left: 80.h, top: 9.v, bottom: 7.v))
              ])),
          SizedBox(height: 16.v),
          Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                  width: double.maxFinite,
                  child:
                      Divider(color: theme.colorScheme.primary.withOpacity(1))))
        ]),
        styleType: Style.bgShadow_1);
  }

  /// Section Widget
  Widget _buildSelectYourPlan(BuildContext context) {
    return SizedBox(
        height: 360.v,
        width: 331.h,
        child: Stack(alignment: Alignment.center, children: [
          CustomImageView(
              imagePath: ImageConstant.imgFrame550,
              height: 267.v,
              width: 331.h,
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 39.v)),
          Align(
              alignment: Alignment.center,
              child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 0,
                  margin: EdgeInsets.all(0),
                  color: appTheme.gray300,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusStyle.roundedBorder80),
                  child: Container(
                      height: 360.v,
                      width: 265.h,
                      decoration: AppDecoration.fillGray300.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder80),
                      child: Stack(alignment: Alignment.topLeft, children: [
                        Opacity(
                            opacity: 0.9,
                            child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                    height: 320.v,
                                    width: 220.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(80.h),
                                        border: Border.all(
                                            color: theme.colorScheme.onError,
                                            width: 15.h))))),
                        CustomImageView(
                            imagePath: ImageConstant.imgEllipse2,
                            height: 106.v,
                            width: 91.h,
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(top: 73.v)),
                        Align(
                            alignment: Alignment.center,
                            child: OutlineGradientButton(
                                padding: EdgeInsets.only(
                                    left: 1.h,
                                    top: 1.v,
                                    right: 1.h,
                                    bottom: 1.v),
                                strokeWidth: 1.h,
                                gradient: LinearGradient(
                                    begin: Alignment(0.02, 0),
                                    end: Alignment(0.98, 1),
                                    colors: [
                                      appTheme.gray300,
                                      theme.colorScheme.primary
                                    ]),
                                corners: Corners(
                                    topLeft: Radius.circular(80),
                                    topRight: Radius.circular(80),
                                    bottomLeft: Radius.circular(80),
                                    bottomRight: Radius.circular(80)),
                                child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 85.h, vertical: 23.v),
                                    decoration: AppDecoration
                                        .gradientYellowAToBlack
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder80),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 1.h),
                                              child: Text("Lifetime",
                                                  style: CustomTextStyles
                                                      .headlineSmallGray80002)),
                                          SizedBox(height: 79.v),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 12.h),
                                              child: Text("249.99 ",
                                                  style: CustomTextStyles
                                                      .bodyLargeOnError)),
                                          SizedBox(height: 79.v)
                                        ]))))
                      ]))))
        ]));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return SizedBox(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
      SizedBox(
          width: double.maxFinite, child: Divider(color: appTheme.gray80001)),
      SizedBox(height: 16.v),
      Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
                imagePath: ImageConstant.imgUser,
                height: 35.v,
                width: 32.h,
                margin: EdgeInsets.only(bottom: 12.v)),
            CustomImageView(
                imagePath: ImageConstant.imgFrame373,
                height: 47.v,
                width: 239.h,
                margin: EdgeInsets.only(left: 32.h))
          ])
    ]));
  }

  /// Navigates to the frame633Screen when the action is triggered.
  onTapArrowDown(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.frame_633_screen);
  }

  /// Displays a dialog with the [Frame647Dialog] content.
  onTapSubscribe(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: Frame647Dialog(),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }
}
