import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/presentation/Starting_page/starting_page.dart'; // Updated import
import 'package:sdgp_test01/presentation/Loading_page_4(initialLoadingScreen)/loading_page_4.dart';

class Initial_loading_page extends StatefulWidget {
  const Initial_loading_page({Key? key}) : super(key: key);

  @override
  _Initial_loading_pageState createState() => _Initial_loading_pageState();
}

class _Initial_loading_pageState extends State<Initial_loading_page> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 3000), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Loading_page_4()), // Navigate to StartingPage
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageConstant.page_pg_1), // Replace with your image asset name
              fit: BoxFit.cover, // This will fill the background with the image
            ),
          ),
        ),
      );

  }
}
