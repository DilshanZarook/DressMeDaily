import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:DressMeDaily/core/app_export.dart';
import 'package:DressMeDaily/presentation/Calendar_page/Calendar_page.dart';
import 'dart:convert';
import 'package:DressMeDaily/presentation/Plan_Page/widgets/video_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Plan_page extends StatefulWidget {
  const Plan_page({Key? key}) : super(key: key);

  @override
  Plan_pageState createState() => Plan_pageState();
}

class Plan_pageState extends State<Plan_page> {
  TextEditingController monController = TextEditingController();
  ScrollController scrollController = ScrollController();
  String currentDate = DateFormat('MM/dd/yyyy').format(DateTime.now());
  String TopWearImageUrl = '';
  String BottomWearImageUrl = '';
  String outfitNumber = 'Outfit 01';
  bool shouldShowSyncSection = true;
  late String currentDay;
  late String currentMonth;
  double? roundedTemp; // Make it nullable// Initialize with a default value, e.g., 0
  late DateTime selectedDate;
  DateTime specificCurrentDate = DateTime.now(); // Set this to your specific date
  List<String> weekDays = [];
  String eventDate = '';
  String outfitName = '';
  double imageWidth = 100.0;
  double imageHeight = 100.0;
  String eventDescription = '';

  @override
  void initState() {
    super.initState();
    weekDays = _getCurrentWeekDays();
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToCurrentDate());
    currentDay = DateFormat('EEE').format(DateTime.now());
    currentMonth = DateFormat('MMM').format(DateTime.now());
    _fetchWeatherData(selectedDate = DateTime.now());
    _fetchOutfitDataForDate(DateTime.now());
    _fetchOutfitData(DateTime.now());
    _getUserEventDetails(); // Fetch user event details
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

  void _getUserEventDetails() async {
    try {
      QuerySnapshot snapshot = (await FirebaseFirestore.instance
          .collection('UserEventDetails')
          .get());

      if (snapshot.docs.isNotEmpty) {
        Map<String, dynamic> data =
        snapshot.docs.first.data() as Map<String, dynamic>;
        setState(() {
          eventDate = data['EventDate'] ?? '';
          eventDescription = data['EventDescription'] ?? '';
          TopWearImageUrl = data['topWear'] ?? '';
          BottomWearImageUrl = data['bottomWear'] ?? '';
          outfitName = data['outfitName'] ?? '';
        });
      } else {
        setState(() {
          eventDate = 'No event available';
          eventDescription = 'None';
          TopWearImageUrl = '';
          BottomWearImageUrl = '';
          outfitName = '';
        });
      }
    } catch (error) {
      print('Error fetching user event details: $error');
      setState(() {
        eventDate = 'Error fetching event details';
        TopWearImageUrl = '';
        BottomWearImageUrl = '';
        outfitName = '';
      });
    }
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

  void _fetchOutfitData(DateTime date) async {
    FirebaseFirestore.instance
        .collection('UserEventDetails')
        .where('Date', isEqualTo: DateFormat('MM/dd/yyyy').format(date))
        .limit(1)
        .get()
        .then((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        var doc = snapshot.docs.first;
        setState(() {
          TopWearImageUrl = doc['TopClothingImageUrl'] ?? '';
          BottomWearImageUrl = doc['BottomClothingImageUrl'] ?? '';
          outfitNumber = doc['OutfitNumber'] ?? 'Outfit 01';
        });
      }
    })
        .catchError((error) {
      print("Error fetching outfit data: $error");
    });
  }

  void _fetchOutfitDataForDate(DateTime date) async {
    var formattedDate = DateFormat('MM/dd/yyyy').format(date);
    var snapshot = await FirebaseFirestore.instance
        .collection('UserEventDetails')
        .where('EventDate', isEqualTo: formattedDate)
        .limit(1)
        .get();

    if (snapshot.docs.isNotEmpty) {
      var doc = snapshot.docs.first;
      setState(() {
        TopWearImageUrl = doc['TopWearImageUrl'] ?? '';
        BottomWearImageUrl = doc['BottomWearImageUrl'] ?? '';
        // Update other necessary fields if required
      });
    } else {
      // Handle the scenario when there are no outfits for the selected date
      setState(() {
        TopWearImageUrl = ''; // Default or placeholder image
        BottomWearImageUrl = ''; // Default or placeholder image
      });
    }
  }

  Future<void> _fetchWeatherData(DateTime date) async {
    final apiKey = "629de998a0f95d7b9dfdcd1dc96656ee"; // Make sure the API key is valid
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
          final tempCelsius = temp - 273.15; // Convert Kelvin to Celsius
          roundedTemp = tempCelsius.round().toDouble(); // Update the roundedTemp state
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
            _buildBottomContainer(),
            SizedBox(height: 56),
            _buildOutfitSection(TopWearImageUrl, BottomWearImageUrl,
                outfitName, eventDate),
            SizedBox(height: 19),
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
                    fontSize: 16,
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

  Widget getRecommendation() {
    if (roundedTemp == null) {
      return SizedBox.shrink(); // Return an empty widget if roundedTemp is null
    } else {
      String recommendation;
      if (roundedTemp! >= 30) {
        recommendation = "It's hot outside. Wear light clothing!";
      } else if (roundedTemp! >= 20 && roundedTemp! < 30) {
        recommendation = "It's a bit warm. Perfect for summer wear!";
      } else if (roundedTemp! >= 10 && roundedTemp! < 20) {
        recommendation = "Cool weather. How about a light jacket?";
      } else if (roundedTemp! >= 0 && roundedTemp! < 10) {
        recommendation = "Quite cold. You should wear a winter jacket!";
      } else {
        recommendation = "It's freezing! Stay warm and bundled up!";
      }

      return Text(
        recommendation,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: Colors.black,
        ),
      );
    }
  }

