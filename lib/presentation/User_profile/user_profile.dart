import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:DressMeDaily/core/app_export.dart';
import 'package:DressMeDaily/presentation/Landing_page/landing_page.dart';
import 'package:DressMeDaily/presentation/Main_wardrobe/Main_wardrobe.dart';
import 'package:DressMeDaily/presentation/new_file/addtowardrobe_screen.dart';
import 'package:DressMeDaily/presentation/Searchbar_page/Searchbar_page.dart';
import 'package:DressMeDaily/widgets/app_bar/appbar_title.dart';
import 'package:DressMeDaily/widgets/app_bar/custom_app_bar.dart';
import 'package:DressMeDaily/widgets/custom_bottom_bar.dart';
import 'package:DressMeDaily/widgets/custom_elevated_button.dart';
import 'package:DressMeDaily/widgets/custom_text_form_field_1.dart';
import 'package:DressMeDaily/presentation/Nagiavation_animation/Page_animation.dart';

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
  String? profilePictureUrl;

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
    _getImageUrl().then((url) {
      if (url != null) {
        setState(() {
          profilePictureUrl = url;
        });
      }
    });
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
      profileImageOffsetX = 0);
    } else {
      setState(() => profileImageOffsetX =
      100);
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
        height: 800.v, // Adjust height as needed
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
                  color: Color(0xFFcdfb4a),
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
              right: MediaQuery.of(context).size.width / 2 - 80.h,
              child: Container(
                height: 160.v,
                width: 160.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90.h),
                  image: profilePictureUrl != null
                      ? DecorationImage(
                    image: NetworkImage(profilePictureUrl!),
                    fit: BoxFit.cover,
                  )
                      : null,
                  color: profilePictureUrl == null ? appTheme.gray800 : Colors.transparent,
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
                FocusScope.of(context).unfocus();
              },
              child: Container(
                height: 35.adaptSize,
                width: 35.adaptSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: SvgPicture.asset(
                    'assets/images/img_close.svg',
                    fit: BoxFit.cover,
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
        SizedBox(height: 29.v),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildlogout(context),
            _buildSave(context),
          ],
        ),
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

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight + 20.h),
      // Adjust the height as needed
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomAppBar(

            title: Padding(
              padding: EdgeInsets.only(bottom: 25.v),
              // Add padding above the title
              child: Center( // Center the AppbarTitle
                child: AppbarTitle(text: "User Profile"),
              ),
            ),
          ),
          SizedBox(
            width: 360.h,
            height: 1.h,
            child: Divider(
              color: appTheme.black900,
              thickness: 2.h,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildName(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.h),
      child: CustomTextFormField(
        focusNode: nameFocusNode,
        controller: nameController,
        hintText: nameController.text.isEmpty ? 'Enter name' : nameController.text,
      ),
    );
  }

  Widget _buildAge(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.h),
      child: CustomTextFormField(
        focusNode: ageFocusNode,
        controller: ageController,
        hintText: ageController.text.isEmpty ? 'Enter age' : ageController.text,
      ),
    );
  }

  Widget _buildBio(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.h),
      child: CustomTextFormField(
        focusNode: bioFocusNode,
        controller: bioController,
        textInputAction: TextInputAction.done,
        hintText: bioController.text.isEmpty ? 'Enter bio' : bioController.text,
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

  Widget _buildlogout(BuildContext context) {
    return CustomElevatedButton(
      width: 64.h,
      text: "log out",
      alignment: Alignment.centerLeft,
      onPressed: _saveUserProfile,
    );
  }

  // get user profile from firestore
  Future<String?> _getImageUrl() async {
    try {
      final storageRef =
      firebase_storage.FirebaseStorage.instance.ref().child('Profile_Images');
      final result = await storageRef.listAll();
      if (result.items.isNotEmpty) {
        final firstImageRef = result.items.last;
        final url = await firstImageRef.getDownloadURL();
        return url;
      } else {
        // No images found in the folder
        return null;
      }
    } catch (error) {
      print('Error getting image: $error');
      return null;
    }
  }

  //get user profile data from firestore
  void _getUserProfile() async {
    try {
      DocumentSnapshot<Object?> snapshot =
      await _userProfileCollection.doc(userId).get();

      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data()! as Map<String, dynamic>;
        setState(() {
          nameController.text = data['name'] ?? '';
          ageController.text = data['age'] ?? '';
          bioController.text = data['bio'] ?? '';
        });
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
      await _userProfileCollection.doc(userId).set({
        'name': name,
        'age': age,
        'bio': bio,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User profile saved successfully')),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save user profile: $error')),
      );
    }
  }

}



// ignore_for_file: must_be_immutable


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
              color: appTheme.black990,
              thickness: 2.h,
            ),
          ),
          SizedBox(height: 10.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image button 1
              InkWell(
                onTap: () {
                  final renderBox = context.findRenderObject() as RenderBox;
                  final position = renderBox.localToGlobal(Offset.zero);
                  final size = renderBox.size;
                  Navigator.push(
                    context,
                    RadialRevealRoute(
                      page: const LandingPage(),
                      origin: position & size,
                    ),
                  );
                },
                child: SvgPicture.asset(
                  ImageConstant.Home_footer_Unselected_101,
                  height: 35.v,
                  width: 35.v,
                  fit: BoxFit.cover,
                ),
              ),InkWell(
                onTap: () {
                  final renderBox = context.findRenderObject() as RenderBox;
                  final position = renderBox.localToGlobal(Offset.zero);
                  final size = renderBox.size;
                  Navigator.push(
                    context,
                    RadialRevealRoute(
                      page:  Searchbar_page(),
                      origin: position & size,
                    ),
                  );
                },
                child: SvgPicture.asset(
                  ImageConstant.Search_footer,
                  height: 35.v,
                  width: 35.v,
                  fit: BoxFit.cover,
                ),
              ),InkWell(
                onTap: () {
                  final renderBox = context.findRenderObject() as RenderBox;
                  final position = renderBox.localToGlobal(Offset.zero);
                  final size = renderBox.size;
                  Navigator.push(
                    context,
                    RadialRevealRoute(
                      page:  AddtowardrobeScreen(),
                      origin: position & size,
                    ),
                  );
                },
                child: SvgPicture.asset(
                  ImageConstant.Camera_footer_101,
                  height: 30.v,
                  width: 30.v,
                  fit: BoxFit.cover,
                ),
              ),InkWell(
                onTap: () {
                  final renderBox = context.findRenderObject() as RenderBox;
                  final position = renderBox.localToGlobal(Offset.zero);
                  final size = renderBox.size;
                  Navigator.push(
                    context,
                    RadialRevealRoute(
                      page:  Main_wardrobe(),
                      origin: position & size,
                    ),
                  );
                },
                child: SvgPicture.asset(
                  ImageConstant.Wardrobe_footer_unselected_1,
                  height: 35.v,
                  width: 35.v,
                  fit: BoxFit.cover,
                ),
              ),InkWell(
                onTap: () {
                  final renderBox = context.findRenderObject() as RenderBox;
                  final position = renderBox.localToGlobal(Offset.zero);
                  final size = renderBox.size;
                  Navigator.push(
                    context,
                    RadialRevealRoute(
                      page:  User_profile(),
                      origin: position & size,
                    ),
                  );
                },
                child: SvgPicture.asset(
                  ImageConstant.User_footer_selected_101_f,
                  height: 35.v,
                  width: 35.v,
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
  ///Handling route based on bottom click actions

