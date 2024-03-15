// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/presentation/Bookmark_page/bookmark_page.dart';
import 'package:sdgp_test01/presentation/Landing_page/landing_page.dart';
import 'package:sdgp_test01/presentation/User_profile/user_profile.dart';
import 'package:sdgp_test01/presentation/frame_720_tab_container_page/combined_frame_720.dart';
import 'package:sdgp_test01/presentation/frame_881_page/frame_881_page.dart';
import 'package:sdgp_test01/presentation/frame_926_page/frame_926_page.dart';
import 'package:sdgp_test01/presentation/new_file/addtowardrobe_screen.dart';
import 'package:sdgp_test01/widgets/app_bar/appbar_title.dart';
import 'package:sdgp_test01/widgets/app_bar/appbar_trailing_image.dart';
import 'package:sdgp_test01/widgets/app_bar/custom_app_bar.dart';

class Frame851TabContainerScreen extends StatefulWidget {
  final int initialTabIndex;

  const Frame851TabContainerScreen({Key? key, this.initialTabIndex = 0})
      : super(key: key);

  @override
  _Frame851TabContainerScreenState createState() =>
      _Frame851TabContainerScreenState();
}

class _Frame851TabContainerScreenState extends State<Frame851TabContainerScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  final TextEditingController _searchController = TextEditingController();
  List<String> _suggestions = [];
  final List<String> _allItems = ['x']; // Replace with your actual data source
  TextEditingController wardrobeNameController = TextEditingController();

  // final FirebaseFirestore firestore = FirebaseFirestore.instance;
  int itemCount = 0; // Default value
  String itemText = "";
  late AnimationController _rotationController;
  late AnimationController _animationController;
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    tabviewController = TabController(
        length: 3, vsync: this, initialIndex: widget.initialTabIndex);
    _animationController = AnimationController(
      duration: const Duration(seconds: 2), // Adjust the duration as needed
      vsync: this,
    );

    // If you want the animation to start immediately
    _animationController.forward();
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    wardrobeNameController.dispose();
    _searchController.dispose();
    tabviewController.dispose();
    _searchController.dispose();
    _rotationController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  // Future<Map<String, dynamic>> fetchWashingDataFromBackend() async {
  //   var snapshot = await firestore.collection('washing_collection').doc('washing_doc').get();
  //   return snapshot.data() as Map<String, dynamic>; // Ensure the data exists and is cast to the correct type.
  // }
  //
  // Future<Map<String, dynamic>> fetchAllDataFromBackend() async {
  //   var snapshot = await firestore.collection('your_collection').doc('your_doc').get();
  //   return snapshot.data() as Map<String, dynamic>;
  // }

  // void updateContentForWashing() async {
  //   var data = await fetchWashingDataFromBackend();
  //   setState(() {
  //     itemCount = data['count'];
  //     itemText = "Washing";
  //   });
  // }
  //
  // void updateContentForAll() async {
  //   var data = await fetchAllDataFromBackend();
  //   setState(() {
  //     itemCount = data['count'];
  //     itemText = "Clothes";
  //   });
  // }

  void _onSearchChanged() {
    String query = _searchController.text;
    if (query.isNotEmpty) {
      setState(() {
        _suggestions = _allItems
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    } else {
      setState(() {
        _suggestions = [];
      });
    }
  }

  void _updateSuggestions(String query) {
    if (query.isEmpty) {
      setState(() {
        _suggestions.clear();
      });
    } else {
      setState(() {
        _suggestions = _allItems
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SizedBox(
        width: SizeUtils.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  return _suggestions.where((String option) {
                    return option
                        .contains(textEditingValue.text.toLowerCase());
                  });
                },
                onSelected: (String selection) {
                  debugPrint('You just selected $selection');
                },
                fieldViewBuilder: (BuildContext context,
                    TextEditingController fieldTextEditingController,
                    FocusNode fieldFocusNode,
                    VoidCallback onFieldSubmitted) {
                  return Container(
                    width: 200.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.h, vertical: 3.v),
                    decoration: AppDecoration.outlineBlack.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder12,
                    ),
                    child: TextField(
                      controller: fieldTextEditingController,
                      focusNode: fieldFocusNode,
                      decoration: const InputDecoration(
                        hintText: "Search",
                        border: InputBorder.none,
                        isDense: true,
                      ),
                      style: theme.textTheme.bodyLarge,
                      onChanged: _updateSuggestions,
                    ),
                  );
                },
              ),
              SizedBox(height: 14.v),
              Divider(
                color: appTheme.black990,
                thickness: 2.h,
              ),
              SizedBox(height: 51.v),
              _buildTabview(context),
              SizedBox(
                height: 800.v,
                child: TabBarView(
                  controller: tabviewController,
                  children: [
                    const Frame720Page(),
                    Frame881Page(),
                    const Frame926Page(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.h),
        child: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 71.v,
      title: AppbarTitle(
        text: "DMD",
        margin: EdgeInsets.only(left: 43.h),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgMegaphone,
          margin: EdgeInsets.symmetric(
            horizontal: 44.h,
            vertical: 12.v,
          ),
        ),
      ],
    );
  }

  Widget _buildTabview(BuildContext context) {
    return Container(
      height: 23.v,
      width: 320.h,
      decoration: BoxDecoration(
        color: Colors.white, // Background color of the TabBar
        borderRadius: BorderRadius.circular(20), // Rounded corners
      ),
      child: ClipRRect(
        // Clip the child view to the rounded corners
        borderRadius: BorderRadius.circular(20),
        child: TabBar(
          controller: tabviewController,
          labelPadding: EdgeInsets.zero,
          labelColor: Colors.black,
          // Selected tab text color
          unselectedLabelColor: Colors.blueGrey[300],
          // Unselected tab text color
          indicatorSize: TabBarIndicatorSize.tab,
          // Indicator width to tab width
          indicatorWeight: 1.0,
          // Height of the indicator
          indicatorColor: Colors.black,
          // Color of the indicator line
          tabs: const [
            Tab(
              child: Text(
                "Wardrobe",
              ),
            ),
            Tab(
              child: Text(
                "Outfit",
              ),
            ),
            Tab(
              child: Text(
                "Plan",
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
                            Bookmark_page()), // Replace with your actual screen widget
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
                            const Frame851TabContainerScreen()), // Replace with your actual screen widget
                  );
                },
                child: SvgPicture.asset(
                  ImageConstant.Wardrobe_selected_footer_101,
                  height: 32.v, // Adjust the height as needed
                  width: 32.v, // Adjust the width as needed
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
                  ImageConstant.User_Footer_Unselected_101,
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
}
