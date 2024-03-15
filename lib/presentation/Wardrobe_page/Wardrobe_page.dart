import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/presentation/Outfit_classification/Carouselpopup_outfit.dart';
import 'package:sdgp_test01/presentation/frame_406_bottomsheet/frame_406_bottomsheet.dart';
import 'package:sdgp_test01/presentation/Main_wardrobe/Main_wardrobe.dart';

class Wardrobe_page extends StatefulWidget {
  const Wardrobe_page({Key? key}) : super(key: key);

  @override
  Wardrobe_pageState createState() => Wardrobe_pageState();
}

class Wardrobe_pageState extends State<Wardrobe_page>
    with
        AutomaticKeepAliveClientMixin<Wardrobe_page>,
        SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  TextEditingController wardrobeNameController = TextEditingController();
  int itemCount = 0;
  String itemText = "";

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 5), // Adjust the duration as needed
      vsync: this,
    );
    // Fetch the count of items from Firebase Storage
    _fetchItemCountFromFirebase().then((count) {
      setState(() {
        itemCount = count;
      });
    });
  }

  Future<int> _fetchItemCountFromFirebase() async {
    String folderPath = "wardrobe";
    firebase_storage.ListResult result = await firebase_storage
        .FirebaseStorage.instance
        .ref(folderPath)
        .listAll();
    return result.items.length;
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    super.build(context); // Required when using AutomaticKeepAliveClientMixin
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: double.maxFinite,
              decoration: AppDecoration.fillWhiteA,
              child: Column(
                children: [
                  SizedBox(height: 51.v),
                  _buildFrame(context),
                  SizedBox(height: 24.v),
                  _buildCombinedFrame(context),
                  SizedBox(height: 24.v),
                ],
              ),
            ),
            // _buildStickyCustomIconButtonTop(context),
          ],
        ),
      ),
    );
  }

  void _showAllClothesPopup(BuildContext context) {
    showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return const Frame406Bottomsheet();
      },
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      transitionDuration: const Duration(milliseconds: 600),
      transitionBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
    );
  }

  //
  Widget _buildStickyCustomIconButtonTop(BuildContext context) {
    return Positioned(
      top: 50.0, // Top offset
      right: 50.0, // Right offset
      child: GestureDetector(
        onTap: () {
          // Using the showGeneralDialog method with the SlideTransition animation
          showGeneralDialog(
            context: context,
            pageBuilder: (BuildContext buildContext,
                Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return const Frame406Bottomsheet();
            },
            barrierDismissible: true,
            barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
            transitionDuration: const Duration(milliseconds: 600),
            transitionBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          );
        },
        child: Container(
          height: 35.adaptSize,
          width: 80.adaptSize,
          padding: EdgeInsets.all(6.h),
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(40),
          ),
          child: const Text(
            "Archive",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 28.h,
        right: 25.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  _showAllClothesPopup(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFd8d8d8), // Peach color
                    borderRadius:
                    BorderRadius.circular(20), // Border radius of 20
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgFrame682,
                    height: 140.adaptSize,
                    width: 140.adaptSize,
                  ),
                ),
              ),
              SizedBox(height: 9.v),
              Text(
                "All clothes",
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30.v),
            child: GestureDetector(
              onTap: () {
                showCarouselDialog(context);
              },
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFd8d8d8), // Gray color (not Peach)
                      borderRadius:
                      BorderRadius.circular(20), // Border radius of 20
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      // Clip the child with the same radius
                      child: CustomImageView(
                        imagePath: ImageConstant.outfit_AI,
                        height: 140.adaptSize,
                        width: 140.adaptSize,
                      ),
                    ),
                  ),
                  SizedBox(height: 9.v),
                  Text(
                    "Outfit Classification",
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame1(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 104.h,
          vertical: 20.v,
        ),
        decoration: AppDecoration.fillWhiteA.copyWith(
          borderRadius: BorderRadiusStyle.customBorderTL30,
        ),
        child: Text(
          "Profile",
          style: CustomTextStyles.bodyLarge18,
        ),
      ),
    );
  }

  /// Section Widget

  void _showWardrobeNamePopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Name of the wardrobe'),
          content: TextField(
            controller: wardrobeNameController,
            decoration: const InputDecoration(hintText: "Enter wardrobe name"),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: const Text('Submit'),
              onPressed: () {
                // Handle the submission here
                print('Wardrobe Name: ${wardrobeNameController.text}');
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildCombinedFrame(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // White color container
        borderRadius: BorderRadius.circular(30), // Adjust as per your style
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildFrame1(context),
          SizedBox(
            height: 280.v,
            width: double.maxFinite,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 400.v,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: appTheme.blueGray100,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 270.v,
                    width: 270.h,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: RotationTransition(
                            turns: _animationController,
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20.h, vertical: 20.h),
                              padding: EdgeInsets.all(11.h),
                              decoration:
                              AppDecoration.outlineLightGreenA.copyWith(
                                borderRadius: BorderRadiusStyle.circleBorder105,
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 18.h,
                                  vertical: 18.v,
                                ),
                                decoration: AppDecoration.fillGray.copyWith(
                                  borderRadius:
                                  BorderRadiusStyle.circleBorder90,
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 55.v,
                                    vertical: 45.v,
                                  ),
                                  decoration:
                                  AppDecoration.fillGray300.copyWith(
                                    borderRadius: BorderRadius.circular(200),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "$itemCount",
                                        style: theme.textTheme.headlineSmall,
                                      ),
                                      Text(
                                        itemText,
                                        style: CustomTextStyles.bodySmall10,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgPolygon3,
                          height: 70.v,
                          width: 62.h,
                          radius: BorderRadius.circular(10.h),
                          alignment: Alignment.bottomCenter,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 20.v,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: appTheme.blueGray100,
              ),
            ),
          ),
          const SizedBox(height: 40), // Spacer

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  // updateContentForAll();
                  // Navigation logic for "All" button
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  Main_wardrobe()),
                  );
                },
                child: Container(
                  width: 68.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey[500],
                    // Background color
                    borderRadius: BorderRadius.circular(40),
                    // Border radius of 40
                    border: Border.all(color: Colors.white), // Border color
                  ),
                  child: const Text(
                    "All",
                    style: TextStyle(
                      color: Colors.white, // Text color white
                      fontSize: 16, // Font size 16
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 40), // Spacer
              GestureDetector(
                onTap: () {
                  // updateContentForWashing();
                  // Navigation logic for "Washing" button
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  Main_wardrobe()),
                  );
                },
                child: Container(
                  height: 25.v,
                  width: 71.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey[500],
                    // Background color
                    borderRadius: BorderRadius.circular(40),
                    // Border radius of 40
                    border: Border.all(color: Colors.white), // Border color
                  ),
                  child: const Text(
                    "Washing",
                    style: TextStyle(
                      color: Colors.white, // Text color white
                      fontSize: 16, // Font size 16
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 40), // Spacer
              Container(
                height: 25.v,
                width: 66.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 23.h,
                  vertical: 3.v,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[500], // Background color
                  borderRadius:
                  BorderRadius.circular(40), // Border radius of 40
                ),
                child: CustomImageView(
                  imagePath: ImageConstant.img_plus,
                  height: 19.adaptSize,
                  width: 19.adaptSize,
                  alignment: Alignment.center,
                ),
              ),
            ],
          ),
          const SizedBox(height: 60), // Spacer
        ],
      ),
    );
  }
}
