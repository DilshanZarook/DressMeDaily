import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/presentation/Bookmark_page/bookmark_page.dart';
import 'package:sdgp_test01/presentation/Landing_page/landing_page.dart';
import 'package:sdgp_test01/presentation/Main_wardrobe/Main_wardrobe.dart';
import 'package:sdgp_test01/presentation/new_file/addtowardrobe_screen.dart';
import 'package:sdgp_test01/presentation/Searchbar_page/Searchbar_page.dart';
import 'package:sdgp_test01/widgets/app_bar/appbar_title.dart';
import 'package:sdgp_test01/widgets/app_bar/custom_app_bar.dart';
import 'package:sdgp_test01/widgets/custom_bottom_bar.dart';
import 'package:sdgp_test01/widgets/custom_elevated_button.dart';
import 'package:sdgp_test01/widgets/custom_text_form_field_1.dart';

class User_profile extends StatefulWidget {
  const User_profile({Key? key}) : super(key: key);

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
  final String userId = DateFormat('yyyyMMddHHmmss').format(DateTime.now());
  final CollectionReference _userProfileCollection =
      FirebaseFirestore.instance.collection('userProfiles');

  @override
  void initState() {
    super.initState();
    _getUserProfile();
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
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeOutQuad,
    ));
    Future.delayed(const Duration(milliseconds: 200), () {
      _controller!.forward();
    });
  }

  void _onTextChange() {
    if (nameController.text.isNotEmpty ||
        ageController.text.isNotEmpty ||
        bioController.text.isNotEmpty) {
      setState(() =>
          profileImageOffsetX = 0); // Move right if any text field has input
    } else {
      setState(() => profileImageOffsetX =
          100); // Move back to original position if no input
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
      resizeToAvoidBottomInset: true,
      // This is important
      appBar: _buildAppBar(context),
      body: SizedBox(
        height: 700.v, // Adjust height as needed
        width: double.maxFinite,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SlideTransition(
              position: _slideAnimation!,
              child: Container(
                margin: EdgeInsets.only(
                  top: isKeyboardVisible ? 0 : 200.v,
                  // Adjust top margin when keyboard is visible
                  left: 0.h,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 36.h,
                  vertical: 0.v,
                ),
                decoration: const BoxDecoration(
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
              top: isKeyboardVisible ? -200.v : 30.v,
              // Push the profile image up when keyboard is visible
              right: MediaQuery.of(context).size.width / 2 - 80.h,
              child: Container(
                height: 160.v,
                width: 160.h,
                decoration: BoxDecoration(
                  color: appTheme.gray800,
                  borderRadius: BorderRadius.circular(90.h),
                ),
              ),
            ),
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
        SizedBox(height: 20.v),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: isKeyboardVisible
              ? [
                  GestureDetector(
                    onTap: () {
                      // Dismiss the keyboard if it is open
                      FocusScope.of(context).unfocus();
                    },
                    child: Container(
                      height: 20.adaptSize,
                      width: 20.adaptSize,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(ImageConstant.imgClose),
                          // Path to your image
                          fit: BoxFit
                              .cover, // Adjusts the image to fit into the container
                        ),
                      ),
                    ),
                  ),
                ]
              : [],
        ),
        SizedBox(height: 20.v),
        _buildLabel(context, "Name"),
        SizedBox(height: 11.v),
        _buildName(context),
        SizedBox(height: 10.v),
        _buildLabel(context, "Age"),
        SizedBox(height: 9.v),
        _buildAge(context),
        SizedBox(height: 8.v),
        _buildLabel(context, "BIO"),
        SizedBox(height: 11.v),
        _buildBio(context),
        SizedBox(height: 22.v),
        _buildSave(context),
        SizedBox(height: isKeyboardOpen ? 15.5.v : 25.v),
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
      preferredSize: Size.fromHeight(kToolbarHeight + 20.h),
      // Adjust the height as needed
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
              padding: EdgeInsets.only(bottom: 25.v),
              // Add padding above the title
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

  /// Section Widget
  Widget _buildSave(BuildContext context) {
    return CustomElevatedButton(
      width: 64.h,
      text: "Save",
      alignment: Alignment.centerRight,
      onPressed: _saveUserProfile,
    );
  }

  //get user profile data from firestore
  void _getUserProfile() async {
    try {
      DocumentSnapshot<Object?> snapshot =
          (await _userProfileCollection.doc('userid').get()) as DocumentSnapshot<Object?>;

      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;
        nameController.text = data['name'] ?? '';
        ageController.text = data['age'] ?? '';
        bioController.text = data['bio'] ?? '';
      }
    } catch (error) {
      print('Error fetching user profile: $error');
    }
  }

  // send user profile data to firestore
  void _saveUserProfile() async {
    String name = nameController.text;
    String age = ageController.text;
    String bio = bioController.text;

    try {
      await _userProfileCollection.add({
        'userid': userId,
        'name': name,
        'age': age,
        'bio': bio,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('User profile saved successfully'),
        ),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to save user profile: $error'),
        ),
      );
    }
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
            color: appTheme.black990,
            thickness: 2.h,
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
                ImageConstant.Home_footer_Unselected_101,
                height: 35.v, // Adjust the height as needed
                width: 35.v, // Adjust the width as needed
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
                          Searchbar_page()), // Replace with your actual screen widget
                );
              },
              child: SvgPicture.asset(
                ImageConstant.Search_footer,
                height: 35.v, // Adjust the height as needed
                width: 35.v, // Adjust the width as needed
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
                          const AddtowardrobeScreen()), // Replace with your actual screen widget
                );
              },
              child: SvgPicture.asset(
                ImageConstant.Camera_footer_101,
                height: 30.v, // Adjust the height as needed
                width: 30.v, // Adjust the width as needed
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
                          Main_wardrobe()), // Replace with your actual screen widget
                );
              },
              child: SvgPicture.asset(
                ImageConstant.Wardrobe_footer_unselected_1,
                height: 35.v, // Adjust the height as needed
                width: 35.v, // Adjust the width as needed
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
                ImageConstant.User_footer_final,
                height: 35.v, // Adjust the height as needed
                width: 35.v, // Adjust the width as needed
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
                transitionDuration: const Duration(seconds: 0))),
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
        return const User_profile();
      default:
        return const DefaultWidget();
    }
  }
}
