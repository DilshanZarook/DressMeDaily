import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';

class Frame624Screen extends StatelessWidget {
  const Frame624Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
            width: 226.h,
            padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 50.v),
            decoration: AppDecoration.fillOnError,
            child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).pushNamed("/frame_312_screen");
                    },
                    child: CustomImageView(
                      imagePath: ImageConstant.imgClose,
                      height: 20.adaptSize,
                      width: 20.adaptSize,
                      alignment: Alignment.centerRight,
                    ),
                  ),

                  SizedBox(height: 41.v),
              Padding(
                  padding: EdgeInsets.only(left: 11.h, right: 46.h),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgNotification,
                            height: 33.v,
                            width: 26.h),
                        GestureDetector(
                            onTap: () {
                              onTapTxtNotification(context);
                            },
                            child: Padding(
                                padding:
                                    EdgeInsets.only(left: 15.h, bottom: 11.v),
                                child: Text("Notification",
                                    style: theme.textTheme.bodyLarge)))
                      ])),
              SizedBox(height: 7.v),
              Padding(
                  padding: EdgeInsets.only(left: 11.h),
                  child: Row(children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgSearch,
                        height: 25.v,
                        width: 27.h),
                    GestureDetector(
                        onTap: () {
                          onTapTxtSettings(context);
                        },
                        child: Padding(
                            padding: EdgeInsets.only(left: 14.h, top: 2.v),
                            child: Text("Settings",
                                style: theme.textTheme.bodyLarge)))
                  ])),
              SizedBox(height: 15.v),
              Padding(
                  padding: EdgeInsets.only(left: 11.h),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgContrast,
                            height: 28.adaptSize,
                            width: 28.adaptSize),
                        GestureDetector(
                            onTap: () {
                              onTapTxtTheme(context);
                            },
                            child: Padding(
                                padding:
                                    EdgeInsets.only(left: 13.h, bottom: 5.v),
                                child: Text("Theme",
                                    style: theme.textTheme.bodyLarge)))
                      ])),
              SizedBox(height: 13.v),
              Padding(
                  padding: EdgeInsets.only(left: 11.h),
                  child: Row(children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgImportContacts,
                        height: 23.v,
                        width: 26.h,
                        margin: EdgeInsets.only(top: 1.v)),
                    Padding(
                        padding: EdgeInsets.only(left: 15.h, bottom: 2.v),
                        child: Text("Contact Us",
                            style: theme.textTheme.bodyLarge))
                  ])),
              SizedBox(height: 10.v),
              Padding(
                  padding: EdgeInsets.only(left: 11.h),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgProfile,
                            height: 28.v,
                            width: 27.h,
                            margin: EdgeInsets.only(top: 4.v)),
                        GestureDetector(
                            onTap: () {
                              onTapTxtFAQ(context);
                            },
                            child: Padding(
                                padding:
                                    EdgeInsets.only(left: 14.h, bottom: 10.v),
                                child: Text("FAQ",
                                    style: theme.textTheme.bodyLarge)))
                      ])),
              SizedBox(height: 8.v),
              Padding(
                  padding: EdgeInsets.only(left: 11.h),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImageView(
                            imagePath: ImageConstant.imgSettings,
                            height: 28.v,
                            width: 30.h,
                            margin: EdgeInsets.only(top: 2.v)),
                        GestureDetector(
                            onTap: () {
                              onTapTxtNotice(context);
                            },
                            child: Padding(
                                padding:
                                    EdgeInsets.only(left: 11.h, bottom: 8.v),
                                child: Text("Notice",
                                    style: theme.textTheme.bodyLarge)))
                      ])),
              SizedBox(height: 8.v)
            ])));
  }

  /// Navigates to the frame625Screen when the action is triggered.
  onTapTxtNotification(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pushNamed("/frame_629_screen");
  }


  /// Navigates to the frame633Screen when the action is triggered.
  onTapTxtSettings(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pushNamed("/frame_633_screen");
  }

  /// Navigates to the frame636Screen when the action is triggered.
  onTapTxtTheme(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pushNamed("/frame_636_screen");
  }

  /// Navigates to the frame639Screen when the action is triggered.
  onTapTxtFAQ(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pushNamed("/frame_644_screen");
  }

  /// Navigates to the frame638Screen when the action is triggered.
  onTapTxtNotice(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pushNamed("/frame_638_screen");
  }
}
