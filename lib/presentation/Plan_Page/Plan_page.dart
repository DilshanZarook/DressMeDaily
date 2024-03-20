import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:sdgp_test01/presentation/Calendar_page/Calendar_page.dart';
import 'dart:convert';

class Plan_page extends StatefulWidget {
  const Plan_page({Key? key}) : super(key: key);

  @override
  Plan_pageState createState() => Plan_pageState();
}

class Plan_pageState extends State<Plan_page> {
  TextEditingController monController = TextEditingController();
  ScrollController scrollController = ScrollController();
  String currentDate = DateFormat('MM/dd/yyyy').format(DateTime.now());
  String topClothingImageUrl = '';
  String bottomClothingImageUrl = '';
  String outfitNumber = 'Outfit 01';
  bool shouldShowSyncSection = true;
  late String currentDay;
  late String currentMonth;
  late String roundedTemp = "";
  late DateTime selectedDate;
  DateTime specificCurrentDate = DateTime.now(); // Set this to your specific date
  List<String> weekDays = [];

  @override
  void initState() {
    super.initState();
    weekDays = _getCurrentWeekDays();
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToCurrentDate());
    currentDay = DateFormat('EEE').format(DateTime.now());
    currentMonth = DateFormat('MMM').format(DateTime.now());
    _fetchWeatherData(selectedDate = DateTime.now());
  }

  List<String> _getCurrentWeekDays() {
    List<String> weekDays = [];
    DateTime today = DateTime.now();
    DateTime startOfWeek = today.subtract(Duration(days: today.weekday - 1));
    for (int i = 0; i < 7; i++) {
      weekDays.add(DateFormat('EEE').format(startOfWeek.add(Duration(days: i))));
    }
    return weekDays;
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


  @override
  void dispose() {
    monController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  void _fetchOutfitData() async {
    setState(() {
      topClothingImageUrl =
          'assets/images/img_filled_appointment_reminders.png';
      bottomClothingImageUrl =
          'assets/images/img_filled_appointment_reminders.png';
      outfitNumber = 'Outfit 01';
    });
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

  Widget _buildDateCarousel(List<String> weekDays, DateTime specificCurrentDate) {
    DateTime today = DateTime.now();
    DateTime startOfWeek = today.subtract(Duration(days: today.weekday - 1));
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: weekDays.asMap().entries.map((entry) {
          int index = entry.key;
          DateTime dayDate = startOfWeek.add(Duration(days: index));
          String dayOfWeek = DateFormat('EEE').format(dayDate);
          return Padding(
            padding: EdgeInsets.only(right: index < weekDays.length - 1 ? 15.0 : 0.0),
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
                  dayOfWeek,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
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
                  DateFormat('MM/dd/yyyy').format(dayDate) == DateFormat('MM/dd/yyyy').format(today)
                      ? "Today"
                      : dayDate.day.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
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



  Widget _buildOutfitSection(String topClothingImageUrl,
      String bottomClothingImageUrl, String outfitNumber) {

    String currentDate = DateFormat('MM/dd/yyyy').format(DateTime.now());

    bool isTopImageUrlValid =
        Uri.tryParse(topClothingImageUrl)?.hasAbsolutePath ?? false;
    bool isBottomImageUrlValid =
        Uri.tryParse(bottomClothingImageUrl)?.hasAbsolutePath ?? false;

    Widget topClothingImageWidget = isTopImageUrlValid
        ? Image.network(topClothingImageUrl, fit: BoxFit.cover)
        : Image.asset('assets/images/img_filled_appointment_reminders.png',
            fit: BoxFit.cover);

    Widget bottomClothingImageWidget = isBottomImageUrlValid
        ? Image.network(bottomClothingImageUrl, fit: BoxFit.cover)
        : Image.asset('assets/images/img_filled_appointment_reminders.png',
            fit: BoxFit.cover);

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
                    color: Colors.black,
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
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(10),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 1),
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
                        child: SvgPicture.asset(
                          'assets/images/img_calendar.svg',
                          width: 50.0,
                          height: 50.0,
                        ),
                      ),
                    ),
                  ))
            ],
          ),
          Expanded(
            child: Container(
              width: 200.h,
              height: 120.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  topClothingImageWidget,
                  SizedBox(width: 10.h),
                  bottomClothingImageWidget,
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 80.h,
              height: 30.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.only(right: 0.h),
                child: Center(
                  child: Text(
                    displayOutfitNumber,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: 16,
                      color: Colors.black,
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
      height: 320,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: appTheme.blueGray100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildInfoContainer('Outfit for weather', 18),
          SizedBox(height: 10),
          _buildPlaceholderIcon(),
          SizedBox(height: 10),
          _buildInfoContainer('Recommend:', 14),
          SizedBox(height: 10),
          _buildInfoContainer('Weather is Cold, Wear a Longsleeve', 14),
        ],
      ),
    );
  }

  Widget _buildInfoContainer(String text, double fontSize) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildPlaceholderIcon() {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        Icons.image,
        size: 50,
        color: Colors.grey,
      ),
    );
  }
}

List<String> _getCurrentWeekDays() {
  DateTime now = DateTime.now();
  int currentDayOfWeek = now.weekday;

  // Subtract days to get to the start of the week (Monday)
  DateTime startOfWeek = now.subtract(Duration(days: currentDayOfWeek - 1));

  // Generate a list for the week that starts with the current day
  return List.generate(7, (index) {
    DateTime weekDay = startOfWeek.add(Duration(days: index));
    return DateFormat('EEE').format(weekDay);
  });
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