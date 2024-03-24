import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/presentation/User_profile/user_profile.dart';
import 'package:sdgp_test01/presentation/new_file/addtowardrobe_screen.dart';
import 'package:sdgp_test01/presentation/Landing_page/landing_page.dart';
import 'package:sdgp_test01/presentation/Main_wardrobe/Main_wardrobe.dart';
import 'Search_output.dart'; // Import the Search_output class
import 'dart:async';
import 'package:sdgp_test01/presentation/Nagiavation_animation/Page_animation.dart';

class Searchbar_page extends StatefulWidget {
  @override
  _Searchbar_pageState createState() => _Searchbar_pageState();
}

class _Searchbar_pageState extends State<Searchbar_page> with TickerProviderStateMixin {
  late TabController tabviewController;
  TextEditingController _searchController = TextEditingController();
  Timer? _debounce;
  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 3, vsync: this);
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
  }

  void _performSearch() {
    if (_searchController.text.isNotEmpty) {
      _navigateToBottomSheet(context, _searchController.text);
    }
  }

  void _navigateToBottomSheet(BuildContext context, String imageName) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => Search_output(imageName: imageName))
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    tabviewController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(title: Text('Search Bar'));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: "Search",
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _performSearch,
                ),
              ),
              onSubmitted: (value) => _performSearch(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(context),
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
                  ImageConstant.Search_S,
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
