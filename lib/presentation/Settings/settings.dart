import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/presentation/Landing_page/landing_page.dart';
import 'package:sdgp_test01/widgets/app_bar/custom_app_bar.dart';
import 'package:sdgp_test01/presentation/Feedback_popup/feedback_popup.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sdgp_test01/presentation/Bookmark_page/bookmark_page.dart';
import 'package:sdgp_test01/presentation/User_profile/user_profile.dart';


class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 17.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildFrame(context),
                      SizedBox(height: 18.v),
                      const Divider(),
                      SizedBox(height: 18.v),
                      GestureDetector(
                          onTap: () {
                            onTapFrame(context);
                          },
                          child: Padding(
                              padding: EdgeInsets.only(left: 15.h),
                              child: Row(children: [
                                SizedBox(
                                  height: 35.adaptSize,
                                  width: 35.adaptSize,
                                  child: SvgPicture.asset(
                                    ImageConstant.imgFeedback, // Path to your SVG asset
                                    height: 25.adaptSize,
                                    width: 25.adaptSize,
                                    fit: BoxFit.cover,
                                  )
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 12.h, top: 7.v, bottom: 5.v),
                                    child: Text("Feedback",
                                        style: theme.textTheme.bodyLarge))
                              ]))),
                      SizedBox(height: 17.v),
                      const Divider(),
                      SizedBox(height: 12.v),
                      GestureDetector(
                          onTap: () {
                            onTapFrame1(context);
                          },
                          child: Padding(
                              padding: EdgeInsets.only(left: 16.h),
                              child: Row(children: [
                                SizedBox(
                                  height: 30.adaptSize,
                                  width: 30.adaptSize,
                                    child: SvgPicture.asset(
                                      ImageConstant.imgVector_1, // Path to your SVG asset
                                      height: 25.adaptSize,
                                      width: 25.adaptSize,
                                      fit: BoxFit.cover,
                                    )
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 14.h, top: 6.v),
                                    child: Text("Subscription",
                                        style: theme.textTheme.bodyLarge))
                              ]))),
                      SizedBox(height: 15.v),
                      const Divider(),
                      SizedBox(height: 15.v),
                      Padding(
                          padding: EdgeInsets.only(left: 20.h),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 25.adaptSize,
                                  width: 25.adaptSize,
                                  margin: EdgeInsets.only(bottom: 73.v, top: 3.v),
                                    child: SvgPicture.asset(
                                      ImageConstant.imgProfilePrimary, // Path to your SVG asset
                                      height: 25.adaptSize,
                                      width: 25.adaptSize,
                                      fit: BoxFit.cover,
                                    )
                                ),
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
                      const Divider(),
                      SizedBox(height: 18.v),
                      Padding(
                          padding: EdgeInsets.only(left: 19.h),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 25.adaptSize,
                                  width: 25.adaptSize,
                                  margin: EdgeInsets.only(bottom: 94.v),
                                    child: SvgPicture.asset(
                                      ImageConstant.imgFrame481, // Path to your SVG asset
                                      height: 25.adaptSize,
                                      width: 25.adaptSize,
                                      fit: BoxFit.cover,
                                    )
                                ),
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
            bottomNavigationBar: _buildBottomBar(context));
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
                    Navigator.pushNamed(context, '/main_settings'); // Replace '/frame624' with your actual route name
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
                  child: const Text(
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
          const Align(
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
          Container(
            height: 25.adaptSize,
            width: 25.adaptSize,
            margin: EdgeInsets.only(bottom: 25.v),
              child: SvgPicture.asset(
                ImageConstant.imgSend, // Path to your SVG asset
                height: 35.adaptSize,
                width: 35.adaptSize,

              )
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0), // Adjust the padding value as needed
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/invite_friends'); // Replace with the actual route name
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image button 1
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Landing_page()),
                  );
                },
                child: SizedBox(
                  height: 30.v,
                  width: 30.h,
                  child: Image.asset(
                    ImageConstant.home_footer,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Image button 2
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Bookmark_page()),
                  );
                },
                child: SizedBox(
                  height: 30.v,
                  width: 21.h,
                  child: Image.asset(
                    ImageConstant.bookmark_footer,
                    fit: BoxFit.cover,
                  ),
                ),
              ),InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Bookmark_page()),
                  );
                },
                child: SizedBox(
                  height: 30.v,
                  width: 30.h,
                  child: Image.asset(
                    ImageConstant.camera_footer,
                    fit: BoxFit.cover,
                  ),
                ),
              ),InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Bookmark_page()),
                  );
                },
                child: SizedBox(
                  height: 30.v,
                  width: 30.h,
                  child: Image.asset(
                    ImageConstant.wardrobe_footer,
                    fit: BoxFit.cover,
                  ),
                ),
              ),InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const User_profile()),
                  );
                },
                child: SizedBox(
                  height: 30.v,
                  width: 30.h,
                  child: Image.asset(
                    ImageConstant.profile_footer,
                    fit: BoxFit.cover,
                  ),
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
  }

  /// Displays a dialog with the [Feedback_popup] content.
  onTapFrame(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: Feedback_popup(),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }

  /// Navigates to the frame640Screen when the action is triggered.
  onTapFrame1(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.subscription_page);
  }



