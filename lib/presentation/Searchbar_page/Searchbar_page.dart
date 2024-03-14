mport 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _searchController.dispose();
    tabviewController.dispose(); // Don't forget to dispose the controller
    super.dispose();
  }

  void _navigateToBottomSheet(BuildContext context, String imageName) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => Search_output(imageName: imageName))
    );
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
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: "Search",
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => _navigateToBottomSheet(context, _searchController.text),
                ),
              ),
              onSubmitted: (value) => _navigateToBottomSheet(context, value),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    // Add the implementation of the bottom bar here
    // This is a placeholder, replace with your actual bottom bar code
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