import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/core/Data_model/item_model.dart';
import 'package:sdgp_test01/presentation/User_profile/user_profile.dart';
import 'package:sdgp_test01/presentation/new_file/addtowardrobe_screen.dart';
import 'package:sdgp_test01/presentation/Landing_page/landing_page.dart';

class Searchbar_page extends StatefulWidget {
  @override
  _Searchbar_pageState createState() => _Searchbar_pageState();
}

class _Searchbar_pageState extends State<Searchbar_page> with TickerProviderStateMixin {
  late TabController tabviewController;
  TextEditingController _searchController = TextEditingController();
  List<String> _suggestions = [];
  List<String> _allItems = ['x']; // Replace with your actual data source

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 3, vsync: this);
    _searchController.addListener(_onSearchChanged);
  }
  void _onSearchSubmitted() {
    if (_searchController.text.isNotEmpty) {
      _navigateToBottomSheet(context, _searchController.text);
    }
  }
  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    String query = _searchController.text;
    if (query.isNotEmpty) {
      setState(() {
        _suggestions = _allItems.where((item) => item.toLowerCase().contains(query.toLowerCase())).toList();
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

  void _navigateToBottomSheet(BuildContext context, String selection) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => Search_output()));
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Search Bar'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          Autocomplete<String>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              return _suggestions.where((String option) {
                return option.contains(textEditingValue.text.toLowerCase());
              });
            },
            onSelected: (String selection) {
              _navigateToBottomSheet(context, selection);
            },
            fieldViewBuilder: (BuildContext context, TextEditingController fieldTextEditingController, FocusNode fieldFocusNode, VoidCallback onFieldSubmitted) {
              return  Container(
                width: 200.h,
                padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 3.v),
                decoration: AppDecoration.outlineBlack.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder12,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: fieldTextEditingController,
                        focusNode: fieldFocusNode,
                        decoration: InputDecoration(
                          hintText: "Search",
                          border: InputBorder.none,
                        ),
                        style: TextStyle(fontSize: 16),
                        onChanged: _updateSuggestions,
                        onSubmitted: (_) => _onSearchSubmitted(), // Adjust as per your theme
                      ),
                    ),
                    IconButton(
                      icon: SvgPicture.asset('assets/images/img_searchnormal.svg'), // Replace with your icon path
                      onPressed: () => _navigateToBottomSheet(context, _searchController.text),
                    ),
                  ],
                ),
              );
            },
          ),
          ],
      ),
      bottomNavigationBar: _buildBottomBar(context), // Add the footer here
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
                  MaterialPageRoute(builder: (context) => const LandingPage()), // Replace with your actual screen widget
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
                  MaterialPageRoute(builder: (context) => Searchbar_page()), // Replace with your actual screen widget
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
                  MaterialPageRoute(builder: (context) => const AddtowardrobeScreen()), // Replace with your actual screen widget
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
                  MaterialPageRoute(builder: (context) => const LandingPage()), // Replace with your actual screen widget
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
class Search_output extends StatefulWidget {
  @override
  _Search_outputState createState() => _Search_outputState();
}

class _Search_outputState extends State<Search_output> {
  List<ItemModel> items = List.generate(20, (_) => ItemModel()); // Assuming ItemModel is defined

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Set the background color of the scaffold to transparent
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: 700.h,
        margin: EdgeInsets.only(top: 200),
        decoration: BoxDecoration(
          color: Color(0xFF8B7B7B), // Keep the main container with brown color
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(80),
            topRight: Radius.circular(80),
            bottomLeft: Radius.zero,
            bottomRight: Radius.zero,
          ),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 30,
              child: GestureDetector(
                onVerticalDragEnd: (details) {
                  // Check the drag velocity or distance to decide if the gesture should trigger navigation
                  if (details.primaryVelocity! > 1000) { // Adjust this threshold as needed
                    Navigator.of(context).pop();
                  }
                },
                child: Container(
                  width: 150,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 80),
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 40,
                  runSpacing: 40,
                  alignment: WrapAlignment.center,
                  children: items.map((item) {
                    return Container(
                      width: 120,
                      height: 120,
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: item.isPlaceholder
                          ? SvgPicture.asset('assets/images/clothing_add.svg') // Update path as needed
                          : (item.imageUrl != null)
                          ? Image.network(item.imageUrl!, fit: BoxFit.cover)
                          : Center(child: Text('No Image')),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


