import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/widgets/app_bar/appbar_subtitle.dart';
import 'package:sdgp_test01/widgets/app_bar/appbar_title_image.dart';
import 'package:sdgp_test01/widgets/app_bar/custom_app_bar.dart';
import 'package:sdgp_test01/presentation/frame_634_dialog/frame_634_dialog.dart';
import 'package:sdgp_test01/presentation/frame_624_draweritem/frame_624_draweritem.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Frame633Screen extends StatelessWidget {
  const Frame633Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 17.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildFrame(context),
                      SizedBox(height: 18.v),
                      Divider(),
                      SizedBox(height: 18.v),
                      GestureDetector(
                          onTap: () {
                            onTapFrame(context);
                          },
                          child: Padding(
                              padding: EdgeInsets.only(left: 15.h),
                              child: Row(children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgFeedback,
                                    height: 35.adaptSize,
                                    width: 35.adaptSize),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 12.h, top: 7.v, bottom: 5.v),
                                    child: Text("Feedback",
                                        style: theme.textTheme.bodyLarge))
                              ]))),
                      SizedBox(height: 17.v),
                      Divider(),
                      SizedBox(height: 12.v),
                      GestureDetector(
                          onTap: () {
                            onTapFrame1(context);
                          },
                          child: Padding(
                              padding: EdgeInsets.only(left: 16.h),
                              child: Row(children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgVector_1,
                                    height: 30.adaptSize,
                                    width: 30.adaptSize),
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 14.h, top: 6.v),
                                    child: Text("Subscription",
                                        style: theme.textTheme.bodyLarge))
                              ]))),
                      SizedBox(height: 15.v),
                      Divider(),
                      SizedBox(height: 15.v),
                      Padding(
                          padding: EdgeInsets.only(left: 20.h),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgProfilePrimary,
                                    height: 25.adaptSize,
                                    width: 25.adaptSize,
                                    margin: EdgeInsets.only(bottom: 73.v,top: 3.v)),
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 16.h, top: 2.v),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Support",
                                              style: theme.textTheme.bodyLarge),
                                          SizedBox(height: 14.v),
                                          Text("Help center",
                                              style:
                                                  theme.textTheme.bodyMedium),
                                          SizedBox(height: 4.v),
                                          Text("Ask us anything",
                                              style:
                                                  theme.textTheme.bodyMedium),
                                          SizedBox(height: 3.v),
                                          Text("Rate us",
                                              style: theme.textTheme.bodyMedium)
                                        ]))
                              ])),
                      SizedBox(height: 21.v),
                      Divider(),
                      SizedBox(height: 18.v),
                      Padding(
                          padding: EdgeInsets.only(left: 19.h),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomImageView(
                                    imagePath: ImageConstant.imgFrame481,
                                    height: 27.adaptSize,
                                    width: 27.adaptSize,
                                    margin: EdgeInsets.only(bottom: 94.v)),
                                Padding(
                                    padding: EdgeInsets.only(left: 16.h),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("About",
                                              style: theme.textTheme.bodyLarge),
                                          SizedBox(height: 10.v),
                                          Text("Privacy Policy",
                                              style:
                                                  theme.textTheme.bodyMedium),
                                          SizedBox(height: 3.v),
                                          Text("Terms & Conditions",
                                              style:
                                                  theme.textTheme.bodyMedium),
                                          SizedBox(height: 5.v),
                                          Text("Disclaimer",
                                              style:
                                                  theme.textTheme.bodyMedium),
                                          SizedBox(height: 4.v),
                                          Text("Version 1.0",
                                              style: theme.textTheme.bodyMedium)
                                        ]))
                              ])),
                      SizedBox(height: 5.v)
                    ])),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 66.v,
      centerTitle: true,
      title: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 120.h),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/frame_624_draweritem'); // Replace '/frame624' with your actual route name
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 5.v, right: 10.h,left:15.v), // Adjust the margin as needed
                    child: SvgPicture.asset(
                      ImageConstant.imgArrowDown, // Make sure this points to the correct SVG asset
                      height: 25.v,
                      width: 25.h,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 75.h, top: 5.v, bottom: 1.v, right: 1.v),
                  child: Text(
                    "Settings",
                    style: TextStyle(
                      fontSize: 28, // Set font size to 18
                      // Include other styling properties if necessary
                    ),
                  ),
                )


              ],
            ),
          ),


          SizedBox(height: 15.v),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(width: double.maxFinite, child: Divider()),
          ),
        ],
      ),
    );
  }


  /// Section Widget
  Widget _buildFrame(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 25.h, right: 33.h),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomImageView(
              imagePath: ImageConstant.imgFrame473,
              height: 25.adaptSize,
              width: 25.adaptSize,
              margin: EdgeInsets.only(bottom: 25.v)),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 20.0), // Adjust the padding value as needed
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/frame_674_screen'); // Replace with the actual route name
                    },
                    child: Text(
                      "Invite friends",
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                  SizedBox(height: 11.v),
                  Text(
                    "Allow to remind you for your daily outfits",
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          )


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
              thickness: 4.h,
            ),
          ),
          SizedBox(height: 16.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Adjusted for even spacing
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image button 1
              InkWell(
                onTap: () {
                  // Navigate to the corresponding screen for imgUser1
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Frame624Screen()), // Replace with your actual screen widget
                  );
                },
                child: CustomImageView(
                  imagePath: ImageConstant.home_footer,
                  height: 30.v,
                  width: 30.h,
                  fit: BoxFit.cover,
                ),
              ),
              // Image button 2
              InkWell(
                onTap: () {
                  // Navigate to the corresponding screen for imgFrame373
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Frame624Screen()), // Replace with your actual screen widget
                  );
                },
                child: CustomImageView(
                  imagePath: ImageConstant.bookmark_footer,
                  height: 30.v,
                  width: 21.h,
                  fit: BoxFit.cover,
                ),
              ),
              InkWell(
                onTap: () {
                  // Navigate to the corresponding screen for imgFrame373
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Frame624Screen()), // Replace with your actual screen widget
                  );
                },
                child: CustomImageView(
                  imagePath: ImageConstant.camera_footer,
                  height: 30.v,
                  width: 30.h,
                  fit: BoxFit.cover,
                ),
              ),
              InkWell(
                onTap: () {
                  // Navigate to the corresponding screen for imgFrame373
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Frame624Screen()), // Replace with your actual screen widget
                  );
                },
                child: CustomImageView(
                  imagePath: ImageConstant.wardrobe_footer,
                  height: 30.v,
                  width: 30.h,
                  fit: BoxFit.cover,
                ),
              ),
              InkWell(
                onTap: () {
                  // Navigate to the corresponding screen for imgFrame373
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Frame624Screen()), // Replace with your actual screen widget
                  );
                },
                child: CustomImageView(
                  imagePath: ImageConstant.profile_footer,
                  height: 30.v,
                  width: 30.h,
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

  /// Displays a dialog with the [Frame634Dialog] content.
  onTapFrame(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: Frame634Dialog(),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }

  /// Navigates to the frame640Screen when the action is triggered.
  onTapFrame1(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.frame_640_screen);
  }

}

