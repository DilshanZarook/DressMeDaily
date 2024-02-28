import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/widgets/app_bar/appbar_subtitle_four.dart';
import 'package:sdgp_test01/widgets/app_bar/appbar_title_image.dart';
import 'package:sdgp_test01/widgets/app_bar/custom_app_bar.dart';
import 'package:sdgp_test01/widgets/custom_outlined_button.dart';
import 'package:sdgp_test01/presentation/frame_652_dialog/frame_652_dialog.dart';

class Frame649Screen extends StatelessWidget {
  const Frame649Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 33.v),
                child: Column(children: [
                  SizedBox(height: 3.v),
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
                              topLeft: Radius.circular(28),
                              topRight: Radius.circular(28),
                              bottomLeft: Radius.circular(28),
                              bottomRight: Radius.circular(28)),
                          child: CustomOutlinedButton(
                              height: 57.v,
                              text: "Purchased",
                              buttonStyle: CustomButtonStyles.none,
                              decoration: CustomButtonStyles
                                  .gradientLimeToBlackDecoration,
                              buttonTextStyle:
                                  CustomTextStyles.bodySmallGray70003,
                              onPressed: () {
                                onTapPurchased(context);
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
        width: 334.h,
        child: Stack(alignment: Alignment.centerRight, children: [
          CustomImageView(
              imagePath: ImageConstant.imgFrame533,
              height: 267.v,
              width: 224.h,
              radius: BorderRadius.circular(40.h),
              alignment: Alignment.centerLeft),
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
                      width: 160.h,
                      decoration: AppDecoration.fillGray300.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder40),
                      child: Stack(alignment: Alignment.center, children: [
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                                margin:
                                    EdgeInsets.only(right: 14.h, bottom: 23.v),
                                decoration: AppDecoration.outlineOnError
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder40),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 91.v),
                                      Container(
                                          height: 81.v,
                                          width: 57.h,
                                          decoration: BoxDecoration(
                                              color: appTheme.yellowA700,
                                              borderRadius:
                                                  BorderRadius.circular(40.h)))
                                    ]))),
                        Align(
                            alignment: Alignment.center,
                            child: Container(
                                decoration: AppDecoration.gradientYellowAToBlack
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder40),
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
                                    child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 42.h, vertical: 10.v),
                                        child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  width: 9.h,
                                                  margin: EdgeInsets.only(
                                                      bottom: 154.v),
                                                  child: Text("Lifetime",
                                                      maxLines: 6,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: CustomTextStyles
                                                          .bodySmallGray80002)),
                                              Container(
                                                  width: 7.h,
                                                  margin: EdgeInsets.only(
                                                      left: 1.h,
                                                      top: 76.v,
                                                      bottom: 61.v),
                                                  child: Text("249.99 ",
                                                      maxLines: 7,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: CustomTextStyles
                                                          .bodySmallOnError))
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
                        Align(
                            alignment: Alignment.center,
                            child: Card(
                                clipBehavior: Clip.antiAlias,
                                elevation: 0,
                                margin: EdgeInsets.all(0),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(width: 1.h),
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder80),
                                child: Container(
                                    height: 360.v,
                                    width: 265.h,
                                    padding:
                                        EdgeInsets.symmetric(vertical: 33.v),
                                    decoration: AppDecoration
                                        .gradientLimeToBlack
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .roundedBorder80),
                                    child: Stack(
                                        alignment: Alignment.bottomLeft,
                                        children: [
                                          Align(
                                              alignment: Alignment.topCenter,
                                              child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 69.h, right: 71.h),
                                                  child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text("Yearly Plan",
                                                            style: CustomTextStyles
                                                                .headlineSmallGray70001),
                                                        SizedBox(height: 79.v),
                                                        Text("49.99/anually",
                                                            style: CustomTextStyles
                                                                .bodyLargeOnError)
                                                      ]))),
                                          Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Container(
                                                  height: 104.v,
                                                  width: 98.h,
                                                  margin: EdgeInsets.only(
                                                      bottom: 79.v),
                                                  decoration: BoxDecoration(
                                                      color: appTheme.lime400,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              52.h))))
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

  /// Displays a dialog with the [Frame652Dialog] content.
  onTapPurchased(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: Frame652Dialog(),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }
}
