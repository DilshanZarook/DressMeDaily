import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/presentation/Bookmark_page/bookmark_page.dart';
import 'package:sdgp_test01/presentation/Landing_page/landing_page.dart';
import 'package:sdgp_test01/presentation/User_profile/user_profile.dart';
import 'package:sdgp_test01/presentation/frame_1061_page/frame_1061_page.dart';
import 'package:sdgp_test01/widgets/custom_elevated_button.dart';
import 'package:sdgp_test01/widgets/custom_icon_button.dart';
import 'package:sdgp_test01/widgets/custom_switch.dart';
import 'package:sdgp_test01/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class Frame1038Screen extends StatelessWidget {
  Frame1038Screen({Key? key}) : super(key: key);

  bool isSelectedSwitch = false;

  TextEditingController searchnormalController = TextEditingController();

  bool isSelectedSwitch1 = false;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
            height: 719.v,
            width: double.maxFinite,
            child: Stack(alignment: Alignment.topCenter, children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(21.h, 23.v, 26.h, 656.v),
                  child: _buildFrame(context, dMD: "DMD")),
              Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                      padding: EdgeInsets.only(top: 121.v),
                      child: SizedBox(
                          width: 357.h,
                          child: Divider(color: appTheme.black900)))),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 23.v),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 23.h),
                            child: _buildFrame(context, dMD: "DMD")),
                        SizedBox(height: 42.v),
                        Divider(color: appTheme.black900),
                        SizedBox(height: 18.v),
                        _buildFrame3(context),
                        SizedBox(height: 13.v),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: EdgeInsets.only(left: 24.h),
                                child: Text("Add event title",
                                    style: theme.textTheme.bodyLarge))),
                        SizedBox(height: 8.v),
                        Divider(),
                        SizedBox(height: 15.v),
                        _buildTwenty(context),
                        SizedBox(height: 31.v),
                        Divider(),
                        SizedBox(height: 6.v),
                        _buildFrame4(context),
                        SizedBox(height: 9.v),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: EdgeInsets.only(left: 22.h),
                                child: Text("Add notification time",
                                    style: theme.textTheme.bodyMedium))),
                        SizedBox(height: 14.v),
                        Divider(),
                        SizedBox(height: 7.v),
                        _buildFrame5(context),
                        SizedBox(height: 14.v),
                        Divider(),
                        SizedBox(height: 16.v),
                        _buildFourteen(context),
                        SizedBox(height: 30.v),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding:
                                    EdgeInsets.only(left: 44.h, right: 55.h),
                                child: Row(children: [
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.h, vertical: 11.v),
                                      decoration: AppDecoration.fillBlueGray
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder50),
                                      child: Container(
                                          height: 101.v,
                                          width: 98.h,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 18.h, vertical: 22.v),
                                          decoration: AppDecoration.fillWhiteA
                                              .copyWith(
                                                  borderRadius:
                                                      BorderRadiusStyle
                                                          .roundedBorder50),
                                          child: Container(
                                            height: 55.v,
                                            // Adjust height as needed
                                            width: 60.h,
                                            // Adjust width as needed
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                              ImageConstant.imgUserGray50001,
                                              // Path to your image asset
                                              fit: BoxFit
                                                  .cover, // You can adjust the fit as needed
                                            ),
                                          ))),
                                  Padding(
                                      padding: EdgeInsets.only(left: 17.h),
                                      child: CustomIconButton(
                                          height: 123.v,
                                          width: 122.h,
                                          padding: EdgeInsets.all(30.h),
                                          child: Container(
                                            height: 55.0,
                                            // Adjust the height as needed
                                            width: 56.0,
                                            // Adjust the width as needed
                                            child: Image.asset(
                                              ImageConstant
                                                  .imgUserGray5000155x56,
                                              // Path to your image asset
                                              fit: BoxFit
                                                  .cover, // Adjust the fit as per your requirement
                                            ),
                                          )))
                                ]))),
                        SizedBox(height: 39.v),
                        Padding(
                          padding: EdgeInsets.only(right: 14.h),
                          child: CustomIconButton(
                              height: 45.adaptSize,
                              width: 45.adaptSize,
                              padding: EdgeInsets.all(9.h),
                              decoration: IconButtonStyleHelper.fillGray,
                              alignment: Alignment.centerRight,
                              onTap: () {
                                onTapBtnAlarm(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Frame1061Page()),
                                );
                              },
                              child: Container(
                                child: Image.asset(
                                  ImageConstant.imgAlarm,
                                  // Path to your image asset
                                  fit: BoxFit
                                      .cover, // This is optional, depending on how you want the image to fit
                                ),
                              )),
                        ),
                        SizedBox(height: 63.v)
                      ])))
            ])),
        bottomNavigationBar: _buildBottomBar(context));
  }

  /// Section Widget
  Widget _buildFrame3(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              onTapImgClose(context);
            },
            child: Container(
              height: 17.adaptSize,
              width: 17.adaptSize,
              margin: EdgeInsets.symmetric(vertical: 4.v),
              child: Image.asset(
                ImageConstant.imgClose, // Ensure this is a correct asset path
                fit: BoxFit.cover,
              ),
            ),
          ),
          CustomElevatedButton(width: 59.h, text: "Save"),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTwenty(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
            padding: EdgeInsets.only(left: 13.h, right: 32.h),
            child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Container(
                height: 35.adaptSize, // Adjust height as needed
                width: 35.adaptSize, // Adjust width as needed
                child: Image.asset(
                  ImageConstant.imgClock, // Path to your image asset
                  fit: BoxFit.cover, // Adjust the fit as per your requirement
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 21.h, top: 8.v, bottom: 6.v),
                  child: Text("All-day", style: theme.textTheme.bodyLarge)),
              Spacer(),
              CustomSwitch(
                  margin: EdgeInsets.only(top: 6.v),
                  value: isSelectedSwitch,
                  onChange: (value) {
                    isSelectedSwitch = value;
                  })
            ])));
  }

  /// Section Widget
  Widget _buildFrame4(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            height: 35.adaptSize, // Adjust height as needed
            width: 35.adaptSize, // Adjust width as needed
            child: Image.asset(
              ImageConstant.imgFilledAppointmentReminders,
              // Path to your image asset
              fit: BoxFit.cover, // Adjust the fit as per your requirement
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 25.h, top: 10.v, bottom: 10.v),
              child: Text("1 hour before", style: theme.textTheme.bodyMedium)),
          Spacer(),
          Container(
            height: 17.adaptSize, // Adjust height as needed
            width: 17.adaptSize, // Adjust width as needed
            child: Image.asset(
              ImageConstant.imgClose, // Path to your image asset
              fit: BoxFit.cover, // Adjust the fit as per your requirement
            ),
          ),
        ]));
  }

  /// Section Widget
  Widget _buildFrame5(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 19.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              height: 34.v,
              width: 41.h,
              child: Image.asset(
                ImageConstant.imgFrame114,
                fit: BoxFit.cover,
              )),
          Padding(
              padding: EdgeInsets.only(left: 29.h, top: 10.v, bottom: 6.v),
              child:
                  Text("Add description", style: theme.textTheme.bodyMedium)),
          Spacer(),
          Container(
              child: Image.asset(ImageConstant.imgClose),
              height: 17.adaptSize,
              width: 17.adaptSize,
              margin: EdgeInsets.symmetric(vertical: 8.v))
        ]));
  }

  /// Section Widget
  Widget _buildFourteen(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 19.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.only(top: 1.v, bottom: 3.v),
              child: CustomTextFormField(
                  width: 127.h,
                  controller: searchnormalController,
                  hintText: "Filter clothing",
                  textInputAction: TextInputAction.done,
                  suffix: Container(
                      margin: EdgeInsets.fromLTRB(26.h, 3.v, 5.h, 3.v),
                      child: Container(
                          child: Image.asset(ImageConstant.imgSearchnormal),
                          height: 18.v,
                          width: 13.h)),
                  suffixConstraints: BoxConstraints(maxHeight: 24.v))),
          CustomSwitch(
              value: isSelectedSwitch1,
              onChange: (value) {
                isSelectedSwitch1 = value;
              })
        ]));
  }

  /// Section Widget

  /// Common widget
  Widget _buildFrame(
    BuildContext context, {
    required String dMD,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(dMD,
          style: theme.textTheme.headlineLarge!
              .copyWith(color: appTheme.black900)),
      Container(
        height: 31.v,
        // Adjust the height as needed
        width: 39.h,
        // Adjust the width as needed
        margin: EdgeInsets.only(top: 4.v, bottom: 3.v),
        // Set the desired margins
        child: Image.asset(
          ImageConstant.imgMegaphone, // Path to your image asset
          fit:
              BoxFit.cover, // This is optional, you can adjust as per your need
        ),
      )
    ]);
  }

  ///Handling route based on bottom click actions

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
            // Adjusted for even spacing
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image button 1
              InkWell(
                onTap: () {
                  // Navigate to the corresponding screen for imgUser1
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const LandingPage()), // Replace with your actual screen widget
                  );
                },
                child: SvgPicture.asset(
                  ImageConstant.home_footer_1,
                  height: 30.0, // Adjust the height as needed
                  width: 30.0, // Adjust the width as needed
                  fit: BoxFit.cover,
                ),
              ),
              // Image button 2
              InkWell(
                onTap: () {
                  // Navigate to the corresponding screen for imgFrame373
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Bookmark_page()), // Replace with your actual screen widget
                  );
                },
                child: SvgPicture.asset(
                  ImageConstant.bookmarkfooter,
                  height: 30.0, // Adjust the height as needed
                  width: 30.0, // Adjust the width as needed
                  fit: BoxFit.cover,
                ),
              ),
              InkWell(
                onTap: () {
                  // Navigate to the corresponding screen for imgFrame373
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const LandingPage()), // Replace with your actual screen widget
                  );
                },
                child: SvgPicture.asset(
                  ImageConstant.camera_footer_1,
                  height: 30.0, // Adjust the height as needed
                  width: 30.0, // Adjust the width as needed
                  fit: BoxFit.cover,
                ),
              ),
              InkWell(
                onTap: () {
                  // Navigate to the corresponding screen for imgFrame373
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const LandingPage()), // Replace with your actual screen widget
                  );
                },
                child: SvgPicture.asset(
                  ImageConstant.wardrobe_footer_1,
                  height: 30.0, // Adjust the height as needed
                  width: 30.0, // Adjust the width as needed
                  fit: BoxFit.cover,
                ),
              ),
              InkWell(
                onTap: () {
                  // Navigate to the corresponding screen for imgFrame373
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const User_profile()), // Replace with your actual screen widget
                  );
                },
                child: SvgPicture.asset(
                  ImageConstant.profile_footer_1,
                  height: 30.0, // Adjust the height as needed
                  width: 30.0, // Adjust the width as needed
                  fit: BoxFit.cover,
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

  /// Navigates back to the previous screen.
  onTapImgClose(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the frame1061ContainerScreen when the action is triggered.
  onTapBtnAlarm(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.frame1061ContainerScreen);
  }
}
