import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:DressMeDaily/core/app_export.dart';
import 'package:DressMeDaily/presentation/Calendar_page/Calendar_page.dart';
import 'package:DressMeDaily/presentation/Landing_page_2/landing_page_2.dart';
import 'package:DressMeDaily/presentation/Main_settings_page/main_settings.dart';
import 'package:DressMeDaily/presentation/Main_wardrobe/Main_wardrobe.dart';
import 'package:DressMeDaily/presentation/Searchbar_page/Searchbar_page.dart';
import 'package:DressMeDaily/presentation/User_profile/user_profile.dart';
import 'package:DressMeDaily/presentation/new_file/addtowardrobe_screen.dart';
import 'package:DressMeDaily/widgets/app_bar/appbar_title.dart';
import 'package:DressMeDaily/widgets/app_bar/custom_app_bar_1.dart';
import 'package:DressMeDaily/widgets/custom_icon_button.dart';
import 'package:DressMeDaily/widgets/custom_outlined_button.dart';
import 'package:DressMeDaily/presentation/Nagiavation_animation/Page_animation.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key})
      : super(
          key: key,
        );

  _Landing_pageState createState() => _Landing_pageState();
}

class _Landing_pageState extends State<LandingPage> {
  late String currentDay;
  late String currentMonth;
  late String roundedTemp = "";
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    currentDay = DateFormat('EEE').format(DateTime.now());
    currentMonth = DateFormat('MMM').format(DateTime.now());
    _fetchWeatherData(selectedDate = DateTime.now());
  }

  Future<void> _fetchWeatherData(date) async {
    final apiKey = "629de998a0f95d7b9dfdcd1dc96656ee";
    final apiUrl =
        "https://api.openweathermap.org/data/2.5/weather?q=Colombo&appid=$apiKey";

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final weatherData = json.decode(response.body);
        setState(() {
          selectedDate = date;
          currentDay = DateFormat('EEE').format(date);
          currentMonth = DateFormat('MMM').format(date);
          final temp = weatherData['main']['temp'];
          final tempCelsius = temp - 273.15;
          roundedTemp = tempCelsius.round().toString();
        });
      } else {
        print('Failed to load weather data: ${response.statusCode}');
      }
    } catch (e) {
      print('Failed to load weather data: $e');
    }
  }

  void _showCalendarPicker() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (date != null && date != selectedDate) {
      setState(() {
        selectedDate = date;
        currentDay = DateFormat('EEE').format(date);
        currentMonth = DateFormat('MMM').format(date);
      });
      _fetchWeatherData(selectedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: PageView(
        scrollDirection: Axis.vertical,
        children: [
          _Landing_page1(context), // Your existing Frame325Screen content
          Landing_page_2(), // Second screen to navigate to
        ],
      ),
      bottomNavigationBar:
          _buildBottomBar(context), // Add bottomNavigationBar here
    );
  }

