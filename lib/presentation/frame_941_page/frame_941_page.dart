import 'package:flutter/material.dart';
import 'package:sdgp_test01/core/app_export.dart';

// ignore_for_file: must_be_immutable
class Frame941Page extends StatefulWidget {
  const Frame941Page({Key? key})
      : super(
          key: key,
        );

  @override
  Frame941PageState createState() => Frame941PageState();
}

class Frame941PageState extends State<Frame941Page>
    with AutomaticKeepAliveClientMixin<Frame941Page> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 48.v),
                Container(
                  margin: EdgeInsets.only(
                    left: 36.h,
                    right: 46.h,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 13.h,
                    vertical: 15.v,
                  ),
                  decoration: AppDecoration.fillBlueGray.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder20,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 14.v),
                      Container(
                        width: 108.h,
                        margin: EdgeInsets.only(right: 144.h),
                        padding: EdgeInsets.symmetric(
                          horizontal: 9.h,
                          vertical: 4.v,
                        ),
                        decoration: AppDecoration.fillWhiteA.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder5,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 1.v),
                            Text(
                              "Outfit for weather",
                              style: theme.textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 13.v),
                      Container(
                        height: 141.v,
                        width: 179.h,
                        margin: EdgeInsets.only(left: 31.h),
                        decoration: BoxDecoration(
                          color: appTheme.whiteA700,
                          borderRadius: BorderRadius.circular(
                            10.h,
                          ),
                        ),
                      ),
                      SizedBox(height: 18.v),
                      Container(
                        width: 228.h,
                        margin: EdgeInsets.only(
                          left: 6.h,
                          right: 18.h,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.h,
                          vertical: 4.v,
                        ),
                        decoration: AppDecoration.fillWhiteA.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder12,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Recommend: ",
                              style: theme.textTheme.bodySmall,
                            ),
                            SizedBox(height: 2.v),
                            Padding(
                              padding: EdgeInsets.only(left: 19.h),
                              child: Text(
                                "Weather is Cold, Wear a Longsleeve",
                                style: theme.textTheme.bodySmall,
                              ),
                            ),
                            SizedBox(height: 4.v),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

    );
  }
}
