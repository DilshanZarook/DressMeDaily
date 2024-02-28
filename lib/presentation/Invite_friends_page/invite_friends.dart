import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/widgets/app_bar/appbar_title.dart';
import '/../widgets/app_bar/custom_app_bar.dart';

class Invite_friends extends StatelessWidget {
  const Invite_friends({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(left: 31.h, top: 72.v, right: 31.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildFrame1(context),
                      SizedBox(height: 28.v),
                      Padding(
                          padding: EdgeInsets.only(right: 20.h),
                          child: Row(children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgCheckmark,
                                height: 39.v,
                                width: 32.h),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 25.h, top: 10.v, bottom: 2.v),
                              child: const Text(
                                "Invite friends by email",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  // include other styling attributes here, if needed
                                ),
                              ),)
                          ])),
                      SizedBox(height: 28.v),
                      Padding(
                          padding: EdgeInsets.only(right: 20.h),
                          child: Row(children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgSettingsGray90001,
                                height: 35.v,
                                width: 36.h),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: 20.h, top: 5.v, bottom: 4.v),
                              child: const Text(
                                "Invite friends by SMS",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  // include other styling attributes here, if needed
                                ),
                              ),)
                          ])),
                      SizedBox(height: 28.v),
                      Row(children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgSend,
                            height: 27.v,
                            width: 21.h),
                        Padding(
                            padding: EdgeInsets.only(left: 35.h, bottom: 3.v,top: 5.v),
                          child: const Text(
                            "Invite friends by",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              // include other styling attributes here, if needed
                            ),
                          ),)
                      ]),
                      SizedBox(height: 5.v)
                    ])),
            bottomNavigationBar: _buildBottomBar(context)));
  }


  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        centerTitle: true,

        title: Column(children: [

          Padding(
              padding: EdgeInsets.only(right: 80.h),
              child: Row(children: [
                AppbarTitle(
                    text: "Invite friends",
                    margin: EdgeInsets.only(left: 65.h, top: 2.v, bottom: 3.v))
              ])),
          SizedBox(height: 12.v),
          const Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(width: double.maxFinite, child: Divider()))
        ]),
        );
  }

  /// Section Widget
  Widget _buildFrame1(BuildContext context) {
    return Row(children: [
      CustomImageView(
          imagePath: ImageConstant.imgVolume, height: 36.v, width: 33.h),
      Padding(
        padding: EdgeInsets.only(left: 25.h, top: 9.v, bottom: 5.v),
        child: const Text(
          "Invite friends by WhatsApp",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            // include other styling attributes here, if needed
          ),
        ),
      )

    ]);
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
    Navigator.pushNamed(context, AppRoutes.settings);
  }
}
