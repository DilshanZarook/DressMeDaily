import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:DressMeDaily/core/app_export.dart';
import 'package:DressMeDaily/new_file/addtowardrobe_screen.dart';
import 'package:DressMeDaily/presentation/Bookmark_page/bookmark_page.dart';
import 'package:DressMeDaily/presentation/Landing_page/landing_page.dart';
import 'package:DressMeDaily/presentation/Main_wardrobe/Main_wardrobe.dart';
import 'package:DressMeDaily/presentation/User_profile/user_profile.dart';
import 'package:DressMeDaily/widgets/app_bar/appbar_subtitle.dart';
import 'package:DressMeDaily/widgets/app_bar/custom_app_bar.dart';
import 'package:DressMeDaily/widgets/custom_drop_down.dart';

class FAQ_Page extends StatelessWidget {
  const FAQ_Page({Key? key})
      : super(
          key: key,
        );

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 54.h),
        child: ListView(
          children: [
            _buildRoundedExpansionTile(
              title: "What is DressMeDaily ?",
              content: "It is an AI wardrobe application.",
              titleFontSize: 16.0, // Font size for the main title
              contentFontSize: 14.0, // Font size for the content
            ),
            _buildRoundedExpansionTile(
              title: "How do I add clothing items to my virtual wardrobe ?",
              content: "To add an item to the app, simply tap on the \"Add Item\" button, and then either take a photo of the clothing item using your device's camera or upload an existing photo from your gallery. Additionally, you can manually enter details such as the color, brand, and category of the item.",
              titleFontSize: 16.0, // Font size for the main title
              contentFontSize: 14.0, // Font size for the content
            ),_buildRoundedExpansionTile(
              title: "Can I organize my clothing items into categories?",
              content: "With DressMeDaily, you have the option to organize your clothes by different categories such as type, color, season, and more. This feature simplifies the process of finding the ideal outfit for any event.",
              titleFontSize: 16.0, // Font size for the main title
              contentFontSize: 14.0, // Font size for the content
            ),
            _buildRoundedExpansionTile(
              title: "How does the AI styling feature work ?",
              content: "Our AI styling feature analyzes your wardrobe and provides outfit suggestions based on your preferences, the occasion, and the weather. You can fine-tune the suggestions to match your style.",
              titleFontSize: 16.0, // Font size for the main title
              contentFontSize: 14.0, // Font size for the content
            ),
            _buildRoundedExpansionTile(
              title: "Can I plan my outfits in advance?",
              content: "Absolutely!, using DressMeDaily, you can conveniently plan your outfits by choosing clothes from your digital closet and assigning them to specific days. This approach can assist in keeping you well-organized and also saves you time during your morning routine.",
              titleFontSize: 16.0, // Font size for the main title
              contentFontSize: 14.0, // Font size for the content
            ),
           _buildRoundedExpansionTile(
              title: "Is my data secure with DressMeDaily ?",
              content: "Ensuring the privacy and security of your data is our top priority. We encrypt all your information and strictly adhere to our privacy policies. You have control over what you share and with whom.",
              titleFontSize: 16.0, // Font size for the main title
              contentFontSize: 14.0, // Font size for the content
            ),
            _buildRoundedExpansionTile(
              title: "Can I use the application without an internet connection?",
              content: "Although DressMeDaily can be used offline to view and plan outfits, some features require an active internet connection for the best experience.",
              titleFontSize: 16.0, // Font size for the main title
              contentFontSize: 14.0, // Font size for the content
            ),_buildRoundedExpansionTile(
              title: "How do I get support if I encounter issues or have questions?",
              content: "If you need any assistance or have any questions, please don't hesitate to contact our support team through either the in-app help center or by emailing support@DressMeDaily.com. We are always here to help!",
              titleFontSize: 16.0, // Font size for the main title
              contentFontSize: 14.0, // Font size for the content
            ),
            SizedBox(height: 15.v),
            SizedBox(height: 5.v),
          ],
        ),
      ),

    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 70.v,
      centerTitle: true,
      title: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 100.h),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20.v),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(
                          context); // Navigate back to the previous screen
                    },
                    child: Container(
                      margin:
                          EdgeInsets.only(bottom: 20.v, right: 0.h, left: 15.v),
                      // Adjust the margin as needed
                      child: SvgPicture.asset(
                        ImageConstant.imgArrowDown,
                        // Make sure this points to the correct SVG asset
                        height: 25.v,
                        width: 25.h,
                      ),
                    ),
                  ),
                ),
                AppbarSubtitle(
                  text: "FAQ",
                  margin: EdgeInsets.only(left: 110.h),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: double.maxFinite,
              child: Divider(
                color: theme.colorScheme.primary.withOpacity(1),
              ),
            ),
          ),
        ],
      ),
    );
  }Widget _buildRoundedExpansionTile({
    required String title,
    required String content,
    required double titleFontSize,
    required double contentFontSize,
  }) {
    return Container(
      margin: EdgeInsets.only(top: 8.v, bottom: 8.v),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: ExpansionTile(
          title: Text(
            title,
            style: TextStyle(fontSize: titleFontSize, color: Colors.black), // Title font style
          ),
          children: <Widget>[
            ListTile(
              title: Text(
                content,
                style: TextStyle(fontSize: contentFontSize, color: Colors.grey), // Content font style
              ),
            ),
          ],
        ),
      ),
    );
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
                    MaterialPageRoute(
                        builder: (context) => const LandingPage()),
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
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddtowardrobeScreen()),
                  );
                },
                child: SizedBox(
                  height: 30.v,
                  width: 21.h,
                  child: Image.asset(
                    ImageConstant.camera_footer,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Main_wardrobe()),
                  );
                },
                child: SizedBox(
                  height: 30.v,
                  width: 21.h,
                  child: Image.asset(
                    ImageConstant.wardrobe_footer,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  User_profile()),
                  );
                },
                child: SizedBox(
                  height: 30.v,
                  width: 21.h,
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
