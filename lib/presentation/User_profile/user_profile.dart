import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/presentation/Landing_page/landing_page.dart';
import 'package:sdgp_test01/widgets/app_bar/appbar_title.dart';
import 'package:sdgp_test01/widgets/app_bar/custom_app_bar.dart';
import 'package:sdgp_test01/widgets/custom_elevated_button.dart';
import 'package:sdgp_test01/widgets/custom_text_form_field_1.dart';
import 'package:sdgp_test01/widgets/custom_bottom_bar.dart';
import 'package:sdgp_test01/presentation/Bookmark_page/bookmark_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class User_profile extends StatefulWidget {
  User_profile({Key? key}) : super(key: key);

  @override
  _User_profileState createState() => _User_profileState();
}
class _User_profileState extends State<User_profile> with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); // Moved inside the class
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  double profileImageOffsetX = 0; // Initial value set to 0
  bool isKeyboardVisible = false;
  AnimationController? _controller;
  Animation<Offset>? _slideAnimation;
  late FocusNode myFocusNode;
  late FocusNode nameFocusNode;
  late FocusNode ageFocusNode;
  late FocusNode bioFocusNode;
  bool isKeyboardOpen = false;

  // sign user out method
  Future<void> signUserOut() async {
    FirebaseAuth.instance.signOut();
  }

  @override
  void initState() {
    super.initState();
    nameController.addListener(_onTextChange);
    ageController.addListener(_onTextChange);
    bioController.addListener(_onTextChange);
    myFocusNode = FocusNode();
    myFocusNode.unfocus();
    nameFocusNode = FocusNode();
    ageFocusNode = FocusNode();
    bioFocusNode = FocusNode();
    WidgetsBinding.instance.addObserver(this);
    Future.delayed(Duration.zero, () {
      if (mounted) {
        setState(() {
          nameFocusNode.unfocus();
          ageFocusNode.unfocus();
          bioFocusNode.unfocus();
        });
      }
    });

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeOutQuad,
    ));
    Future.delayed(Duration(milliseconds: 200), () {
      _controller!.forward();
    });
  }

  void _onTextChange() {
    if (nameController.text.isNotEmpty || ageController.text.isNotEmpty || bioController.text.isNotEmpty) {
      setState(() => profileImageOffsetX = 0); // Move right if any text field has input
    } else {
      setState(() => profileImageOffsetX = 100); // Move back to original position if no input
    }
  }

  @override
  void dispose() {
    nameController.removeListener(_onTextChange);
    nameController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    ageController.removeListener(_onTextChange);
    ageController.dispose();
    bioController.removeListener(_onTextChange);
    bioController.dispose();
    _controller?.dispose();
    myFocusNode.dispose();
    nameFocusNode.dispose();
    ageFocusNode.dispose();
    bioFocusNode.dispose();

    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    final newKeyboardOpen = bottomInset > 0.0;

    if (newKeyboardOpen != isKeyboardOpen) {
      setState(() {
        isKeyboardOpen = newKeyboardOpen;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true, // This is important
      appBar: _buildAppBar(context),
      body: SizedBox(
        height: 750.v, // Adjust height as needed
        width: double.maxFinite,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  SlideTransition(
                    position: _slideAnimation!,
                    child: Container(
                      margin: EdgeInsets.only(
                        top: isKeyboardVisible ? 0 : 160.v, // Adjust top margin when keyboard is visible
                        left: 0.h,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 36.h,
                        vertical: 0.v,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.lime,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(200),
                          topRight: Radius.circular(200),
                        ),
                      ),
                      child: _buildUserProfileForm(context),
                    ),
                  ),
                  Positioned(
                    top: isKeyboardVisible ? -120.v : 30.v, // Adjust this value as needed
                    child: Container(
                      height: 120.v,
                      width: 120.h,
                      decoration: BoxDecoration(
                        color: appTheme.gray800,
                        borderRadius: BorderRadius.circular(60.h), // Adjust radius as needed
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _buildLogout(context),
            SizedBox(height: isKeyboardOpen ? 5.5.v : 20.v), // Ensure this is outside the Stack
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }


  Widget _buildUserProfileForm(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isKeyboardVisible) // Display the close button only when keyboard is visible
          Center(
            child: GestureDetector(
              onTap: () {
                // Dismiss the keyboard if it is open
                FocusScope.of(context).unfocus();
              },
              child: Container(
                height: 35.adaptSize,
                width: 35.adaptSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageConstant.imgClose), // Path to your image
                    fit: BoxFit.cover, // Adjusts the image to fit into the container
                  ),
                ),
              ),
            ),
          ),
        SizedBox(height: isKeyboardVisible ? 10.v : 35.v),
        _buildLabel(context, "Name"),
        SizedBox(height: 5.v),
        _buildName(context),
        SizedBox(height: 5.v),
        _buildLabel(context, "Age"),
        SizedBox(height: 5.v),
        _buildAge(context),
        SizedBox(height: 5.v),
        _buildLabel(context, "BIO"),
        SizedBox(height: 5.v),
        _buildBio(context),
        SizedBox(height: 25.v),
        _buildSave(context),
        SizedBox(height: isKeyboardOpen ? 14.5.v : 20.v),
      ],
    );
  }

  Widget _buildLabel(BuildContext context, String label) {
    return Padding(
      padding: EdgeInsets.only(left: 10.h),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight + 20.h), // Adjust the height as needed
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomAppBar(
            // leadingWidth: 40.h,
            // leading: GestureDetector(
            //   onTap: () {
            //     Navigator.pop(context); // Navigate back to the previous screen
            //   },
            //   // child: Container(
            //   //   margin: EdgeInsets.only(bottom: 25.v, right: 0.h, left: 5.v), // Adjust the margin as needed
            //   //   child: SvgPicture.asset(
            //   //     ImageConstant.imgArrowDown, // Make sure this points to the correct SVG asset
            //   //     height: 20.v,
            //   //     width: 20.h,
            //   //   ),
            //   // ),
            // ),
            // centerTitle: true,
            title: Padding(
              padding: EdgeInsets.only(bottom: 25.v,left: 120.v), // Add padding above the title
              child: AppbarTitle(text: "User Profile"),
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

  /// Section Widget
  Widget _buildName(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.h),
      child: CustomTextFormField(
        focusNode: nameFocusNode,
        controller: nameController,
      ),
    );
  }

  /// Section Widget
  Widget _buildAge(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.h),
      child: CustomTextFormField(
        focusNode: ageFocusNode,
        controller: ageController,
      ),
    );
  }

  /// Section Widget
  Widget _buildBio(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.h),
      child: CustomTextFormField(
        focusNode: bioFocusNode,
        controller: bioController,
        textInputAction: TextInputAction.done,
      ),
    );
  }

  Widget _buildSave(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomElevatedButton(
          width: 64.h,
          text: "Save",
          alignment: Alignment.centerRight,
        ),
      ],
    );
  }

  Widget _buildLogout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            // Implement logout functionality here
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Log out'),
                  content: Text('Are you sure you want to log out?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        signUserOut();
                      },
                      child: Text(
                        'Log out',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                );
              },
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Log out',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ],
    );
  }


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
                  MaterialPageRoute(builder: (context) => Landing_page()), // Replace with your actual screen widget
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
                  MaterialPageRoute(builder: (context) => Landing_page()), // Replace with your actual screen widget
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
                  MaterialPageRoute(builder: (context) => Landing_page()), // Replace with your actual screen widget
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
                  MaterialPageRoute(builder: (context) => User_profile()), // Replace with your actual screen widget
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



// ignore_for_file: must_be_immutable
class Frame395ContainerScreen extends StatelessWidget {
  Frame395ContainerScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Navigator(
            key: navigatorKey,
            initialRoute: AppRoutes.user_profile,
            onGenerateRoute: (routeSetting) => PageRouteBuilder(
                pageBuilder: (ctx, ani, ani1) =>
                    getCurrentPage(routeSetting.name!),
                transitionDuration: Duration(seconds: 0))),
        bottomNavigationBar: _buildBottomBar(context));
  }

  /// Section Widget

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Settings:
        return "/";
      case BottomBarEnum.Bookmarkssimple:
        return AppRoutes.user_profile;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.user_profile:
        return User_profile();
      default:
        return DefaultWidget();
    }
  }
}