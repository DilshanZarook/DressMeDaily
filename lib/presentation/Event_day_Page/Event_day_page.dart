import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:DressMeDaily/core/app_export.dart';
import 'package:DressMeDaily/new_file/addtowardrobe_screen.dart';
import 'package:DressMeDaily/presentation/Landing_page/landing_page.dart';
import 'package:DressMeDaily/presentation/Main_wardrobe/Main_wardrobe.dart';
import 'package:DressMeDaily/presentation/Searchbar_page/Searchbar_page.dart';
import 'package:DressMeDaily/presentation/User_profile/user_profile.dart';
import 'package:DressMeDaily/presentation/frame_404_bottomsheet/frame_404_bottomsheet.dart';
import 'package:DressMeDaily/presentation/Global/global.dart' as globals;

class Event_day_page extends StatefulWidget {
  final DateTime selectedDate;
  final GlobalKey<NavigatorState> navigatorKey;
  bool isSelectedSwitch = false;

  Event_day_page({
    Key? key,
    required this.selectedDate,
    GlobalKey<NavigatorState>? navigatorKey,
  })  : navigatorKey = navigatorKey ?? GlobalKey(),
        super(key: key);

  @override
  _Event_day_pageState createState() => _Event_day_pageState();
}

class _Event_day_pageState extends State<Event_day_page> {
  bool isSelectedSwitch = false;
  bool isSelectedSwitch1 = false;
  TextEditingController searchnormalController = TextEditingController();
  bool isFlickering = false;
  String eventTitle = '';
  bool isAllDay = false;
  String notificationTime = 'Add a notification';
  String description = '';
  ValueNotifier<ItemModel?> selectedItemNotifier;
  _Event_day_pageState() : selectedItemNotifier = ValueNotifier(globals.selectedItem);


  @override
  void initState() {
    super.initState();
    // Listen for changes in the text field
    searchnormalController.addListener(() {
      if (searchnormalController.text.isNotEmpty && !isFlickering) {
        setState(() {
          isFlickering = true; // Trigger flicker effect
        });
        // Add logic here to start flickering effect
      } else if (searchnormalController.text.isEmpty && isFlickering) {
        setState(() {
          isFlickering = false; // Stop flicker effect
        });
        // Add logic here to stop flickering effect
      }
    });
  }

