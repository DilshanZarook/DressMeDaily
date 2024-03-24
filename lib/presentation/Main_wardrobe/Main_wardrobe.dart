import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/presentation/Bookmark_page/bookmark_page.dart';
import 'package:sdgp_test01/presentation/Landing_page/landing_page.dart';
import 'package:sdgp_test01/presentation/Outfit_page/Outfit_page.dart';
import 'package:sdgp_test01/presentation/Plan_Page/Plan_page.dart';
import 'package:sdgp_test01/presentation/Searchbar_page/Searchbar_page.dart';
import 'package:sdgp_test01/presentation/User_profile/user_profile.dart';
import 'package:sdgp_test01/presentation/Main_settings_page/Main_settings.dart';
import 'package:sdgp_test01/presentation/Wardrobe_page/Wardrobe_page.dart';
import 'package:sdgp_test01/presentation/new_file/addtowardrobe_screen.dart';
import 'package:sdgp_test01/widgets/app_bar/appbar_title.dart';
import 'package:sdgp_test01/widgets/app_bar/appbar_trailing_image.dart';
import 'package:sdgp_test01/widgets/app_bar/custom_app_bar.dart';
import 'package:sdgp_test01/presentation/Nagiavation_animation/Page_animation.dart';

class Main_wardrobe extends StatefulWidget {
  final int initialTabIndex;

  Main_wardrobe({Key? key, this.initialTabIndex = 0}) : super(key: key);

  @override
  _Main_wardrobeState createState() => _Main_wardrobeState();
}

class _Main_wardrobeState extends State<Main_wardrobe>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  TextEditingController _searchController = TextEditingController();
  List<String> _suggestions = [];
  List<String> _allItems = ['x']; // Replace with your actual data source
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SizedBox(
        width: SizeUtils.width,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [

                SizedBox(height: 14.v),
                SizedBox(height: 51.v),
                _buildTabview(context),
                SizedBox(
                  height: 800.v,
                  child: TabBarView(
                    controller: tabviewController,
                    children: [
                      Wardrobe_page(),
                      Outfit_page(),
                      Plan_page(),
                    ],
                  ),
                ),
              ],
            ),
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
      centerTitle: true,
      height: 60.h,
      title: Column(
        children: [
          SizedBox(height: 0.v),
          Padding(
            padding: EdgeInsets.only(
              left: 25.h,
              right: 25.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // This will position the children at the start and end of the row
              children: [
                AppbarTitle(
                  text: "DMD",
                  margin: EdgeInsets.only(bottom: 10.v),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                            const Main_settings()), // Replace Frame624 with the actual widget class for frame 624
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10.0),
                      // Bottom margin of 10
                      child: SvgPicture.asset(
                        ImageConstant.imgMegaphone,
                        // Add appropriate height and width if needed
                      ),
                    ))
              ],
            ),
          ),
          const SizedBox(height: 30),
          Divider(
            thickness: 3.h,
            color: appTheme.black900,
            indent: 0,
            endIndent: 0,
          ),
          // Additional content can go here
        ],
      ),
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
          tabs: [
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
                  ImageConstant.Wardrobe_selected_footer_101,
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
                  ImageConstant.User_Footer_Unselected_101,
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
}
