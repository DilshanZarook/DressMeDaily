import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/calendar/v3.dart' as cal;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/presentation/Calendar_page/Calendar_page.dart';

class Plan_page extends StatefulWidget {
  const Plan_page({Key? key}) : super(key: key);

  @override
  Plan_pageState createState() => Plan_pageState();
}

class Plan_pageState extends State<Plan_page> {
  final GoogleSignIn _googleSignIn =
      GoogleSignIn(scopes: ['https://www.googleapis.com/auth/calendar']);
  List<cal.Event> _calendarEvents = [];
  TextEditingController monController = TextEditingController();
  ScrollController scrollController = ScrollController();
  DateTime specificCurrentDate = DateTime(2024, 3, 12);
  List<String> weekDays = _getCurrentWeekDays();
  String currentDate = DateFormat('MM/dd/yyyy').format(DateTime.now());
  String topClothingImageUrl =
      ''; // Initially empty, to be fetched from backend
  String bottomClothingImageUrl =
      ''; // Initially empty, to be fetched from backend
  String outfitNumber = 'Outfit 01';
  bool shouldShowSyncSection = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToCurrentDate());
    _fetchOutfitData();
  }

  void _scrollToCurrentDate() {
    int currentDayIndex = specificCurrentDate.weekday -
        1; // Assuming Monday is the first day of the week
    double offset =
        (currentDayIndex * 64.h) + (currentDayIndex * 15.0); // Calculate offset
    scrollController.animateTo(
      offset,
      duration: Duration(milliseconds: 100),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    monController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void _fetchOutfitData() async {
    // Placeholder for your backend data fetching logic
    // After fetching the data, you would set the state of the widget with the new data:
    setState(() {
      topClothingImageUrl =
          'assets/images/img_filled_appointment_reminders.png';
      bottomClothingImageUrl =
          'assets/images/img_filled_appointment_reminders.png';
      outfitNumber = 'Outfit 01';
    });
  }

  void _syncCalendar() async {
    try {
      final GoogleSignInAccount? account = await _googleSignIn.signIn();
      final authHeaders = await account!.authHeaders;
      final httpClient = GoogleHttpClient(authHeaders);
      final cal.CalendarApi calendarApi = cal.CalendarApi(httpClient);
      final cal.Events events = await calendarApi.events.list("primary");
      setState(() {
        _calendarEvents =
            events.items ?? []; // Provide an empty list as default value
      });
    } catch (error) {
      print("Error syncing calendar: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 46),
            _buildDateCarousel(weekDays, specificCurrentDate),
            SizedBox(height: 46),
            // _buildSyncCalendarEventsSection(),
            SizedBox(height: 56),
            _buildOutfitSection(
                topClothingImageUrl, bottomClothingImageUrl, outfitNumber),
            SizedBox(height: 19),
            _buildBottomContainer(),
          ],
        ),
      ),
    );
  }

  Widget _buildDateCarousel(
      List<String> weekDays, DateTime specificCurrentDate) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: weekDays.asMap().entries.map((entry) {
          int index = entry.key;
          String day = entry.value;
          DateTime dayDate = specificCurrentDate
              .add(Duration(days: index - specificCurrentDate.weekday + 1));
          return Padding(
            padding: EdgeInsets.only(
                right: index < weekDays.length - 1 ? 15.0 : 0.0),
            child: Column(children: [
              Container(
                width: 64.h,
                padding: EdgeInsets.symmetric(horizontal: 17.h, vertical: 4.v),
                decoration: BoxDecoration(
                  color: appTheme.gray60002,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  day,
                  style: TextStyle(
                    color: Colors.black, // Setting text color to black
                    fontSize: 16, // Font size 16
                  ),
                ),
              ),
              Container(
                width: 64.h,
                padding: EdgeInsets.symmetric(horizontal: 0.h, vertical: 9.v),
                decoration: AppDecoration.fillBlueGray
                    .copyWith(borderRadius: BorderRadiusStyle.customBorderBL20),
                alignment: Alignment.center,
                child: Text(
                  dayDate.isAtSameMomentAs(specificCurrentDate)
                      ? "Today"
                      : dayDate.day.toString(),
                  style: TextStyle(
                    color: Colors.black, // Setting text color to black
                    fontSize: 16, // Font size 16
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ]),
          );
        }).toList(),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Sync Calendar'),
          content: Text(
              'Do you want to keep or stop syncing calendar events from this device?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
                setState(() {
                  shouldShowSyncSection =
                      false; // Do not sync and hide the section
                });
              },
              child: Text('Do Not Sync'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext); // Keep the section and do nothing
              },
              child: Text('Keep'),
            ),
          ],
        );
      },
    );
  }
  //
  // Widget _buildSyncCalendarEventsSection() {
  //   if (!shouldShowSyncSection) return SizedBox();
  //   return Container(
  //     margin: EdgeInsets.only(left: 0.h, right: 0.h),
  //     padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 11.v),
  //     decoration: AppDecoration.fillBlueGray
  //         .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Container(
  //           child: SvgPicture.asset(
  //             'assets/images/img_phone.svg', // Adjust asset path if necessary
  //             // Increase the size by 30 units
  //             width: 50.0, // Assuming the original width was 30.0
  //             height: 50.0, // Assuming the original height was 30.0
  //           ),
  //         ),
  //         Padding(
  //             padding: EdgeInsets.only(left: 17.h, top: 4.v, bottom: 3.v),
  //             child: Text("Sync calendar events from device?",
  //                 style: theme.textTheme.bodySmall)),
  //         SizedBox(width: 10),
  //         GestureDetector(
  //           onTap: () {
  //             _showConfirmationDialog(context);
  //             // If 'Keep' was chosen or dialog was dismissed, do nothing
  //           },
  //           child: Image.asset(
  //             ImageConstant.redcross,
  //             // Replace with your red cross icon asset path
  //             height: 10.v,
  //             width: 10.h,
  //           ),
  //         ),
  //         SizedBox(width: 10),
  //         _buildGoogleSignIn(context),
  //         // This replaces the previous CustomImageView for the green tick icon
  //       ],
  //     ),
  //   );
  // }

