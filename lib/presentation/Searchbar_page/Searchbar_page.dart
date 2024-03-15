import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/presentation/User_profile/user_profile.dart';
import 'package:sdgp_test01/presentation/new_file/addtowardrobe_screen.dart';
import 'package:sdgp_test01/presentation/Landing_page/landing_page.dart';
import 'Search_output.dart'; // Import the Search_output class
import 'dart:async';

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
    // Logic for debounce if needed, but removed automatic navigation
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
    // Navigate based on index if needed
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
          // Additional widget code if necessary...
        ],
      ),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    // Your existing bottom bar implementation...
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(icon: Icon(Icons.home), onPressed: () {}),
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.add), onPressed: () {}),
          IconButton(icon: Icon(Icons.account_circle), onPressed: () {}),
        ],
      ),
    );
  }
}
