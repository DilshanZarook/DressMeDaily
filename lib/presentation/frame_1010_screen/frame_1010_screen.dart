import 'package:sdgp_test01/presentation/frame_1061_page/frame_1061_page.dart';
import 'package:sdgp_test01/widgets/custom_elevated_button.dart';
import 'package:sdgp_test01/widgets/custom_switch.dart';
import 'package:sdgp_test01/widgets/custom_text_form_field.dart';
import 'package:sdgp_test01/widgets/custom_bottom_bar.dart';
import 'package:sdgp_test01/widgets/custom_floating_button.dart';
import 'package:sdgp_test01/widgets/custom_icon_button.dart';
import 'package:sdgp_test01/presentation/frame_1061_container_screen/frame_1061_container_screen.dart';
import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/presentation/frame_405_bottomsheet/frame_405_bottomsheet.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sdgp_test01/presentation/Landing_page/landing_page.dart';
import 'package:sdgp_test01/presentation/User_profile/user_profile.dart';
import 'package:sdgp_test01/presentation/Bookmark_page/bookmark_page.dart';
import 'package:sdgp_test01/presentation/new_file/addtowardrobe_screen.dart';

class Frame1010Screen extends StatefulWidget {
  final DateTime selectedDate;
  final GlobalKey<NavigatorState> navigatorKey;
  bool isSelectedSwitch = false;

  Frame1010Screen({
    Key? key,
    required this.selectedDate,
    GlobalKey<NavigatorState>? navigatorKey,
  })  : navigatorKey = navigatorKey ?? GlobalKey(),
        super(key: key);

  @override
  _Frame1010ScreenState createState() => _Frame1010ScreenState();
}

class _Frame1010ScreenState extends State<Frame1010Screen> {
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
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 33.h, right: 13.h),
                                            ),
                                        SizedBox(height: 42.v),
                                        SizedBox(height: 18.v),
                                        _buildFrame3(context),
                                        SizedBox(height: 13.v),
                                        _buildEventTitleInput(context),
                                        SizedBox(height: 8.v),
                                        Divider(),
                                        SizedBox(height: 15.v),
                                        _buildThirtySix(context),
                                        SizedBox(height: 27.v),
                                        Divider(),
                                        SizedBox(height: 6.v),
                                        _buildFrame4(context),
                                        if (notificationTime.isNotEmpty)
                                          Container(
                                            padding: EdgeInsets.all(16),
                                            child: Text(
                                              "Notification Time: $notificationTime",
                                              style: TextStyle(
                                                fontSize: 16, // Adjust the font size as needed
                                                color: Colors.black, // Change the text color if needed
                                              ),
                                            ),
                                          ),
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
                                              style: TextStyle(fontSize: 16), // Adjust the style as needed
                                            ),
                                          ),
                                        SizedBox(height: 15.v),
                                        Divider(),
                                        SizedBox(height: 27.v),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 20.h, right: 35.h),
                                            child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Padding(
                                                      padding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 2.v),
                                                      child: CustomTextFormField(
                                                          width: 193.h,
                                                          controller: searchnormalController,
                                                          hintText: "Search your clothing..",
                                                          textInputAction:
                                                          TextInputAction
                                                              .done,
                                                          suffix: Container(
                                                              margin: EdgeInsets
                                                                  .fromLTRB(
                                                                  26.h,
                                                                  3.v,
                                                                  5.h,
                                                                  3.v),
                                                              child: Container(
                                                                child: Image.asset( ImageConstant.imgSearchnormal),
                                                                  height: 18.v,
                                                                  width: 13.h)
                                                          ),
                                                          suffixConstraints:
                                                          BoxConstraints(
                                                              maxHeight:
                                                              24.v))),
                                                  // CustomSwitch(
                                                  //   margin: EdgeInsets.symmetric(vertical: 3.v), // Make sure 'v' is defined or replace with actual value
                                                  //   value: isSelectedSwitch1,
                                                  //   onChange: (value) {
                                                  //     setState(() {
                                                  //       isSelectedSwitch1 = value; // Update the state when the switch is tapped
                                                  //     });
                                                  //   },
                                                  // ),
                                                ])),
                                        SizedBox(height: 17.v),
                                        SizedBox(height: 10.v),
                                        _buildFrame5(context),
                                        SizedBox(height: 64.v)
                                      ])))
                        ])))),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.h),
            ),
            floatingActionButton: _buildFloatingActionButton(context));
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
                height: 17.adaptSize,  // Adjust the height as needed
                width: 17.adaptSize,   // Adjust the width as needed
                margin: EdgeInsets.symmetric(vertical: 4.v),
                child: Image.asset(
                  ImageConstant.imgClose,  // Replace with your asset path
                  fit: BoxFit.cover,       // Adjust the fit as per your requirement
                ),
              ),
            ),
            TextButton(
              child: Text(
                'Save',
                style: TextStyle(color: Colors.white), // Add text color if needed
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

  void _showSavePopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Save'),
          content: Text('Your changes have been saved.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
          title: Text('Select Notification Time'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Time options
              _notificationButton(dialogContext, '5 minutes', '5 minutes'),
              _notificationButton(dialogContext, '15 minutes', '15 minutes'),
              _notificationButton(dialogContext, '30 minutes', '30 minutes'),
              _notificationButton(dialogContext, '1 hour prior', '1 hour prior'),
              _notificationButton(dialogContext, '1 day prior', '1 day prior'),
              // Custom time selection
              TextButton(
                onPressed: () {
                  Navigator.pop(dialogContext); // Close the current dialog
                  _showCustomTimeDialog(context); // Show the custom time dialog
                },
                child: Text('Custom'),
              ),
            ],
          ),
        );
      },
    );
  }

