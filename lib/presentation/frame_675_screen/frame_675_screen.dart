import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/widgets/custom_elevated_button.dart';
import 'package:sdgp_test01/presentation/Bookmark_page/bookmark_page.dart';
import 'package:sdgp_test01/presentation/User_profile/user_profile.dart';

class Frame675Screen extends StatelessWidget {
  const Frame675Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            backgroundColor: theme.colorScheme.secondaryContainer,
            body: SizedBox(
                height: 715.v,
                width: double.maxFinite,
                child: Stack(alignment: Alignment.topLeft, children: [
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 18.v),
                          decoration: AppDecoration.fillOnError,
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildFrameRow(context),
                                SizedBox(height: 17.v),
                                _buildFrameColumn(context),
                                SizedBox(height: 18.v),
                                const Divider(),
                                SizedBox(height: 18.v),
                                Padding(
                                    padding: EdgeInsets.only(left: 15.h),
                                    child: Row(children: [
                                      CustomImageView(
                                          imagePath: ImageConstant.imgFeedback,
                                          height: 35.adaptSize,
                                          width: 35.adaptSize),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 16.h,
                                              top: 7.v,
                                              bottom: 5.v),
                                          child: Text("Feedback",
                                              style: theme.textTheme.bodyLarge))
                                    ])),
                                SizedBox(height: 15.v),
                                const Divider(),
                                SizedBox(height: 10.v),
                                Padding(
                                    padding: EdgeInsets.only(left: 20.h),
                                    child: Row(children: [
                                      CustomImageView(
                                          imagePath: ImageConstant.imgVector_1,
                                          height: 30.adaptSize,
                                          width: 30.adaptSize),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 19.h, top: 6.v),
                                          child: Text("Subscription",
                                              style: theme.textTheme.bodyLarge))
                                    ])),
                                SizedBox(height: 10.v),
                                const Divider(),
                                SizedBox(height: 10.v),
                                Padding(
                                    padding: EdgeInsets.only(left: 20.h),
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgProfilePrimary,
                                              height: 25.adaptSize,
                                              width: 25.adaptSize,
                                              margin: EdgeInsets.only(
                                                  bottom: 73.v)),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 16.h, top: 2.v),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Support",
                                                        style: theme.textTheme
                                                            .bodyLarge),
                                                    SizedBox(height: 14.v),
                                                    Text("Help center",
                                                        style: theme.textTheme
                                                            .bodyMedium),
                                                    SizedBox(height: 4.v),
                                                    Text("Ask us anything",
                                                        style: theme.textTheme
                                                            .bodyMedium),
                                                    SizedBox(height: 3.v),
                                                    Text("Rate us",
                                                        style: theme.textTheme
                                                            .bodyMedium)
                                                  ]))
                                        ])),
                                SizedBox(height: 10.v),
                                const Divider(),
                                SizedBox(height: 10.v),
                                Padding(
                                    padding: EdgeInsets.only(left: 19.h),
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgFrame481,
                                              height: 30.adaptSize,
                                              width: 30.adaptSize,
                                              margin: EdgeInsets.only(
                                                  bottom: 94.v)),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 16.h),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text("About",
                                                        style: theme.textTheme
                                                            .bodyLarge),
                                                    SizedBox(height: 20.v),
                                                    Text("Privacy Policy",
                                                        style: theme.textTheme
                                                            .bodyMedium),
                                                    SizedBox(height: 3.v),
                                                    Text("Terms & Conditions",
                                                        style: theme.textTheme
                                                            .bodyMedium),
                                                    SizedBox(height: 5.v),
                                                    Text("Disclaimer",
                                                        style: theme.textTheme
                                                            .bodyMedium),
                                                    SizedBox(height: 4.v),
                                                    Text("Version 1.0",
                                                        style: theme.textTheme
                                                            .bodyMedium)
                                                  ]))
                                        ])),
                                SizedBox(height: 15.v)
                              ]))),
                  CustomElevatedButton(
                      height: 46.v,
                      width: 220.h,
                      text: "Thank you for your feedback !",
                      margin: EdgeInsets.only(left: 69.h, top: 283.v),
                      buttonStyle: CustomButtonStyles.fillGrayTL20,
                      buttonTextStyle: theme.textTheme.bodySmall!,
                      onPressed: () {
                        onTapThankYouForYourFeedback(context);
                      },
                      alignment: Alignment.topLeft)
                ])),
            bottomNavigationBar: _buildBottomBar(context));
  }

  /// Section Widget
  Widget _buildFrameRow(BuildContext context) {
    return Container(
        decoration: AppDecoration.outlinePrimary4,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            CustomImageView(
                imagePath: ImageConstant.imgArrowDown,
                height: 37.v,
                width: 40.h),
            Padding(
                padding: EdgeInsets.only(left: 88.h, top: 5.v),
                child: Text("Settings",
                    style: CustomTextStyles.headlineSmallMedium))
          ]),
          SizedBox(height: 15.v),
          const Divider()
        ]));
  }

  /// Section Widget
  Widget _buildFrameColumn(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 17.h, right: 33.h),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomImageView(
              imagePath: ImageConstant.imgFrame473,
              height: 25.adaptSize,
              width: 25.adaptSize,
              margin: EdgeInsets.only(bottom: 25.v)),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 18.h),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Invite friends",
                            style: theme.textTheme.bodyLarge),
                        SizedBox(height: 11.v),
                        Text("Allow to remind you for your daily outfits",
                            style: theme.textTheme.bodyMedium)
                      ])))
        ]));
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
              thickness: 1.h,
            ),
          ),
          SizedBox(height: 16.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image button 1
              _buildIconButton(
                context,
                ImageConstant.home_footer,
                    () => Navigator.push(context, MaterialPageRoute(builder: (context) => Bookmark_page())),
              ),
              // Image button 2
              _buildIconButton(
                context,
                ImageConstant.bookmark_footer,
                    () => Navigator.push(context, MaterialPageRoute(builder: (context) => Bookmark_page())),
              ),
              // Image button 3
              _buildIconButton(
                context,
                ImageConstant.camera_footer,
                    () => Navigator.push(context, MaterialPageRoute(builder: (context) => Bookmark_page())),
              ),
              // Image button 4
              _buildIconButton(
                context,
                ImageConstant.wardrobe_footer,
                    () => Navigator.push(context, MaterialPageRoute(builder: (context) => Bookmark_page())),
              ),
              // Image button 5
              _buildIconButton(
                context,
                ImageConstant.profile_footer,
                    () => Navigator.push(context, MaterialPageRoute(builder: (context) =>  User_profile())),
              ),
              // Add more buttons if needed
            ],
          ),
          SizedBox(height: 10.v),
        ],
      ),
    );
  }

  Widget _buildIconButton(BuildContext context, String imagePath, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 30.v,
        width: 30.h,
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }


  /// Navigates to the frame633Screen when the action is triggered.
  onTapThankYouForYourFeedback(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.settings);
  }
}
