import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/presentation/Landing_page/landing_page.dart';
import 'package:sdgp_test01/presentation/User_profile/user_profile.dart';
import 'package:sdgp_test01/widgets/app_bar/appbar_title.dart';
import 'package:sdgp_test01/widgets/app_bar/custom_app_bar.dart';
import 'package:sdgp_test01/presentation/frame_404_bottomsheet/frame_404_bottomsheet.dart';
import 'package:sdgp_test01/presentation/frame_405_bottomsheet/frame_405_bottomsheet.dart';
import 'package:sdgp_test01/presentation/frame_406_bottomsheet/frame_406_bottomsheet.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sdgp_test01/presentation/Landing_page/landing_page.dart';
import 'package:sdgp_test01/presentation/User_profile/user_profile.dart';
import 'package:sdgp_test01/presentation/Bookmark_page/bookmark_page.dart';
import 'package:sdgp_test01/presentation/new_file/addtowardrobe_screen.dart';




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
                  MaterialPageRoute(builder: (context) => const Landing_page()), // Replace with your actual screen widget
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
                  MaterialPageRoute(builder: (context) => Bookmark_page()), // Replace with your actual screen widget
                );
              },
              child: SvgPicture.asset(
                ImageConstant.bookmarkfooter,
                height:30.0, // Adjust the height as needed
                width: 30.0, // Adjust the width as needed
                fit: BoxFit.cover,
              ),
            ),
            InkWell(
              onTap: () {
                // Navigate to the corresponding screen for imgFrame373
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Landing_page()), // Replace with your actual screen widget
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
                  MaterialPageRoute(builder: (context) => const Landing_page()), // Replace with your actual screen widget
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
                  MaterialPageRoute(builder: (context) => const User_profile()), // Replace with your actual screen widget
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

class FramelistItemWidget extends StatelessWidget {
  final String title;

  const FramelistItemWidget({Key? key, required this.title})
      : super(
    key: key,
  );


  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * 0.5; // 80% of screen width

    return Container(
      width: size,
      height: size,
      alignment: Alignment.center, // Center the child widget
      decoration: BoxDecoration(
        color: const Color(0xFF424242), // Using the color #424242
        borderRadius: BorderRadius.circular(20), // Assuming 20 is the desired radius
      ),
      child: Text(
        title,
        style: CustomTextStyles.titleLargeWhiteA700.copyWith(
          color: Colors.white, // Set text color to white
        ),
        textAlign: TextAlign.center, // Center align the text
        overflow: TextOverflow.ellipsis, // Prevent text from breaking into multiple lines
      ),
    );
  }
}

class Bookmark_page extends StatelessWidget {
  Bookmark_page({Key? key})
      : super(
    key: key,
  );

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 45.v),
            _buildFrameList(context),
            SizedBox(height: 45.v),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight + 20.h), // Adjust the height as needed
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomAppBar(
            leadingWidth: 40.h,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context); // Navigate back to the previous screen
              },
              // child: Container(
              //   margin: EdgeInsets.only(bottom: 25.v, right: 0.h, left: 5.v), // Adjust the margin as needed
              //   child: SvgPicture.asset(
              //     ImageConstant.imgArrowDown, // Make sure this points to the correct SVG asset
              //     height: 20.v,
              //     width: 20.h,
              //   ),
              // ),
            ),
            centerTitle: true,
            title: Padding(
              padding: EdgeInsets.only(bottom: 25.v), // Add padding above the title
              child: AppbarTitle(text: "Bookmark"),
            ),
          ),
          SizedBox(
            width: 360.h,
            height: 1.h,
            child: Divider(
              color: appTheme.black900,
              thickness: 4.h,
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildFrameList(BuildContext context) {
    List<String> titles = ['WORK WEAR', 'PARTY WEAR', 'CASUAL WEAR'];
    List<Widget> frames = [
      const Frame404Bottomsheet(), // Replace with your actual screen widget for frame_1
      const Frame405Bottomsheet(), // Replace with your actual screen widget for frame_2
      const Frame406Bottomsheet(), // Replace with your actual screen widget for frame_3
      // Add more frames if you have more categories
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 92.h),
      child: Column(
        children: List.generate(titles.length, (index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => frames[index]),
                  );
                },
                child: FramelistItemWidget(title: titles[index]),
              ),
              if (index < titles.length - 1) // Add space between items, except after the last one
                SizedBox(height: 25.v),
            ],
          );
        }),
      ),
    );
  }



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
                    MaterialPageRoute(builder: (context) => const Landing_page()), // Replace with your actual screen widget
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
                    MaterialPageRoute(builder: (context) => Bookmark_page()), // Replace with your actual screen widget
                  );
                },
                child: SvgPicture.asset(
                  ImageConstant.bookmarkfooter,
                  height:30.0, // Adjust the height as needed
                  width: 30.0, // Adjust the width as needed
                  fit: BoxFit.cover,
                ),
              ),
              InkWell(
                onTap: () {
                  // Navigate to the corresponding screen for imgFrame373
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Landing_page()), // Replace with your actual screen widget
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
                    MaterialPageRoute(builder: (context) => const Landing_page()), // Replace with your actual screen widget
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
                    MaterialPageRoute(builder: (context) => const User_profile()), // Replace with your actual screen widget
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



}