  Widget getTemperatureWidget() {
    if (roundedTemp == null) {
      return Text("Loading...");
    } else {
      return Text(
        "${roundedTemp!.toStringAsFixed(1)}°C",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: Colors.black,
        ),
      );
    }
  }
  void _showEventDetailsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Calculate the size based on the screen width
        var size = MediaQuery.of(context).size;
        final double imageWidth = size.width * 0.35; // 50% of the screen width for images
        final double imageHeight = size.width * 0.5; // keeping the image square

        // Define the image widgets
        Widget topClothingImageWidget = TopWearImageUrl.isNotEmpty
            ? Image.network(TopWearImageUrl, width: imageWidth, height: imageHeight, fit: BoxFit.cover)
            : SvgPicture.asset('assets/images/default_top_clothing.svg', width: imageWidth, height: imageHeight, fit: BoxFit.cover); // Replace with actual default image path

        Widget bottomClothingImageWidget = BottomWearImageUrl.isNotEmpty
            ? Image.network(BottomWearImageUrl, width: imageWidth, height: imageHeight, fit: BoxFit.cover)
            : SvgPicture.asset('assets/images/default_bottom_clothing.svg', width: imageWidth, height: imageHeight, fit: BoxFit.cover); // Replace with actual default image path

        return AlertDialog(
          title: Center(child: Text('Event Details')),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Center(child: Text('Event Date: $eventDate')),
                SizedBox(height: 10),
                Center(child: Text('Event Title: $outfitName')),
// Centering the event description
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Use spaceEvenly for even spacing
                  children: <Widget>[
                    // ConstrainedBox ensures the image does not exceed the screen width
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: imageWidth,
                        maxHeight: imageHeight,
                      ),
                      child: topClothingImageWidget,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: imageWidth,
                        maxHeight: imageHeight,
                      ),
                      child: bottomClothingImageWidget,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Center(child: Text('Outfit Name: $outfitName')),
                SizedBox(height: 10),
                Center(child: Text('Event Description: $eventDescription')), // Centering the outfit name text
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close', textAlign: TextAlign.center), // Centering the 'Close' button text
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }




  Widget _buildOutfitSection(String topClothingImageUrl, String bottomClothingImageUrl, String outfitName, String eventDate) {
    String displayEventDate = eventDate.isNotEmpty ? eventDate : "Loading date...";

    bool isTopImageUrlValid = Uri.tryParse(topClothingImageUrl)?.hasAbsolutePath ?? false;
    bool isBottomImageUrlValid = Uri.tryParse(bottomClothingImageUrl)?.hasAbsolutePath ?? false;

    Widget topClothingImageWidget = isTopImageUrlValid
        ? Image.network(topClothingImageUrl, fit: BoxFit.cover)
        : SvgPicture.asset('assets/images/img_user_gray_500_01.svg', fit: BoxFit.cover);

    Widget bottomClothingImageWidget = isBottomImageUrlValid
        ? Image.network(bottomClothingImageUrl, fit: BoxFit.cover)
        : SvgPicture.asset('assets/images/socks_plan.svg', fit: BoxFit.cover);

    String displayOutfitName = outfitName.isNotEmpty ? outfitName : "None";

    return GestureDetector(
        onTap: () => _showEventDetailsDialog(context),
    child: Container(
      height: 300.v,
      width: 300.h,
      margin: EdgeInsets.only(left: 30.h, right: 30.h),
      padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 10.v),
      decoration: AppDecoration.fillcontainer.copyWith(borderRadius: BorderRadiusStyle.roundedBorder12),
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
                  displayEventDate,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
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
                  )),

            ],
          ),          SizedBox(height: 10.h),


          Expanded(
            child: Container(
              width: 200.h,
              height: 120.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: topClothingImageWidget,
                    ),
                  ),
                  SizedBox(width: 10.h),
                  Flexible(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: bottomClothingImageWidget,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 80.h,
              height: 30.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.only(right: 0.h),
                child: Center(
                  child: Text(
                    displayOutfitName,
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
    ));
  }
  Widget _buildBottomContainer() {
    return Container(
      width: 400,
      height: 400,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: Color(0xFF9d9d9d),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildInfoContainer('Outfit for weather', 18),
          SizedBox(height: 20),
          Container(
            height: 120, // Set height to 40
            width: 120, // Set width to 40
            child: TemperatureBasedVideoWidget(temperature: roundedTemp ?? 0.0),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(10), // Padding inside the container
            decoration: BoxDecoration(
              color: Colors.white, // Background color of the container
              borderRadius: BorderRadius.circular(10), // Border radius of 10
              boxShadow: [ // Optional: if you want to add shadow
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: _buildInfoContainer('Current Temperature:', 14, getTemperatureWidget()),
                ),
                SizedBox(height: 5),

                Divider(
                  thickness: 1.h,
                  color: appTheme.black900,
                  indent: 100,
                  endIndent:100,
                ),
                SizedBox(height: 10),

                getRecommendation(),
                SizedBox(height: 10),

                ElevatedButton(
                  onPressed: () {
                    _fetchWeatherData(DateTime.now());
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5), // Adjust padding as needed
                    child: Text(
                      'Update Weather',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black, // Text color
                        // You can add more styling here if required
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),

              ],
            ),
          )

        ],
      ),
    );
  }

  Widget _buildInfoContainer(String text, double fontSize, [Widget? additionalWidget]) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
                color: Colors.black,
              ),
            ),
          ),
          if (additionalWidget != null) additionalWidget,
        ],
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
