import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/widgets/app_bar/appbar_subtitle_four.dart';
import 'package:sdgp_test01/widgets/app_bar/custom_app_bar.dart';
import 'package:sdgp_test01/presentation/Subscription_page_confirmation/subscription_page_confirmation.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sdgp_test01/presentation/Bookmark_page/bookmark_page.dart';
import 'package:sdgp_test01/presentation/User_profile/user_profile.dart';
import 'package:sdgp_test01/presentation/Landing_page/landing_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Subscription_after_purchase extends StatefulWidget {
  const Subscription_after_purchase({Key? key}) : super(key: key);


  @override
  _Subscription_after_purchaseState createState() => _Subscription_after_purchaseState();
}

class _Subscription_after_purchaseState extends State<Subscription_after_purchase> {
  int _currentIndex = 0; // Variable to keep track of the current index
  final List<LinearGradient> buttonGradients = [
    const LinearGradient(
      colors: [Color(0xFF3E4E5E), Color(0xFFDBDBDB)], // Corrected gradient colors
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    const LinearGradient(
      colors: [Color(0xFFCFDD53), Color(0x0ffdada9)], // Gradient for second item
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    const LinearGradient(
      colors: [Color(0xFFeecd16), Color(0xFFdbdbdb)], // Gradient for third item
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    // Add more gradients if there are more items in the carousel
  ];

  @override
  Widget build(BuildContext context) {
    List<String> buttonTexts = [
      "Subscribe to Plan 1",
      "Subscribe to Plan 2",
      "Subscribe to Plan 3",
      // Add more button texts corresponding to each carousel item
    ];

    return Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 31.v),
            child: Column(children: [
              SizedBox(height: 5.v),
              Text("Select your plan",
                  style: theme.textTheme.headlineSmall),
              SizedBox(height: 40.v),
              CarouselSlider(
                options: CarouselOptions(
                  height: 300.v,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 700),
                  viewportFraction: 0.7,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index; // Update the current index
                    });
                  },
                ),
                items: [
                  ImageConstant.subs_1,
                  ImageConstant.subs_2,
                  ImageConstant.subs_3,
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.h), // Adjust as needed
                          image: DecorationImage(
                            image: AssetImage(i), // Assuming 'i' is the path to the image asset
                            fit: BoxFit.cover, // Adjust the fit as needed
                          ),
                        ),
                        height: 226.v, // Adjust the width as needed
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 25.v),
              Text("7 days free trial, Cancel anytime",
                  style: CustomTextStyles.bodyMediumGray60001),
              SizedBox(height: 25.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.h),
                child: OutlineGradientButton(
                  gradient: const LinearGradient(
                    colors: [Colors.white, Colors.white], // Solid black gradient for the outline
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  strokeWidth: 2,
                  radius: const Radius.circular(40), // Set the border radius for the outline
                  padding: EdgeInsets.zero,
                  child: GestureDetector(
                    onTap: () => onTapSubscribe(context), // Call the onTapSubscribe function when the Container is tapped
                    child: Container(
                      height: 60.v,
                      decoration: BoxDecoration(
                        gradient: buttonGradients[_currentIndex], // Use the gradient for the button interior
                        borderRadius: BorderRadius.circular(40), // Set the border radius for the button
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Cancel",
                        style: CustomTextStyles.bodySmallOnError, // Apply your text style here
                      ),
                    ),
                  ),
                ),
              ),
            ])),
        bottomNavigationBar: _buildBottomBar(context));
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
                  Navigator.of(context, rootNavigator: true).pushNamed("/settings");
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
                  margin: EdgeInsets.only(left: 70.h, top: 10.v, bottom: 0.v))
            ])),
        SizedBox(height: 25.v),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: double.infinity, // Max width
            height: 15.0, // Height of 2
            color: Colors.black, // Black color
          ),
        )
      ]),
    );
  }

  /// Section Widget

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

  /// Navigates to the frame633Screen when the action is triggered.
  onTapArrowDown(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.settings);
  }

  /// Displays a dialog with the [Frame646Dialog] content.
  onTapSubscribe(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) =>
            const AlertDialog(
              content: Subscription_page_confirmation(),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: EdgeInsets.only(left: 0),
            ));
  }
}
class YourWidget extends StatelessWidget {
  const YourWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 252.v,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      items: [
        ImageConstant.subs_1,
        ImageConstant.subs_2,
        ImageConstant.subs_3,
      ].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.h), // Adjust as needed
                image: DecorationImage(
                  image: AssetImage(i),
                  // Assuming 'i' is the path to the image asset
                  fit: BoxFit.cover, // Adjust the fit as needed
                ),
              ),
              height: 226.v, // Adjust the width as needed
            );
          },
        );
      }).toList(),
    );
  }


}
