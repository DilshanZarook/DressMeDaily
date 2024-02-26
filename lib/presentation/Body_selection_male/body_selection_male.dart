import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/presentation/Profile_picture/profile_picture.dart';
import 'package:sdgp_test01/presentation/frame_312_screen/frame_312_screen.dart';
import 'package:sdgp_test01/widgets/app_bar/custom_app_bar.dart';
import 'package:sdgp_test01/presentation/Loading_page_3(BodyToLanding)/loading_page_3.dart' ;



class Body_selection_male extends StatelessWidget {
  const Body_selection_male({Key? key})
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
          padding: EdgeInsets.symmetric(vertical: 62.v),
          child: Column(
            children: [
              SizedBox(
                width: 200.h,
                child: Text(
                  "Select a \nbody type",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge,
                ),
              ),
              Spacer(flex: 50),
              _buildBodyTypeFrame(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Assuming imgFig3 should navigate to Frame241Screen
                  _buildImageTapButton(context, ImageConstant.imgFig3, frameNumber: 241),
                  // Assuming imgFrame324 should navigate to Frame242Screen
                  _buildImageTapButton(context, ImageConstant.imgFrame324, leftMargin: 40.h, frameNumber: 242),
                ],
              ),
              Spacer(flex: 49),
            ],
          ),
        ),

      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Image.asset('assets/images/Line arrow-left.png'), // Replace with your actual arrow image asset path
        onPressed: () {
          Navigator.of(context).pop();
        },
      ), // Replace with your screen's title
      // You can add more AppBar properties if needed
    );
  }

  Widget _buildImageTapButton(BuildContext context, String imagePath, {double leftMargin = 0, required int frameNumber}) {
    return InkWell(
      onTap: () => _navigateToFrame(context, frameNumber),
      child: CustomImageView(
        imagePath: imagePath,
        height: 150.v,
        width: 95.h,
        margin: EdgeInsets.only(left: leftMargin),
      ),
    );
  }
  Widget CustomImageView({
    required String imagePath,
    required double height,
    required double width,
    EdgeInsets margin = EdgeInsets.zero,
  }) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath), // Assuming these are asset images
          fit: BoxFit.cover,
        ),
      ),
    );
  }
  /// Section Widget
  Widget _buildBodyTypeFrame(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildAvatarButton(context, ImageConstant.imgFig1, frameNumber: 241),
        _buildAvatarButton(context, ImageConstant.imgFig4, frameNumber: 242),
        _buildAvatarButton(context, ImageConstant.imgFigurer2RemovebgPreview, frameNumber: 243),
        // Add more avatars as needed, specifying the correct frame number
      ],
    );
  }


  Widget _buildAvatarButton(BuildContext context, String imagePath, {required int frameNumber}) {
    return Expanded(
      child: InkWell(
        onTap: () => _navigateToFrame(context, frameNumber),
        child: CustomImageView(
          imagePath: imagePath,
          height: 200.v,
          width: 50.h,
          margin: EdgeInsets.symmetric(horizontal: 16.h),
        ),
      ),
    );
  }
  void _navigateToFrame(BuildContext context, int frameNumber) {
    Widget frame;
    switch (frameNumber) {
      case 241:
        frame = Loading_page_3(); // Replace with actual screen widget
        break;
      case 242:
        frame = Loading_page_3(); // Replace with actual screen widget
        break;
      case 243:
        frame = Loading_page_3(); // Replace with actual screen widget
        break;
      case 244:
        frame = Loading_page_3(); // Replace with actual screen widget
        break;
      case 245:
      default:
        frame = Loading_page_3(); // Replace with actual screen widget
        break;
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) => frame));
  }
}

