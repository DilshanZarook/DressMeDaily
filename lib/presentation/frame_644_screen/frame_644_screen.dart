import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/presentation/frame_624_draweritem/frame_624_draweritem.dart';
import 'package:sdgp_test01/widgets/app_bar/appbar_subtitle.dart';
import 'package:sdgp_test01/widgets/app_bar/appbar_title_image.dart';
import 'package:sdgp_test01/widgets/app_bar/custom_app_bar.dart';
import 'package:sdgp_test01/widgets/custom_drop_down.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Frame644Screen extends StatelessWidget {
  Frame644Screen({Key? key})
      : super(
          key: key,
        );


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 54.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomDropDown(
                icon: Container(
                  margin: EdgeInsets.fromLTRB(30.h, 8.v, 11.h, 8.v),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgCheckmarkGray90001,
                    height: 33.v,
                    width: 25.h,
                    color: Colors.black,
                  ),
                ),
                hintText: "What is DressMeDaily ?",
                contentPadding: EdgeInsets.only(
                  left: 11.h,
                  top: 17.v,
                  bottom: 17.v,
                ),
                onChanged: (value) {},
              ),
              SizedBox(height: 15.v),
              CustomDropDown(
                icon: Container(
                  margin: EdgeInsets.fromLTRB(7.h, 8.v, 11.h, 8.v),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgCheckmarkGray90001,
                    height: 33.v,
                    width: 25.h,
                  ),
                ),
                hintText:
                    "How do I add clothing items to my \nvirtual wardrobe ?",
                onChanged: (value) {},
              ),
              SizedBox(height: 15.v),
              CustomDropDown(
                icon: Container(
                  margin: EdgeInsets.fromLTRB(20.h, 8.v, 11.h, 8.v),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgCheckmarkGray90001,
                    height: 33.v,
                    width: 25.h,
                  ),
                ),
                hintText: "Can I organize my clothing items \ninto categories?",
                onChanged: (value) {},
              ),
              SizedBox(height: 15.v),
              CustomDropDown(
                icon: Container(
                  margin: EdgeInsets.fromLTRB(23.h, 8.v, 11.h, 8.v),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgCheckmarkGray90001,
                    height: 33.v,
                    width: 25.h,
                  ),
                ),
                hintText: "How does the AI styling feature \nwork ?",
                onChanged: (value) {},
              ),
              SizedBox(height: 14.v),
              CustomDropDown(
                icon: Container(
                  margin: EdgeInsets.fromLTRB(14.h, 8.v, 11.h, 8.v),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgCheckmarkGray90001,
                    height: 33.v,
                    width: 25.h,
                  ),
                ),
                hintText: "Can I plan my outfits in advance?",
                contentPadding: EdgeInsets.only(
                  left: 11.h,
                  top: 17.v,
                  bottom: 17.v,
                ),
                onChanged: (value) {},
              ),
              SizedBox(height: 15.v),
              CustomDropDown(
                icon: Container(
                  margin: EdgeInsets.fromLTRB(30.h, 8.v, 11.h, 8.v),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgCheckmarkGray90001,
                    height: 33.v,
                    width: 25.h,
                  ),
                ),
                hintText: "Is my data secure with\nDressMeDaily ?",
                onChanged: (value) {},
              ),
              SizedBox(height: 15.v),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.h,
                  vertical: 7.v,
                ),
                decoration: AppDecoration.outlinePrimary5.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        width: 186.h,
                        margin: EdgeInsets.symmetric(vertical: 1.v),
                        child: Text(
                          "Can I use the application without an internet connection?",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgCheckmarkGray90001,
                      height: 33.v,
                      width: 25.h,
                      margin: EdgeInsets.only(left: 17.h),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.v),
              Container(
                margin: EdgeInsets.only(right: 3.h),
                padding: EdgeInsets.symmetric(
                  horizontal: 10.h,
                  vertical: 4.v,
                ),
                decoration: AppDecoration.outlinePrimary5.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        width: 198.h,
                        margin: EdgeInsets.only(top: 6.v),
                        child: Text(
                          "How do I get support if I encounter\nissues or have questions?",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgCheckmarkGray90001,
                      height: 33.v,
                      width: 25.h,
                      margin: EdgeInsets.only(
                        left: 4.h,
                        top: 2.v,
                        bottom: 2.v,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
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
                      Navigator.pop(context); // Navigate back to the previous screen
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20.v, right: 0.h, left: 5.v), // Adjust the margin as needed
                      child: SvgPicture.asset(
                        ImageConstant.imgArrowDown, // Make sure this points to the correct SVG asset
                        height: 25.v,
                        width: 25.h,
                      ),
                    ),
                  ),
                ),

                AppbarSubtitle(
                  text: "FAQ",
                  margin: EdgeInsets.only(left: 120.h),
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
}