// The implementations of _buildAppBar, _Landing_page1, Landing_page_2, and _buildBottomBar need to be defined elsewhere

  Widget _Landing_page1(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/landing_pg_1.png',
              // Replace with the correct path to your image asset
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              SizedBox(height: 25.v),
              SizedBox(
                height: 75.v,
                width: 300.h,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Opacity(
                      opacity: 0.4,
                      child: Align(
                        alignment: Alignment.centerRight,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: EdgeInsets.only(right: 13.h),
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.h,
                          vertical: 4.v,
                        ),
                        decoration: AppDecoration.outlineBlack900.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 4.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 180.h,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 1.v),
                                          child: Text(
                                            currentDay,
                                            style: theme.textTheme.bodySmall,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 1.v),
                                          child: Text(
                                            currentMonth,
                                            style: theme.textTheme.bodySmall,
                                          ),
                                        ),
                                        Container(
                                          width: 90.h,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 6.h,
                                            vertical: 1.v,
                                          ),
                                          decoration: AppDecoration
                                              .fillDeepOrange
                                              .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .circleBorder10,
                                          ),
                                          child: Text(
                                            " " +
                                                selectedDate.day.toString() +
                                                "/" +
                                                selectedDate.month.toString() +
                                                "/" +
                                                selectedDate.year.toString(),
                                            style: CustomTextStyles
                                                .bodySmallBlack900,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 7.v),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 4.v),
                                        child: Text(
                                          roundedTemp,
                                          style: theme.textTheme.bodyMedium,
                                        ),
                                      ),
                                      Container(
                                        height: 4.adaptSize,
                                        width: 4.adaptSize,
                                        margin: EdgeInsets.only(
                                          left: 5.h,
                                          bottom: 19.v,
                                        ),
                                        decoration: BoxDecoration(
                                          color: appTheme.blueGray100,
                                          borderRadius: BorderRadius.circular(
                                            2.h,
                                          ),
                                          border: Border.all(
                                            color: appTheme.black900,
                                            width: 1.h,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 5.h,
                                          bottom: 4.v,
                                        ),
                                        child: Text(
                                          "C",
                                          style: theme.textTheme.bodyMedium,
                                        ),
                                      ),
                                      CustomImageView(
                                        imagePath: ImageConstant.imgCloudsnow,
                                        height: 23.v,
                                        width: 25.h,
                                        margin: EdgeInsets.only(left: 5.h),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            CustomIconButton(
                              height: 55.v,
                              width: 53.h,
                              padding: EdgeInsets.all(5.h),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadiusStyle.roundedBorder15,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Calendar_page()), // Replace NextScreen with the screen you want to navigate to
                                  );
                                },
                                child: SvgPicture.asset(
                                  ImageConstant.imgCalendar,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.v),
              Card(
                clipBehavior: Clip.antiAlias,
                elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusStyle.roundedBorder20,
                ),
                child: Container(
                  height: 345.v,
                  width: 280.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusStyle.roundedBorder15,
                  ),
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: 345.v,
                          width: 140.h,
                          decoration: BoxDecoration(
                            color: appTheme.blueGray200,
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(10.h),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 30.h),
                          child: Row(
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgVecteezyCoolM,
                                height: 320.v,
                                width: 88.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 34.h,
                                  top: 60.v,
                                  bottom: 48.v,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(height: 25.v),
                                    CustomOutlinedButton(
                                        height: 40.h,
                                        width: 110.h,
                                        text: "Plan",
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  Main_wardrobe(
                                                      initialTabIndex: 2),
                                            ),
                                          );
                                        }),
                                    SizedBox(height: 25.v),
                                    CustomOutlinedButton(
                                        height: 40.h,
                                        width: 110.h,
                                        text: "Weather",
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  Main_wardrobe(
                                                      initialTabIndex: 2),
                                            ),
                                          );
                                        }),
                                    SizedBox(height: 25.v),
                                    CustomOutlinedButton(
                                      height: 40.h,
                                      width: 110.h,
                                      text: "Avatar",
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  User_profile()),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40.v),
              Stack(
                alignment: Alignment.topCenter,
                // Aligns children relative to the top-center of the stack
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 30.h,
                      right: 30.h,
                      top: 42.v,
                      bottom: 0
                          .v, // Adjust this value to position the TL100 container over the other container
                    ),
                    height: 64.v, // Height of the rectangle
                    width: 360.h,
                    // Width of the rectangle
                    decoration: BoxDecoration(
                      color: const Color(0xFF3D3D3D),
                      // Rectangle color (dark grey)
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.h),
                        // Top left corner radius
                        topRight:
                            Radius.circular(15.h), // Top right corner radius
                      ),
                      // Add border, shadow, etc., if needed
                    ),
                    // Add child widget here if needed
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 40.h,
                      right: 40.h,
                      // You can add top and bottom margins if required
                      // top: 20.h,
                      // bottom: 20.h,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.h,
                      // Add vertical padding if needed
                      // vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      color: appTheme.blueGray200,
                      // Retaining the background color from outlineBlack9002
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        // Applying a border radius of 50 to the top left corner
                        topRight: Radius.circular(50),
                        // Applying a border radius of 50 to the top right corner
                        bottomLeft: Radius.circular(0),
                        // Keeping the bottom left corner radius as 0
                        bottomRight: Radius.circular(
                            0), // Keeping the bottom right corner radius as 0
                      ),
                    ),
                    child: SizedBox(
                      width: 220.h,
                      height: 104.h,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          // Add padding inside the SizedBox for the Text
                          vertical: 20
                              .h, // Adjust this as needed for top and bottom padding of the text
                        ),
                        child: const Text(
                          "Trending local\nrecommendations",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            // Explicitly set text color to white
                            fontSize: 20.0, // Set font size to 20
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  /// Section Widget
  ///
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
                  ImageConstant.Home_footer_selected,
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
                  ImageConstant.Wardrobe_footer_unselected_1,
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

// Replace `ScreenForImgUser1` and `ScreenForImgFrame373` with the actual screen class names that you want to navigate to.
}

class CustomImageView extends StatelessWidget {
  final String imagePath;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Alignment? alignment;
  final EdgeInsetsGeometry? margin;

  const CustomImageView({
    Key? key,
    required this.imagePath,
    this.height,
    this.width,
    this.fit,
    this.alignment,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine if the image is SVG or not
    if (imagePath.endsWith('.svg')) {
      return SvgPicture.asset(
        imagePath,
        height: height,
        width: width,
        fit: fit ?? BoxFit.contain,
        alignment: alignment ?? Alignment.center,
        // You can add placeholder and error widgets if needed
      );
    } else {
      return Image.asset(
        imagePath,
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
        alignment: alignment ?? Alignment.center,
      );
    }
  }
}