  @override
  void dispose() {
    // Dispose the controller when the widget is removed
    searchnormalController.dispose();
    selectedItemNotifier.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
            width: SizeUtils.width,
            child: SingleChildScrollView(
                child: Container(
                    child: Stack(alignment: Alignment.topCenter, children: [
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              padding: EdgeInsets.symmetric(vertical: 23.v),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 33.h, right: 13.h),
                                    ),
                                    SizedBox(height: 42.v),
                                    SizedBox(height: 18.v),
                                    _buildFrame3(context),
                                    SizedBox(height: 13.v),
                                    _buildEventTitleInput(context),
                                    SizedBox(height: 8.v),
                                    SizedBox(height: 6.v),
                                    SizedBox(height: 6.v),
                                    SizedBox(height: 10.v),
                                    SizedBox(height: 13.v),
                                    Divider(),
                                    SizedBox(height: 7.v),
                                    _buildDescriptionSection(context),
                                    // Display the description text
                                    if (description.isNotEmpty)
                                      Padding(
                                        padding: EdgeInsets.all(25.0),
                                        child: Text(
                                          description,
                                          style: TextStyle(
                                              fontSize:
                                              16), // Adjust the style as needed
                                        ),
                                      ),
                                    SizedBox(height: 15.v),
                                    Divider(),
                                    SizedBox(height: 27.v),
                                    SizedBox(height: 17.v),
                                    SizedBox(height: 10.v),
                                    _buildFrame5(context),
                                    SizedBox(height: 24.v),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        FloatingActionButton(
                                          onPressed: () {
                                            globals.setSelectedItem(null); // Reset the selected item
                                          },
                                          child: Image.asset('assets/images/reset_btn.jpg'), // Using local asset image for the reset button
                                          backgroundColor: Colors.transparent, // Making background transparent
                                          elevation: 0, // Removing shadow if needed
                                        ),
                                        FloatingActionButton(
                                          onPressed: () => _showItemDetailsPopup(context),
                                          child: Image.asset('assets/images/details_btn.png'), // Using local asset image for the details button
                                          backgroundColor: Colors.transparent, // Making background transparent
                                          elevation: 0, // Removing shadow if needed
                                        ),
                                      ],
                                    )

                                  ])))
                    ])))),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.h),
        ),
);
  }

  Widget _buildFrame3(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(left: 34.h, right: 14.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                onTapImgClose(context);
              },
              child: Container(
                height: 17.adaptSize, // Adjust the height as needed
                width: 17.adaptSize, // Adjust the width as needed
                margin: EdgeInsets.symmetric(vertical: 4.v),
                child: SvgPicture.asset(
                  ImageConstant.imgClose, // Replace with your asset path
                  fit: BoxFit.cover, // Adjust the fit as per your requirement
                ),
              ),
            ),
            TextButton(
              child: Text(
                'Save',
                style:
                TextStyle(color: Colors.white), // Add text color if needed
              ),
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFF9d9d9d), // Setting the background color
                padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 5.v),
              ),
              onPressed: () {
                _showSavePopup(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showSavePopup(BuildContext context) async {
    // Directly use globals.selectedItem as it's the ItemModel object
    ItemModel? selectedItem = globals.selectedItem;

    if (selectedItem != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Save'),
            content: Text('Your changes have been saved.'),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'OK',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        },
      );

      // Send details to Firestore database
      await FirebaseFirestore.instance.collection('UserEventDetails').add({
        'EventDate': widget.selectedDate.toIso8601String().substring(0, 10),
        'EventTitle': eventTitle,
        'EventDescription': description,
        'outfitName': selectedItem.outfitName,
        'topWear': selectedItem.topWearImageUrl,
        'bottomWear': selectedItem.bottomWearImageUrl,
      });
    } else {

      // Handle the case when selectedItem is null
      print("Selected item is null");
    }
  }

  Widget _buildEventTitleInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 59.h),
      child: TextFormField(
        initialValue: eventTitle,
        style: theme.textTheme.bodyLarge,
        decoration: InputDecoration(
          hintText: "Add event title",
          border: InputBorder.none, // No border
          contentPadding: EdgeInsets.zero, // Adjust padding if necessary
        ),
        onChanged: (value) {
          // Update the event title when the text changes
          setState(() {
            eventTitle = value;
          });
        },
      ),
    );
  }

  Widget _buildDescriptionSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.h),
      child: Row(
        children: [
          Container(
            child: SvgPicture.asset(ImageConstant.imgFrame114),
            height: 34.v,
            width: 41.h,
          ),
          GestureDetector(
            onTap: () => _showAddDescriptionDialog(context),
            child: Padding(
              padding: EdgeInsets.only(left: 5.h, top: 5.v, bottom: 5.v),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 200.h, // Set your maximum width value here
                ),
                child: Text(
                  description.isEmpty ? "Add description" : description,
                  style: theme.textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis, // Add this line to handle overflow
                ),
              ),
            ),
          ),
          Spacer(),
          if (description.isNotEmpty)
            GestureDetector(
              onTap: () => setState(() => description = ''),
              child: Container(
                child: SvgPicture.asset(ImageConstant.imgClose),
                height: 17.adaptSize,
                width: 17.adaptSize,
                margin: EdgeInsets.symmetric(vertical: 10.v, horizontal: 20.v),
              ),
            ),
        ],
      ),
    );
  }


  // Method to show the dialog for adding a description
  void _showAddDescriptionDialog(BuildContext context) {
    final TextEditingController _descriptionController =
    TextEditingController(text: description);

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return Dialog(
          child: Container(
            width: 300.v, // Width of the dialog box
            height: 300.v, // Height of the dialog box
            child: AlertDialog(
              title: Text(
                'Add Description',
                style: TextStyle(fontSize: 24), // Font size for title
              ),
              content: TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  hintText: "Enter description here",
                  hintStyle: TextStyle(fontSize: 16), // Font size for content
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(dialogContext); // Close the dialog
                    setState(() {
                      description = _descriptionController.text; // Update the description
                    });
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18, // Font size for button text
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  void _showAllClothesPopup(BuildContext context) {
    showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return const Frame404Bottomsheet();
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

  /// Section Widget
  Widget _buildFrame5(BuildContext context) {
    ItemModel? item = globals.selectedItem;

    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(left: 32, right: 22),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                _showAllClothesPopup(context);
              },
              onLongPress: () {
                _showItemDetailsPopup(context);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 11),
                decoration: AppDecoration.fillBlueGray.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder50,
                ),
                child: Column(
                  children: [
                    if (item != null && item.topWearImageUrl != null)
                      Image.network(
                        item.topWearImageUrl!,
                        height: 240,
                        width: 240,
                        fit: BoxFit.cover,
                      ),
                    if (item != null && item.bottomWearImageUrl != null)
                      Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Image.network(
                          item.bottomWearImageUrl!,
                          height: 240,
                          width: 240,
                          fit: BoxFit.cover,
                        ),
                      ),
                    if (item?.topWearImageUrl == null && item?.bottomWearImageUrl == null)
                      SvgPicture.asset(
                        'assets/images/img_user_gray_500_01.svg',
                        height: 110,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  void _showItemDetailsPopup(BuildContext context) {
    ItemModel? item = globals.selectedItem; // Directly use the ItemModel object

    if (item != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Item Details'),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  item.topWearImageUrl != null
                      ? Image.network(
                    item.topWearImageUrl!,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  )
                      : Text('Top Wear: Not available'),
                  SizedBox(height: 10),
                  item.bottomWearImageUrl != null
                      ? Image.network(
                    item.bottomWearImageUrl!,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  )
                      : Text('Bottom Wear: Not available'),
                  SizedBox(height: 10),
                  Text('Outfit Name: ${item.outfitName ?? 'Not available'}'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'Close',
                  style: TextStyle(color: Colors.black), // Set text color to black
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }


  /// Navigates back to the previous screen.
  onTapImgClose(BuildContext context) {
    Navigator.pop(context);
  }

  onTapBtnAlarm(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.washing_reminder_page);
  }
}