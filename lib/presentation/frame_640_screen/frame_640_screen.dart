import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/widgets/app_bar/appbar_subtitle_four.dart';
import 'package:sdgp_test01/widgets/app_bar/appbar_title_image.dart';
import 'package:sdgp_test01/widgets/app_bar/custom_app_bar.dart';
import 'package:sdgp_test01/widgets/custom_outlined_button.dart';
import 'package:sdgp_test01/presentation/frame_645_dialog/frame_645_dialog.dart';
import 'package:sdgp_test01/presentation/frame_680_screen/frame_680_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Frame640Screen extends StatelessWidget {
  const Frame640Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 31.v),
                child: Column(children: [
                  SizedBox(height: 5.v),
                  Text("Select your plan",
                      style: theme.textTheme.headlineSmall),
                  SizedBox(height: 40.v),
                  _buildSelectYourPlan(context),
                  SizedBox(height: 17.v),
                  Text("7 days free trial, Cancel anytime",
                      style: CustomTextStyles.bodyMediumGray60001),
                  SizedBox(height: 15.v),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 28.h),
                      child: OutlineGradientButton(
                          padding: EdgeInsets.only(
                              left: 1.h, top: 1.v, right: 1.h, bottom: 1.v),
                          strokeWidth: 1.h,
                          gradient: LinearGradient(
                              begin: Alignment(0, 0),
                              end: Alignment(0.96, 1),
                              colors: [
                                appTheme.gray300,
                                theme.colorScheme.primary
                              ]),
                          corners: Corners(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)),
                          child: CustomOutlinedButton(
                              height: 60.v,
                              text: "Subscribe",
                              buttonStyle: CustomButtonStyles.none,
                              decoration: CustomButtonStyles
                                  .gradientBlueGrayDfToBlueGrayDecoration,
                              buttonTextStyle:
                                  CustomTextStyles.bodySmallOnError,
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
              padding: EdgeInsets.only(right: 120.h),
              child: Row(children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context); // Navigate back when tapped
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10.v, right: 10.h, left: 15.v), // Adjust the margin as needed
                    child: SvgPicture.asset(
                      ImageConstant.imgArrowDown, // Replace with your SVG asset path
                      height: 25.v,
                      width: 25.h,
                    ),
                  ),
                ),

                AppbarSubtitleFour(
                    text: "Subscription",
                    margin: EdgeInsets.only(left: 70.h, top: 20.v, bottom: 10.v))
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
        width: 336.h,
        child: Stack(alignment: Alignment.centerRight, children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 0,
                  margin: EdgeInsets.all(0),
                  color: appTheme.gray300,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusStyle.roundedBorder40),
                  child: Container(
                      height: 267.v,
                      width: 224.h,
                      decoration: AppDecoration.fillGray300.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder40),
                      child: Stack(alignment: Alignment.topLeft, children: [
                        Opacity(
                            opacity: 0.9,
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                    height: 237.v,
                                    width: 190.h,
                                    margin: EdgeInsets.only(right: 11.h),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(40.h),
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
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40),
                                    bottomLeft: Radius.circular(40),
                                    bottomRight: Radius.circular(40)),
                                child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 63.h, vertical: 19.v),
                                    decoration: AppDecoration
                                        .gradientYellowAToBlack
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder40),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(right: 10.h),
                                              child: Text("Lifetime",
                                                  style: CustomTextStyles
                                                      .bodyLargeGray80002)),
                                          SizedBox(height: 92.v),
                                          Text("249.99 ",
                                              style: CustomTextStyles
                                                  .bodyLargeOnError),
                                          SizedBox(height: 94.v)
                                        ]))))
                      ])))),
          Align(
              alignment: Alignment.centerRight,
              child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 0,
                  margin: EdgeInsets.all(0),
                  color: appTheme.gray300,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusStyle.roundedBorder40),
                  child: Container(
                      height: 267.v,
                      width: 224.h,
                      decoration: AppDecoration.fillGray300.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder40),
                      child: Stack(alignment: Alignment.center, children: [
                        Opacity(
                            opacity: 0.9,
                            child: Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                    height: 220.v,
                                    width: 180.h,
                                    margin: EdgeInsets.only(top: 12.v),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(40.h),
                                        border: Border.all(
                                            color: theme.colorScheme.onError,
                                            width: 15.h))))),
                        Align(
                            alignment: Alignment.center,
                            child: Padding(
                                padding: EdgeInsets.only(left: 5.h),
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
                                        topLeft: Radius.circular(40),
                                        topRight: Radius.circular(40),
                                        bottomLeft: Radius.circular(40),
                                        bottomRight: Radius.circular(40)),
                                    child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 13.h, vertical: 18.v),
                                        decoration: AppDecoration
                                            .gradientLimeToBlack
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder40),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 61.h),
                                                  child: Text("Yearly Plan",
                                                      style: CustomTextStyles
                                                          .bodySmallGray70001)),
                                              SizedBox(height: 57.v),
                                              SizedBox(
                                                  height: 100.v,
                                                  width: 115.h,
                                                  child: Stack(
                                                      alignment:
                                                          Alignment.bottomLeft,
                                                      children: [
                                                        Align(
                                                            alignment: Alignment
                                                                .topRight,
                                                            child: SizedBox(
                                                                width: 45.h,
                                                                child: Text(
                                                                    "49.99/anually",
                                                                    maxLines: 2,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: CustomTextStyles
                                                                        .bodySmallOnError))),
                                                        Align(
                                                            alignment: Alignment
                                                                .bottomLeft,
                                                            child: Container(
                                                                height: 78.v,
                                                                width: 85.h,
                                                                decoration: BoxDecoration(
                                                                    color: appTheme
                                                                        .lime400,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            42.h))))
                                                      ])),
                                              SizedBox(height: 54.v)
                                            ])))))
                      ])))),
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
                      child: Stack(alignment: Alignment.center, children: [
                        Opacity(
                            opacity: 0.9,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                    height: 322.v,
                                    width: 219.h,
                                    margin: EdgeInsets.only(left: 18.h),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(80.h),
                                        border: Border.all(
                                            color: theme.colorScheme.onError,
                                            width: 15.h))))),
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
                                        horizontal: 57.h, vertical: 38.v),
                                    decoration: AppDecoration
                                        .gradientBlueGrayDfToBlueGray
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder80),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text("Monthly Plan",
                                              style: CustomTextStyles
                                                  .headlineSmallOnError),
                                          SizedBox(height: 90.v),
                                          Text("4.99/month",
                                              style: CustomTextStyles
                                                  .bodyLargeOnError),
                                          SizedBox(height: 80.v)
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

  /// Displays a dialog with the [Frame645Dialog] content.
  void onTapSubscribe(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: Frame645Dialog(),
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.zero,
        insetPadding: const EdgeInsets.only(left: 0),
      ),
    ).then((_) {
      // This code is executed after the dialog is closed
      Navigator.pushNamed(context, '/frame_680_screen'); // Replace '/frame680' with your actual route name
    });
  }

}