// Method to show custom time input dialog
  void _showCustomTimeDialog(BuildContext context) {
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
                    children: <String>['minutes', 'hours', 'days', 'weeks'].map((unit) {
                      return ElevatedButton(
                        onPressed: () => setState(() => customTimeUnit = unit), // Update the unit and rebuild
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: customTimeUnit == unit ? Colors.lightGreenAccent : null, // Text color
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
                    setState(() {
                      notificationTime = customTimeValue.isNotEmpty
                          ? '$customTimeValue $customTimeUnit'
                          : 'Custom Time';
                    });
                  },
                  child: Text('OK', style: TextStyle(color: Colors.white)),
                ),
              ],
            );
          },
        );
      },
    );
  }


// Helper method to create a button for selecting a notification time
  Widget _notificationButton(BuildContext dialogContext, String text, String value) {
    return TextButton(
      onPressed: () {
        Navigator.pop(dialogContext); // Close the dialog
        setState(() {
          notificationTime = value; // Update the notification time state
        });
      },
      child: Text(text),
    );
  }
  /// Section Widget
  Widget _buildThirtySix(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 19.h, right: 32.h),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                child:Image.asset(ImageConstant.imgVector7),
                height: 35.adaptSize,
                width: 35.adaptSize,
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.h, top: 8.v, bottom: 6.v),
                child: Text("All-day", style: theme.textTheme.bodyLarge),
              ),
              Spacer(),
              CustomSwitch(
                margin: EdgeInsets.symmetric(vertical: 3.v),
                value: isAllDay,
                onChange: (value) {
                  setState(() {
                    isAllDay = value;
                  });
                },
              ),
            ],
          ),
          if (!isAllDay) ...[ // Only show this content if the switch is off
            SizedBox(height: 18.v),
            Padding(
              padding: EdgeInsets.only(left: 26.h, right: 0.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Allocated time", style: theme.textTheme.bodyLarge),
                  SizedBox(height: 18.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Fri, Jan 2, 2024", style: theme.textTheme.bodyLarge),
                      Text("19:00", style: theme.textTheme.bodyLarge),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Fri, Jan 2, 2024", style: theme.textTheme.bodyLarge),
                      Text("21:00", style: theme.textTheme.bodyLarge),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFrame4(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector( // GestureDetector to handle taps
        onTap: () {
          _showNotificationTimeDialog(context); // Open the notification time selection dialog
        },
        child: Padding(
          padding: EdgeInsets.only(left: 35.h, right: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    child:Image.asset(ImageConstant.imgFilledAppointmentReminders),
                    height: 38.v,
                    width: 35.h,
                  ),
                  SizedBox(width: 12.h),
                  Text(
                    notificationTime.isEmpty ? "Add notification time" : notificationTime,
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    notificationTime = ""; // Reset the notification time
                  });
                },
                child: Container(
                  child:Image.asset(ImageConstant.imgClose),
                  height: 17.adaptSize,
                  width: 17.adaptSize,
                  margin: EdgeInsets.symmetric(vertical: 10.v),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildDescriptionSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.h),
      child: Row(
        children: [
          Container(
            child:Image.asset(ImageConstant.imgFrame114),
            height: 34.v,
            width: 41.h,
          ),
          GestureDetector(
            onTap: () => _showAddDescriptionDialog(context),
            child: Padding(
              padding: EdgeInsets.only(left: 29.h, top: 10.v, bottom: 6.v),
              child: Text(
                description.isEmpty ? "Add description" : description, // Show description or placeholder text
                style: theme.textTheme.bodyMedium,
              ),
            ),
          ),
          Spacer(),
          if (description.isNotEmpty)
            GestureDetector(
              onTap: () => setState(() => description = ''), // Clear description when tapped
              child: Container(
                child:Image.asset( ImageConstant.imgClose),
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
    final TextEditingController _descriptionController = TextEditingController(text: description);

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Add Description'),
          content: TextField(
            controller: _descriptionController,
            decoration: InputDecoration(hintText: "Enter description here"),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext); // Close the dialog
                setState(() {
                  description = _descriptionController.text; // Update the description
                });
              },
              child: Text('OK'),
            ),
          ],
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
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Frame405Bottomsheet()), // Change to your destination frame
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 11.v),
              decoration: AppDecoration.fillBlueGray.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder50),
              child: Container(
                  height: 101.v,
                  width: 98.h,
                  padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 22.v),
                  decoration: AppDecoration.fillWhiteA.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder50),
                  child: SvgPicture.asset(
                    'assets/images/img_user_gray_500_01.svg', // Replace with the actual SVG asset
                    height: 55.v,
                    width: 60.h,
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Frame405Bottomsheet()), // Change to your destination frame
              );
            },
            child: Container(
              margin: EdgeInsets.only(left: 17.h),
              padding: EdgeInsets.all(11.h),
              decoration: AppDecoration.fillBlueGray.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder50),
              child: Card(
                clipBehavior: Clip.antiAlias,
                elevation: 0,
                margin: EdgeInsets.all(0),
                color: appTheme.whiteA700,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusStyle.roundedBorder50),
                child: Container(
                  height: 101.v,
                  width: 98.h,
                  padding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 18.v),
                  decoration: AppDecoration.fillWhiteA.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder50),
                  child: SvgPicture.asset(
                    'assets/images/img_user_gray_500_01_55x56.svg', // Replace with the actual SVG asset
                    height: 55.v,
                    width: 56.h,
                    fit: BoxFit.cover,
                  ),

                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }



  /// Section Widget
  Widget _buildFloatingActionButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 25.0, // Right padding
        bottom: 25.0, // Bottom padding
      ),
      child: FloatingActionButton(
        onPressed: () {
          print("Floating Action Button Pressed"); // Console log for debugging
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Frame1061ContainerScreen()),
          );
        },
        child: Container(
          child:Image.asset(ImageConstant.imgAlarm),
          width: 45.0, // Set width of the image to 25
          height: 45.0, // Set height of the image to 25
        ),
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Adjusted for even spacing
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image button 1
              InkWell(
                onTap: () {
                  // Navigate to the corresponding screen for imgUser1
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Landing_page()), // Replace with your actual screen widget
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
                    MaterialPageRoute(builder: (context) => Bookmark_page()), // Replace with your actual screen widget
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
                    MaterialPageRoute(builder: (context) => const Landing_page()), // Replace with your actual screen widget
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
                    MaterialPageRoute(builder: (context) => const Landing_page()), // Replace with your actual screen widget
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
  /// Navigates back to the previous screen.
  onTapImgClose(BuildContext context) {
    Navigator.pop(context);
  }
  onTapBtnAlarm(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.frame1061ContainerScreen);
  }
}