// And here is the _buildGoogleSignIn method as before
  Widget _buildGoogleSignIn(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        try {
          final GoogleSignInAccount? account = await _googleSignIn.signIn();
          if (account != null) {
            final authHeaders = await account.authHeaders;
            final httpClient = GoogleHttpClient(authHeaders);
            final cal.CalendarApi calendarApi = cal.CalendarApi(httpClient);
            final cal.Events events = await calendarApi.events.list("primary");
            setState(() {
              _calendarEvents =
                  events.items ?? []; // Provide an empty list as default value
            });
          }
        } catch (error) {
          print("Error syncing calendar: $error");
        }
      },
      child: Image.asset(
        ImageConstant.greentick, // Replace with your green tick icon asset path
        height: 20.v, // Adjust the size accordingly
        width: 20.h, // Adjust the size accordingly
      ),
    );
  }

  Widget _buildOutfitSection(String topClothingImageUrl,
      String bottomClothingImageUrl, String outfitNumber) {
    // Format the current date to a string
    String currentDate = DateFormat('MM/dd/yyyy').format(DateTime.now());

    // Check if URLs are valid
    bool isTopImageUrlValid =
        Uri.tryParse(topClothingImageUrl)?.hasAbsolutePath ?? false;
    bool isBottomImageUrlValid =
        Uri.tryParse(bottomClothingImageUrl)?.hasAbsolutePath ?? false;

    Widget topClothingImageWidget = isTopImageUrlValid
        ? Image.network(topClothingImageUrl, fit: BoxFit.cover)
        : Image.asset('assets/images/img_filled_appointment_reminders.png',
            fit: BoxFit.cover); // Using a local asset as a placeholder

    Widget bottomClothingImageWidget = isBottomImageUrlValid
        ? Image.network(bottomClothingImageUrl, fit: BoxFit.cover)
        : Image.asset('assets/images/img_filled_appointment_reminders.png',
            fit: BoxFit.cover); // Using a local asset as a placeholder

    // If outfitNumber is empty, provide a default value or a placeholder
    String displayOutfitNumber =
        outfitNumber.isNotEmpty ? outfitNumber : "Loading outfit...";

    return Container(
      height: 300.v,
      width: 270.h,
      margin: EdgeInsets.only(left: 30.h, right: 30.h),
      padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 10.v),
      decoration: AppDecoration.fillBlueGray
          .copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Date:",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.black, // Set text color to black
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  currentDate,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.black, // Set text color to black
                  ),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white, // Container background color
                    borderRadius:
                        BorderRadius.circular(10), // Container border radius
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // Container background color
                      borderRadius: BorderRadius.circular(10),
                      // Container border radius
                      boxShadow: [
                        // Optional: add a shadow effect
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 1), // Shadow position
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => Calendar_page()),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.all(4.0),
                        // Optional padding for the SVG
                        child: SvgPicture.asset(
                          'assets/images/img_calendar.svg',
                          // Adjust asset path if necessary
                          // Increase the size by 30 units
                          width: 50.0, // Assuming the original width was 30.0
                          height: 50.0, // Assuming the original height was 30.0
                        ),
                      ),
                    ),
                  ))
            ],
          ),
          Expanded(
            child: Container(
              width: 200.h, // Set your desired width
              height: 120.h, // Set your desired height
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(20), // Set border radius to 20
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Make sure topClothingImageWidget and bottomClothingImageWidget are defined to return a widget
                  topClothingImageWidget,
                  SizedBox(width: 10.h),
                  bottomClothingImageWidget,
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            // This aligns the container to the right
            child: Container(
              width: 80.h, // Set the width of the container
              height: 30.h, // Set the height of the container
              decoration: BoxDecoration(
                color: Colors.white, // Set the container color to white
                borderRadius:
                    BorderRadius.circular(20), // Set border radius to 20
              ),
              child: Padding(
                padding: EdgeInsets.only(right: 0.h),
                child: Center(
                  // Center the text within the container
                  child: Text(
                    displayOutfitNumber,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: 16, // Font size 16
                      color: Colors.black, // Text color black
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomContainer() {
    return Container(
      width: 360,
      // Fixed width set to 250
      height: 320,
      // Fixed height set to 300// Takes the full width of the screen
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      // Outer padding
      decoration: BoxDecoration(
        color: appTheme.blueGray100, // Background color
        borderRadius: BorderRadius.circular(20), // Rounded borders
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        // Aligns children to center horizontally
        children: [
          _buildInfoContainer('Outfit for weather', 18),
          // Info container for 'Outfit for weather'
          SizedBox(height: 10),
          _buildPlaceholderIcon(),
          // Placeholder for the image
          SizedBox(height: 10),
          _buildInfoContainer('Recommend:', 14),
          SizedBox(height: 10),
          _buildInfoContainer('Weather is Cold, Wear a Longsleeve', 14),
          // Info container for recommendation
        ],
      ),
    );
  }

  Widget _buildInfoContainer(String text, double fontSize) {
    return Container(
      padding: EdgeInsets.all(10), // Padding inside the container
      decoration: BoxDecoration(
        color: Colors.white, // White background for the text container
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      child: Text(
        text,
        textAlign: TextAlign.center, // Centers the text
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
          color: Colors.black, // Setting text color to black
        ),
      ),
    );
  }

  Widget _buildPlaceholderIcon() {
    return Container(
      height: 100, // Fixed height for the icon container
      width: 100, // Fixed width for the icon container
      decoration: BoxDecoration(
        color: Colors.grey[300], // Placeholder color
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      child: Icon(
        Icons.image, // Placeholder icon
        size: 50, // Icon size
        color: Colors.grey,
      ),
    );
  }
}

List<String> _getCurrentWeekDays() {
  DateTime now = DateTime.now();
  int currentDayOfWeek = now.weekday;
  DateTime monday = now.subtract(Duration(days: currentDayOfWeek - 1));
  return List.generate(7,
      (index) => DateFormat('EEE').format(monday.add(Duration(days: index))));
}

/// Common widget
Widget _buildFrame(
  BuildContext context, {
  required String wed,
  required String frame,
}) {
  return Column(children: [
    Container(
        width: 64.h,
        padding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 3.v),
        decoration: AppDecoration.fillGray
            .copyWith(borderRadius: BorderRadiusStyle.customBorderTL20),
        child: Text(wed,
            style: CustomTextStyles.bodySmallBlack900
                .copyWith(color: appTheme.black990))),
    Container(
        width: 64.h,
        padding: EdgeInsets.symmetric(horizontal: 26.h, vertical: 9.v),
        decoration: AppDecoration.fillBlueGray
            .copyWith(borderRadius: BorderRadiusStyle.customBorderBL20),
        child: Text(
          frame,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontSize: 16, // Font size 16
            color: Colors.black, // Text color black
          ),
        ))
  ]);
}

/// Navigates to the frame981Screen when the action is triggered.
onTapBtnCalendar(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.calendar_page);
}

class GoogleHttpClient extends http.BaseClient {
  final Map<String, String> _headers;

  final http.Client _client = http.Client();

  GoogleHttpClient(this._headers);

  Future<http.StreamedResponse> send(http.BaseRequest request) {
    return _client.send(request..headers.addAll(_headers));
  }
}
