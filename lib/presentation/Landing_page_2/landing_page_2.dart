import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Landing_page_2 extends StatelessWidget {
  const Landing_page_2({Key? key})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
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
                        color: appTheme.gray80001, // Card background color
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
                        alignment: Alignment.centerRight,
                        children: [
                          Container(
                            height: 66.v,
                            width: 120.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.h),
                              image: DecorationImage(
                                image: AssetImage(ImageConstant.img110),
                                fit: BoxFit
                                    .cover, // You can adjust this to change how the image fits within the container
                              ),
                            ),
                          ),
                          Container(
                            height: 75.v,
                            width: 160.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.h),
                              image: DecorationImage(
                                image: AssetImage(ImageConstant.img110),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            height: 90.v,
                            width: 160.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.h),
                              image: DecorationImage(
                                image: AssetImage(ImageConstant.img110),
                                fit: BoxFit.cover,
                              ),
                            ),
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
                        color: Colors.white, // Set the text color to white
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
                      autoPlayAnimationDuration: Duration(milliseconds: 700),
                      viewportFraction: 0.7,
                    ),
                    items: [
                      ImageConstant.imgBalenciagaT1,
                      ImageConstant.imgClooDmd1,
                      ImageConstant.imgCloooDmd11,
                      ImageConstant.imgDsc03887540x1,
                      ImageConstant.imgDeangeloturtlen,
                    ].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.h),
                              // Adjust as needed
                              image: DecorationImage(
                                image: AssetImage(i),
                                // Assuming 'i' is the path to the image asset
                                fit: BoxFit.cover, // Adjust the fit as needed
                              ),
                            ),
                            height: 226.v, // Adjust the width as needed
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
}
class YourWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 252.v,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16/9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      items: [
        ImageConstant.imgBalenciagaT1,
        ImageConstant.imgClooDmd1,
        ImageConstant.imgCloooDmd11,
        ImageConstant.imgDsc03887540x1,
        ImageConstant.imgDeangeloturtlen,
      ].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.h), // Adjust as needed
                image: DecorationImage(
                  image: AssetImage(i), // Assuming 'i' is the path to the image asset
                  fit: BoxFit.cover, // Adjust the fit as needed
                ),
              ),
              height: 226.v,// Adjust the width as needed
            );
          },
        );
      }).toList(),
    );
  }
}
