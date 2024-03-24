import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/new_file/addtowardrobe_screen.dart';
import 'package:sdgp_test01/presentation/Bookmark_page/bookmark_page.dart';
import 'package:sdgp_test01/presentation/Landing_page/landing_page.dart';
import 'package:sdgp_test01/presentation/Main_wardrobe/Main_wardrobe.dart';
import 'package:sdgp_test01/presentation/Searchbar_page/Searchbar_page.dart';
import 'package:sdgp_test01/presentation/User_profile/user_profile.dart';
import 'package:sdgp_test01/presentation/Washing_reminder_page/Washing_reminder_page.dart';
import 'package:sdgp_test01/widgets/custom_switch.dart';
import 'package:sdgp_test01/widgets/custom_text_form_field.dart';
import 'package:sdgp_test01/presentation/Event_day_Page/wardrobe_outfits.dart';
import 'package:sdgp_test01/presentation/frame_404_bottomsheet/frame_404_bottomsheet.dart';

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
                                    SizedBox(height: 64.v),
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
                backgroundColor: Colors.brown, // Setting the background color
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

    // send details to firestore database
    await FirebaseFirestore.instance.collection('UserEventDetails').add({
      'EventDate': widget.selectedDate.toIso8601String().substring(0, 10),
      'EventTitle': eventTitle,
      'EventDescription': description,
      'NotificatoTime': notificationTime,
    });
  }

  Widget _buildEventTitleInput(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 59.h),
      child: TextFormField(
        initialValue: eventTitle, // Initialize with the current event title
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

  void _showNotificationTimeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(
            'Select Notification Time',
            style: TextStyle(color: Colors.black),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Time options
              _notificationButton(dialogContext, '5 minutes', '5 minutes'),
              _notificationButton(dialogContext, '15 minutes', '15 minutes'),
              _notificationButton(dialogContext, '30 minutes', '30 minutes'),
              _notificationButton(
                  dialogContext, '1 hour prior', '1 hour prior'),
              _notificationButton(dialogContext, '1 day prior', '1 day prior'),
              // Custom time selection
              TextButton(
                onPressed: () {
                  Navigator.pop(dialogContext); // Close the current dialog
                  _showCustomTimeDialog(context, (selectedTime) {
                    setState(() {
                      notificationTime = selectedTime; // Update the notification time
                    });
                  });
                },
                child: Text(
                  'Custom',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

// Method to show custom time input dialog
  void _showCustomTimeDialog(
      BuildContext context, Function(String) onTimeSelected) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        String customTimeValue = '';
        String customTimeUnit = 'minutes'; // default unit

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text('Custom Notification Time'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(hintText: 'Enter time number'),
                    onChanged: (value) => customTimeValue = value,
                    keyboardType: TextInputType.number,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <String>['minutes', 'hours', 'days', 'weeks']
                        .map((unit) {
                      return ElevatedButton(
                        onPressed: () => setState(() => customTimeUnit = unit),
                        // Update the unit and rebuild
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: customTimeUnit == unit
                              ? Colors.lightGreenAccent
                              : null, // Text color
                        ),
                        child: Text(unit),
                      );
                    }).toList(),
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(dialogContext); // Close the dialog
                    String selectedTime = customTimeValue.isNotEmpty
                        ? '$customTimeValue $customTimeUnit'
                        : 'Custom Time';
                    onTimeSelected(selectedTime);
                  },
                  child: Text('OK', style: TextStyle(color: Colors.black)),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _notificationButton(
      BuildContext dialogContext, String text, String value) {
    return TextButton(
      onPressed: () {
        Navigator.pop(dialogContext); // Close the dialog
        setState(() {
          notificationTime = value; // Update the notification time state
        });
      },
      child: Text(
        text,
        style: TextStyle(color: Colors.black),
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
              padding: EdgeInsets.only(left: 29.h, top: 10.v, bottom: 6.v),
              child: Text(
                description.isEmpty ? "Add description" : description,
                // Show description or placeholder text
                style: theme.textTheme.bodyMedium,
              ),
            ),
          ),
          Spacer(),
          if (description.isNotEmpty)
            GestureDetector(
              onTap: () => setState(() => description = ''),
              // Clear description when tapped
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
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(left: 32.h, right: 22.h),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          GestureDetector(
            onTap: () {
              _showAllClothesPopup(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 11.v),
              decoration: AppDecoration.fillBlueGray
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder50),
              child: Container(
                  height: 101.v,
                  width: 98.h,
                  padding:
                  EdgeInsets.symmetric(horizontal: 18.h, vertical: 22.v),
                  decoration: AppDecoration.fillWhiteA.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder50),
                  child: SvgPicture.asset(
                    'assets/images/img_user_gray_500_01.svg',
                    // Replace with the actual SVG asset
                    height: 55.v,
                    width: 60.h,
                    fit: BoxFit.cover,
                  )),
            ),
          ),

        ]),
      ),
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
              color: appTheme.black900,
              thickness: 4.h,
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
                    MaterialPageRoute(
                        builder: (context) =>
                            Searchbar_page()), // Replace with your actual screen widget
                  );
                },
                child: SvgPicture.asset(
                  ImageConstant.bookmarkfooter,
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
                    MaterialPageRoute(
                        builder: (context) =>
                        const AddtowardrobeScreen()), // Replace with your actual screen widget
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
                    MaterialPageRoute(
                        builder: (context) =>
                         Main_wardrobe()), // Replace with your actual screen widget
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
                    MaterialPageRoute(
                        builder: (context) =>
                         User_profile()), // Replace with your actual screen widget
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

  /// Navigates back to the previous screen.
  onTapImgClose(BuildContext context) {
    Navigator.pop(context);
  }

  onTapBtnAlarm(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.washing_reminder_page);
  }
}