import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/new_file/addtowardrobe_screen.dart';
import 'package:sdgp_test01/presentation/Bookmark_page/bookmark_page.dart';
import 'package:sdgp_test01/presentation/Event_day_page/Event_day_page.dart';
import 'package:sdgp_test01/presentation/Landing_page/landing_page.dart';
import 'package:sdgp_test01/presentation/Main_wardrobe/Main_wardrobe.dart';
import 'package:sdgp_test01/presentation/User_profile/user_profile.dart';
import 'package:sdgp_test01/widgets/app_bar/appbar_title.dart';
import 'package:sdgp_test01/widgets/app_bar/appbar_trailing_image.dart';
import 'package:sdgp_test01/widgets/app_bar/custom_app_bar.dart';

class Calendar_page extends StatelessWidget {
  final List<DateTime?> selectedDatesFromCalendar1 = [];
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final DateTime? selectedDate;

  DateTime currentDateTime = DateTime(2024, 3, 9, 15, 48);

  Calendar_page({Key? key, this.selectedDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SizedBox(
        height: 750.v,
        width: double.maxFinite,
        child: Stack(
          alignment: Alignment.center,
          children: [
            _buildBackArrow(context),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 23.v),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Spacer(
                      flex: 30,
                    ),
                    _buildCalendar(context),
                    Spacer(
                      flex: 59,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    // Calculate the total height
    final double totalHeight =
        kToolbarHeight + 30.h; // Adjust this calculation as needed

    return PreferredSize(
      preferredSize: Size.fromHeight(totalHeight), // Updated preferred height
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomAppBar(
            title: AppbarTitle(
              text: "DMD",
              margin: EdgeInsets.only(left: 21.h),
            ),
            actions: [
              AppbarTrailingImage(
                imagePath: ImageConstant.imgMegaphone,
                margin: EdgeInsets.fromLTRB(26.h, 4.v, 26.h, 3.v),
              ),
            ],
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 360.h,
            height: 1.h,
            child: Divider(
              color: appTheme.black990,
              thickness: 2.h,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackArrow(BuildContext context) {
    return Positioned(
      top: 16.v, // Adjust the positioning as you see fit
      left: 16.h, // Adjust the positioning as you see fit
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) =>
                    Main_wardrobe()), // Change to your destination frame
          );
        },
        child: Container(
          padding: EdgeInsets.all(8.h),
          // Padding inside the container for the tap area
          decoration: BoxDecoration(
            color: Colors.white, // Background color for the container
            shape:
                BoxShape.circle, // Circular shape for the back arrow container
          ),
          child: Icon(
            Icons.arrow_back, // The back arrow icon
            size: 24.h, // Size of the back arrow icon
            color: appTheme.black900, // Icon color
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildCalendar(BuildContext context) {
    return SizedBox(
      height: 400.v,
      width: 360.h,
      child: CalendarDatePicker2(
        config: CalendarDatePicker2Config(
          calendarType: CalendarDatePicker2Type.multi,
          firstDate: DateTime(DateTime.now().year - 5),
          lastDate: DateTime(DateTime.now().year + 5),
          selectedDayHighlightColor: Color(0XFF3990f6),
          centerAlignModePicker: true,
          firstDayOfWeek: 0,
          controlsHeight: 80.89,
          weekdayLabelTextStyle: TextStyle(
            color: appTheme.black900,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
          selectedDayTextStyle: TextStyle(
            color: Color(0XFFcefd4a),
            fontFamily: 'Inter',
            fontSize: 18.v,
            fontWeight: FontWeight.w400,
          ),
          controlsTextStyle: TextStyle(
            color: appTheme.black900,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: -2,
          ),
          weekdayLabels: ["S", "M", "T", "W", "T", "F", "S"],
          dayBorderRadius: BorderRadius.circular(
            10.h,
          ),
        ),
        value: selectedDatesFromCalendar1,
        onValueChanged: (dates) {
          if (dates.isNotEmpty && dates.last != null) {
            navigateToAnotherFrame(context, dates.last!);
          }
        },
      ),
    );
  }

  void navigateToAnotherFrame(BuildContext context, DateTime selectedDate) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Event_day_page(selectedDate: selectedDate),
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
              color: appTheme.black990,
              thickness: 2.h,
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
                  ImageConstant.Home_footer_Unselected_101,
                  height: 35.v, // Adjust the height as needed
                  width: 35.v, // Adjust the width as needed
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
                            Bookmark_page()), // Replace with your actual screen widget
                  );
                },
                child: SvgPicture.asset(
                  ImageConstant.Search_footer,
                  height: 35.v, // Adjust the height as needed
                  width: 35.v, // Adjust the width as needed
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
                  ImageConstant.Camera_footer_101,
                  height: 30.v, // Adjust the height as needed
                  width: 30.v, // Adjust the width as needed
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
                  ImageConstant.Wardrobe_selected_footer_101,
                  height: 32.v, // Adjust the height as needed
                  width: 32.v, // Adjust the width as needed
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
                            const User_profile()), // Replace with your actual screen widget
                  );
                },
                child: SvgPicture.asset(
                  ImageConstant.User_Footer_Unselected_101,
                  height: 35.v, // Adjust the height as needed
                  width: 35.v, // Adjust the width as needed
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