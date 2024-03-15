import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Landing_page_2 extends StatelessWidget {
  const Landing_page_2({Key? key})
      : super(
          key: key,
        );

  Future<List<String>> getFirebaseImages() async {
    String folderPath = "Online_Shops";
    firebase_storage.ListResult result = await firebase_storage
        .FirebaseStorage.instance
        .ref(folderPath)
        .listAll();
    List<String> imageUrls = [];

    for (var i in result.items) {
      String downloadedURL = await i.getDownloadURL();
      imageUrls.add(downloadedURL);
    }

    return imageUrls;
  }

  Future<void> _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView)) {
      throw 'Could not launch $url';
    } 
  }

 

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getFirebaseImages(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<String> imageUrls = snapshot.data as List<String>;

          // The existing content of Frame325Screen
          return Container(
            height: 655.v,
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 1.v),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Transform.translate(
                    offset: Offset(0, -10.v),
                    // Move the container 10.v units upwards. Adjust the value as needed.
                    child: Container(
                      height: 580.v,
                      width: 300.h,
                      decoration: BoxDecoration(
                        color: appTheme.gray80001,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(40.h),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 19.h,
                      top: 10.v, // Reduced top padding
                      right: 19.h,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 10.v),
                        SizedBox(
                          width: 240.h,
                          child: Text(
                            "Currently trending for the week",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: theme.textTheme.titleLarge,
                          ),
                        ),
                        SizedBox(height: 25.v),
                        Card(
                          clipBehavior: Clip.antiAlias,
                          elevation: 25,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusStyle.roundedBorder50,
                          ),
                          child: Container(
                            height: 150.v,
                            width: 240.h,
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.h, vertical: 18.v),
                            decoration: BoxDecoration(
                              color:
                                  appTheme.gray80001, // Card background color
                              borderRadius: BorderRadiusStyle.roundedBorder50,
                              border: Border.all(
                                color: Colors.white, // Border color
                                width: 2.h, // Border width
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.5),
                                  // Use plain white color for testing
                                  spreadRadius: 5.h,
                                  // Modest spread radius
                                  blurRadius: 10.h,
                                  // Modest blur radius
                                  offset: Offset(0, 4.h), // Standard offset
                                ),
                              ],
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                CarouselSlider(
                                  options: CarouselOptions(
                                    height: 100.v,
                                    enlargeCenterPage: true,
                                    autoPlay: true,
                                    aspectRatio: 16 / 9,
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    enableInfiniteScroll: true,
                                    autoPlayAnimationDuration:
                                        Duration(milliseconds: 400),
                                    viewportFraction: 0.7,
                                  ),
                                  items:
                                      imageUrls.reversed.map((downloadedURL) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return InkWell(
                                            onTap: () {
                                              _launchURL(
                                                  'https://odel.lk/home');
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 5.0),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20.h),
                                                // Adjust as needed
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      downloadedURL),
                                                  // Assuming 'i' is the path to the image asset
                                                  fit: BoxFit
                                                      .cover, // Adjust the fit as needed
                                                ),
                                              ),
                                              height: 226.v,
                                            ) // Adjust the width as needed
                                            );
                                      },
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 25.v),
                        Container(
                          width: 237.h,
                          margin: EdgeInsets.only(
                            left: 20.h,
                            right: 19.h,
                          ),
                          child: Text(
                            "Outfit styles which may go with your style",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24, // Set the font size to 24
                              color:
                                  Colors.white, // Set the text color to white
                              // You can add other styling attributes if needed
                            ),
                          ),
                        ),
                        SizedBox(height: 15.v),
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 220.v,
                            enlargeCenterPage: true,
                            autoPlay: true,
                            aspectRatio: 16 / 9,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enableInfiniteScroll: true,
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 700),
                            viewportFraction: 0.7,
                          ),
                          items: imageUrls.map((downloadedURL) {
                            return Builder(
                              builder: (BuildContext context) {
                                return InkWell(
                                            onTap: () {
                                              _launchURL(
                                                  'https://odel.lk/home');
                                            },
                                child:  Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.h),
                                    // Adjust as needed
                                    image: DecorationImage(
                                      image: NetworkImage(downloadedURL),
                                      // Assuming 'i' is the path to the image asset
                                      fit: BoxFit
                                          .cover, // Adjust the fit as needed
                                    ),
                                  ),
                                  height: 226.v, // Adjust the width as needed
                                )
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

class YourWidget extends StatelessWidget {
  final List<String> imageUrls; // Add this line
    Future<void> _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }


  YourWidget({required this.imageUrls}); // Add this constructor

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 252.v,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      items: imageUrls.map((downloadedURL) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () async {
                _launchURL('https://mimosaforever.com/');
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.h), // Adjust as needed
                  image: DecorationImage(
                    image: NetworkImage(
                        downloadedURL), // Assuming 'i' is the path to the image asset
                    fit: BoxFit.cover, // Adjust the fit as needed
                  ),
                ),
                height: 226.v, // Adjust the width as needed
              ),
            );
            
          },
        );
      }).toList(),
    );
  }
}
