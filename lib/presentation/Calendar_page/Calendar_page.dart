import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:DressMeDaily/core/app_export.dart';
import 'package:DressMeDaily/new_file/addtowardrobe_screen.dart';
import 'package:DressMeDaily/presentation/Bookmark_page/bookmark_page.dart';
import 'package:DressMeDaily/presentation/Event_day_page/Event_day_page.dart';
import 'package:DressMeDaily/presentation/Landing_page/landing_page.dart';
import 'package:DressMeDaily/presentation/Main_wardrobe/Main_wardrobe.dart';
import 'package:DressMeDaily/presentation/Searchbar_page/Searchbar_page.dart';
import 'package:DressMeDaily/presentation/User_profile/user_profile.dart';
import 'package:DressMeDaily/widgets/app_bar/appbar_title.dart';
import 'package:DressMeDaily/widgets/app_bar/appbar_trailing_image.dart';
import 'package:DressMeDaily/widgets/app_bar/custom_app_bar.dart';
import 'package:DressMeDaily/presentation/Nagiavation_animation/Page_animation.dart';
import 'package:DressMeDaily/presentation/Main_settings_page/Main_settings.dart';

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
    return CustomAppBar(
      centerTitle: true,
      height: 60.h,
      title: Column(
        children: [
          SizedBox(height: 0.v),
          Padding(
            padding: EdgeInsets.only(
              left: 25.h,
              right: 25.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // This will position the children at the start and end of the row
              children: [
                AppbarTitle(
                  text: "DMD",
                  margin: EdgeInsets.only(bottom: 10.v),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                            const Main_settings()), // Replace Frame624 with the actual widget class for frame 624
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10.0),
                      // Bottom margin of 10
                      child: SvgPicture.asset(
                        ImageConstant.imgMegaphone,
                        // Add appropriate height and width if needed
                      ),
                    ))
              ],
            ),
          ),
          const SizedBox(height: 30),
          Divider(
            thickness: 3.h,
            color: appTheme.black900,
            indent: 0,
            endIndent: 0,
          ),
          // Additional content can go here
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
                    Main_wardrobe(
                        initialTabIndex: 2)), // Change to your destination frame
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
                  ImageConstant.Search_footer,
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
                  ImageConstant.Wardrobe_selected_footer_101,
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